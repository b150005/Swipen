//
//  DataModel.swift
//  Swipen
//
//  Created by 伊藤直輝 on 2023/10/07.
//

import Foundation
import SwiftData

// MARK: - Learning History

@Model final class LearningHistory {
  @Attribute(.unique) var dateInt: UInt32
  var content: LearningContent
  
  init(dateInt: UInt32, content: LearningContent) {
    self.dateInt = dateInt
    self.content = content
  }
}

// MARK: - Learning Content

@Model final class LearningContent {
  @Attribute(.unique) var id: UInt32
  var tag: [Tag]
  var sentence: Sentence
  var phrases: [Phrase]
  var isFavorite: Bool
  
  init(id: UInt32, tag: [Tag], sentence: Sentence, phrases: [Phrase], isFavorite: Bool) {
    self.id = id
    self.tag = tag
    self.sentence = sentence
    self.phrases = phrases
    self.isFavorite = isFavorite
  }
}

// MARK: - Content

@Model final class Sentence {
  @Attribute(.unique) var id: UInt32
  var phrase: Phrase
  var isFavorite: Bool
  
  init(id: UInt32, phrase: Phrase, isFavorite: Bool) {
    self.id = id
    self.phrase = phrase
    self.isFavorite = isFavorite
  }
}

@Model final class Phrase {
  @Attribute(.unique) var id: UInt32
  var ja: String
  var en: String
  var isFavorite: Bool
  
  init(id: UInt32, ja: String, en: String, isFavorite: Bool) {
    self.id = id
    self.ja = ja
    self.en = en
    self.isFavorite = isFavorite
  }
}

// MARK: - Tag

@Model final class Tag {
  @Attribute(.unique) var id: UInt16
  var name: String
  var isFavorite: Bool
  
  init(id: UInt16, name: String, isFavorite: Bool) {
    self.id = id
    self.name = name
    self.isFavorite = isFavorite
  }
}
