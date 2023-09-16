//
//  ScreenSizeStore.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI
import Observation

@Observable final class ScreenSizeStore {
  private(set) var screenWidth: CGFloat
  private(set) var screenHeight: CGFloat
  
  init() {
    let screenBounds: CGRect
    if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      screenBounds = window.screen.bounds
    }
    else {
      screenBounds = UIScreen.main.bounds
    }
    
    self.screenWidth = screenBounds.width
    self.screenHeight = screenBounds.height
  }
  
  func update(width: CGFloat, height: CGFloat) {
    self.screenWidth = width
    self.screenHeight = height
  }
}
