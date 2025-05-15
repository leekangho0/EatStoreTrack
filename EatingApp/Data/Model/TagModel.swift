//
//  TagModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation
import SwiftData

struct TagModel: Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let category_id: Int
    let use_yn: String
}

@Model
class TagEntity {
  @Attribute(.unique) var id: String
  var name: String
  var emoji: String
  
  var feeds = [FeedEntity]()
  
  var category: Category.RawValue
  
  init(name: String, emoji: String, category: Category) {
    self.name = name
    self.emoji = emoji
    self.id = UUID().uuidString
    self.category = category.rawValue
  }
}
