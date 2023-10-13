//
//  SwipenApp.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/02.
//

import SwiftUI
import SwiftData

@main
struct SwipenApp: App {
  @State private var screenSizeStore = ScreenSizeStore()
  
  var body: some Scene {
    WindowGroup {
      ContentTabView()
        .environment(screenSizeStore)
        .modelContainer(for: [
          LearningHistory.self,
          LearningContent.self,
          Sentence.self,
          Phrase.self, 
          Tag.self,
        ])
    }
  }
}
