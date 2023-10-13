//
//  GaugeProgressStyle.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI

extension GeometryProxy: @unchecked Sendable {}

struct GaugeProgressStyle: ProgressViewStyle {
  @Environment(ScreenSizeStore.self) private var screenSizeStore: ScreenSizeStore?
  @State private var current: Int
  @State private var total: Int
  @State private var textLabelSize: CGSize = .zero
  
  private let lineWidth: CGFloat = 8.0
  private var displayWidth: CGFloat {
    get {
      let scale: CGFloat = 1.3
      let padding: CGFloat = 60.0
      
      // ここで登場する60はpaddingの default値 * 2 より大きい値であれば何でも良いが、
      // paddingのdefault値はシステム依存であり詳細な値が判明していないため60で仮置きしている
      return (textLabelSize.width * scale) >= (screenWidth - padding) ?
        .infinity : textLabelSize.width * scale
    }
  }
  
  private var screenWidth: CGFloat {
    if let screenSizeStore {
      return screenSizeStore.size.width
    }
    else {
      return UIScreen.main.bounds.width
    }
  }
  
  init(current: Int, total: Int) {
    self.current = current
    self.total = total
  }
  
  func makeBody(configuration: Configuration) -> some View {
    let fractionCompleted: Double = configuration.fractionCompleted ?? .zero
    
    return ZStack {
      Group {
        Circle()
          .stroke(.blue.opacity(0.3), lineWidth: lineWidth)
        Circle()
          .trim(from: .zero, to: fractionCompleted)
          .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
          .foregroundStyle(.blue)
          .rotationEffect(.degrees(-90.0))
      }
      .frame(width: displayWidth)
      
      Text("\(current) / \(total)")
        .font(.largeTitle)
        .bold()
        .background() {
          GeometryReader { (geometry: GeometryProxy) in
            Path { (path: inout Path) in
              let size: CGSize = geometry.size
              Task { @MainActor in
                if textLabelSize != size {
                  textLabelSize = geometry.size
                }
              }
            }
          }
        }
    }
  }
}

#Preview {
  CardView {
    ProgressView(value: 64.0, total: 100.0)
      .progressViewStyle(GaugeProgressStyle(current: 64, total: 100))
  }
  .environment(ScreenSizeStore())
}
