//
//  ContentView.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI
import Observation

struct ContentView: View {
  @Environment(ScreenSizeStore.self) private var screenSizeStore: ScreenSizeStore?
  
  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ContentRootView()
        .onAppear {
          screenSizeStore?.update(width: geometry.size.width, height: geometry.size.height)
        }
        .onChange(of: geometry.size) {
          screenSizeStore?.update(width: geometry.size.width, height: geometry.size.height)
        }
    }
  }
}

#Preview {
  ContentView()
    .environment(ScreenSizeStore())
}
