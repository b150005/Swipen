//
//  ContentTabView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/02.
//

import SwiftUI

struct ContentTabView: View {
  @State var selection: Int = 0
  
  var body: some View {
    TabView(selection: $selection) {
      DashboardView()
        .tabItem {
          Label("学習を始める", systemImage: "hand.point.up.left.fill")
        }
        .tag(0)
      ContentListView()
        .tabItem {
          Label("リストを見る", systemImage: "list.clipboard.fill")
        }
        .tag(1)
    }
  }
}

#Preview {
  ContentTabView()
    .environment(ScreenSizeStore())
}
