//
//  CategoryModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation
import SwiftData

struct CategoryModel: Identifiable {
    let id: Int
    let name: String
    let emoji: String
}

@Model
class CategoryEntity {
  @Attribute(.unique) var name: String
  var emoji: String
  
  @Relationship(inverse: \FeedEntity.category)
  var feeds = [FeedEntity]()
  
  @Relationship(inverse: \TagEntity.category)
  var tags = [TagEntity]()
  
  init(name: String, emoji: String) {
    self.name = name
    self.emoji = emoji
  }
}
