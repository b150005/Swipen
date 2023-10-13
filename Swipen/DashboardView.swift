//
//  DashboardView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/10.
//

import SwiftUI

struct DashboardView: View {
  
  var body: some View {
    VStack {
      HistoryCalenderView()
      
      ScrollView(.vertical, showsIndicators: false) {
        // TODO: Progress ViewをTapした時の挙動
        // TODO: Progress Viewへの値渡し
        CardView {
          ProgressView(value: 64, total: 100) {
            Text("Label")
          } currentValueLabel: {
            Text("Current Value Label")
          }
        }
      }
      .padding(.top)
      .zIndex(-1.0)
    }
  }
}

#Preview {
  DashboardView()
    .environment(ScreenSizeStore())
}
