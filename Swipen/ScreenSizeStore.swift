//
//  ScreenUtil.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/13.
//

import SwiftUI

struct ScreenUtil {
  @Environment(\.displayScale) private var displayScale: CGFloat
  func min(_ val: CGFloat) -> CGFloat {
    return val > displayScale ? .infinity : val
  }
}
