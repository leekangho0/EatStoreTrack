//
//  SampleData+Feed.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation
import SwiftData

extension FeedEntity {
  static func insertSampleData(modelContext: ModelContext) {
    let tagEntity: [TagEntity] = [.coffee, .dumbling, .multiVitamin, .noodle,
     .ramen, .ramen, .sushi, .tea, .chicken]
    
      tagEntity.forEach { tag in
       modelContext.insert(tag)
      }
    
    let feedEntities: [FeedEntity] = [.americano, .chicken, .multiVitamin,
      .noodle, .ramen, .tea, .sushiAndDumbling]
    
    feedEntities.forEach { entity in
      modelContext.insert(entity)
    }
  }
}
