//
//  SampleData+Feed.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation
import SwiftData

extension CategoryEntity {
  static let food = CategoryEntity(name: "음식", emoji: "🥗", imageName: "bob")
  static let pill = CategoryEntity(name: "영양제", emoji: "💊",  imageName: "drug")
  static let drink = CategoryEntity(name: "음료", emoji: "🥤",  imageName: "drink")

  static func insertSampleData(modelContext: ModelContext) {
    modelContext.insert(food)
    modelContext.insert(pill)
    modelContext.insert(drink)
    
    let tagsEntities: [TagEntity] = [.coffee, .dumbling, .multiVitamin, .noodle,
      .ramen, .ramen, .sushi, .tea, .chicken]
    
    let feedEntities: [FeedEntity] = [.americano, .chicken, .multiVitamin,
      .noodle, .ramen, .tea, .sushiAndDumbling]
    
    feedEntities.forEach { entity in
      modelContext.insert(entity)
    }
  }
}
