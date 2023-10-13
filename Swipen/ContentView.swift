//
//  ContentView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI

struct ContentView: View {
  @Environment(ScreenSizeStore.self) private var screenSizeStore: ScreenSizeStore
  
  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ContentTabView()
        .onAppear {
          screenSizeStore.update(rect: geometry.frame(in: .global))
        }
        .onChange(of: geometry.size) {
          screenSizeStore.update(rect: geometry.frame(in: .global))
        }
    }
  }
}

#Preview {
  ContentView()
    .environment(ScreenSizeStore())
}
