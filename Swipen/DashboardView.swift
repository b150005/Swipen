//
//  DashboardView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/10.
//

import SwiftUI

struct DashboardView: View {
  private var topAreaHeight: CGFloat {
    get {
      // TODO: Geometry Readerを使って取得
      return 100.0
    }
  }
  
  var body: some View {
    ZStack(alignment: .top) {
      ScrollView(.vertical, showsIndicators: false) {
        // TODO: Progress ViewをTapした時の挙動
        CardView {
          ProgressView(value: 64, total: 100) {
            Text("Label")
          } currentValueLabel: {
            Text("Current Value Label")
          }
        }
      }
      .padding(.top, topAreaHeight)
      
      HistoryCalenderView()
    }
  }
}

#Preview {
  DashboardView()
    .environment(ScreenSizeStore())
}
