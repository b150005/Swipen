//
//  CardView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/10.
//

import SwiftUI

struct CardView<Content: View>: View {
  @Environment(ScreenSizeStore.self) private var screenSizeStore: ScreenSizeStore?
  @State private var contentSize: CGSize = .zero
  
  private var content: Content
  private var isFullWidth: Bool = false
  private var displayWidth: CGFloat {
    get {
      if isFullWidth {
        return .infinity
      }
      else {
        return contentSize.width > (screenSizeStore?.screenWidth ?? .infinity) ? .infinity : contentSize.width
      }
    }
  }
  
  init(expandsHorizontally: Bool = false, @ViewBuilder _ content: () -> Content) {
    self.isFullWidth = expandsHorizontally
    self.content = content()
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12.0)
        .foregroundStyle(Color("BackgroundColor"))
        .shadow(color: .gray.opacity(0.5), radius: 5.0)
        .frame(width: displayWidth, height: contentSize.height)
      content
        .padding()
        .background() {
          GeometryReader { (geometry: GeometryProxy) in
            Path { (path: inout Path) in
              let size: CGSize = geometry.size
              Task { @MainActor in
                if contentSize != size {
                  contentSize = geometry.size
                }
              }
            }
          }
        }
    }
    .padding(.horizontal)
  }
}

#Preview {
  ScrollView {
    CardView {
      VStack {
        Text("Hello, world!")
        Text("Hello!")
        Text("wow!")
      }
    }
    CardView(expandsHorizontally: true) {
      VStack {
        Text("Hello, world!")
        Text("Hello!")
        Text("wow!")
      }
    }
  }
  .environment(ScreenSizeStore())
}
