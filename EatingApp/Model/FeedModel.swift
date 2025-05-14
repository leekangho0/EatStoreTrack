//
//  FeedModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation
import SwiftData

struct FeedModel: Identifiable {
    let id: Int
    let content: String
    let category_id: Int
    let use_yn: String
    let create_date: String
    let update_date: String
    let tags: [TagModel]
}

@Model
class FeedEntity {
  @Attribute(.unique) var id: String
  var content: String
  var category: CategoryEntity
  var useYN: Bool
  var createdDate: Date
  var updatedDate: Date
  var tags: [TagEntity]
  
  @Attribute(.externalStorage)
  var image: Data?
  
  init(content: String, category: CategoryEntity, tags: [TagEntity], image: Data? = nil) {
    self.content = content
    self.id = UUID().uuidString
    self.category = category
    self.useYN = true
    self.createdDate = Date()
    self.updatedDate = Date()
    self.tags = tags
    self.image = nil
  }
}
