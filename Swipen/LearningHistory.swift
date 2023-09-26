//
//  LearningHistory.swift
//  Swipen
//
//  Created by 伊藤 直輝 on 2023/09/17.
//

import SwiftData

@Model
final class LearningHistory {
  @Attribute(.unique) var dateInt: UInt32
  var content: LearningContent
  
  init(dateInt: UInt32, content: LearningContent) {
    self.dateInt = dateInt
    self.content = content
  }
}

@Model
final class LearningContent {
  var ph: String
  init(ph: String) {
    self.ph = ph
  }
}
