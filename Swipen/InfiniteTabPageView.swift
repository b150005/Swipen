//
//  InfiniteTabPageView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/22.
//

import SwiftUI

struct InfiniteTabPageView<Content: View>: View {
  @Environment(ScreenSizeStore.self) private var screenSizeStore: ScreenSizeStore
  
  @GestureState private var translationX: CGFloat = .zero
  @State private var currentPage: UInt8 = .zero
  @State private var offsetX: CGFloat = .zero
  
  private let height: CGFloat
  
  private let content: (_ page: UInt8) -> Content
  
  private var screenWidth: CGFloat {
    get {
      return screenSizeStore.size.width
    }
  }
  
  private var dragGesture: some Gesture {
    DragGesture(minimumDistance: .zero)
      .updating($translationX) { (value: DragGesture.Value, state: inout CGFloat, _) in
        if hasNextPageAvailable(currentPage, with: value.translation.width) {
          state = offset(by: value.translation.width)
        }
      }
      .onEnded { (value: DragGesture.Value) in
        if hasNextPageAvailable(currentPage, with: value.translation.width) {
          offsetX = offset(by: value.translation.width)
          let predictedEndTranslationWidth: CGFloat = value.predictedEndTranslation.width
          
          // Paging
          withAnimation(.easeOut(duration: 0.25)) {
            if offsetX < -screenWidth / 4 || predictedEndTranslationWidth < -screenWidth {
              offsetX = -screenWidth
            }
            else if offsetX > screenWidth / 4 || predictedEndTranslationWidth > screenWidth {
              offsetX = screenWidth
            }
            else {
              offsetX = .zero
            }
            
            Task {
              try await Task.sleep(for: .seconds(0.25))
              if offsetX < .zero {
                currentPage -= 1
              }
              else if offsetX > .zero {
                currentPage += 1
              }
              offsetX = .zero
            }
          }
        }
      }
  }
  
  init(height: CGFloat, @ViewBuilder content: @escaping (_ page: UInt8) -> Content) {
    self.height = height
    self.content = content
  }
  
  var body: some View {
    ZStack {
      // Current
      content(currentPage)
        .offset(x: .zero)
      
      // Back
      content(currentPage + 1)
        .offset(x: -screenSizeStore.size.width)
      
      // Next
      if currentPage > .zero {
        content(currentPage - 1)
          .offset(x: screenSizeStore.size.width)
      }
    }
    .frame(width: screenSizeStore.size.width, height: height)
    .offset(x: translationX) // DragGestureによるOffset
    .offset(x: offsetX)     // Subviewの初期Offset
    .gesture(dragGesture)
  }
}

extension InfiniteTabPageView {
  private func offset(by drag: CGFloat) -> CGFloat {
    let screenWidth: CGFloat = screenSizeStore.size.width
    return min(screenWidth, max(-screenWidth, drag))
  }
  
  private func hasNextPageAvailable(_ currentPage: UInt8, with translationWidth: CGFloat) -> Bool {
    return (currentPage == .zero && translationWidth < .zero) ? false : true
  }
}

#Preview {
  InfiniteTabPageView(height: 85) { page in
    Text("\(page)")
  }
  .environment(ScreenSizeStore())
}
