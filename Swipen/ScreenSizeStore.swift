//
//  ScreenSizeStore.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI
import Observation

@Observable final class ScreenSizeStore {
  private(set) var screenRect: CGRect
  var size: CGSize {
    get {
      screenRect.size
    }
  }
  
  init() {
    let screenRect: CGRect
    if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      screenRect = window.screen.bounds
    }
    else {
      screenRect = UIScreen.main.bounds
    }
    
    self.screenRect = screenRect
  }
  
  func update(rect: CGRect) {
    self.screenRect = rect
  }
}
