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
    let tagEntity: [TagEntity] = [
      .coffee, .dumbling, .multiVitamin, .noodle, .ramen, .sushi, .tea, .chicken,
      .beer, .wine, .milk, .juice, .water,
      .hamburger, .pizza, .steak, .rice, .bread,
      .banana, .apple, .grape, .strawberry, .watermelon,
      .vitaminC, .omega3, .lactobacillus, .iron, .calcium
    ]

    tagEntity.forEach { tag in
      modelContext.insert(tag)
      print("Tag: \(tag.name) inserted.")
    }

    let feedEntities: [FeedEntity] = [
//      .americano, .chicken, .multiVitamin,
      .noodle, .ramen, .tea, .sushiAndDumbling,
//      .steakDinner, .pizzaLunch, .morningBanana, .vitaminCMorning, .sundayWine,
//      .postWorkoutProtein, .appleSnack, .cafeLatte, .hamburgerLunch, .pizzaNight,
//      .calciumNight, .grapeDessert, .strawberryToast, .riceDinner,
//      .omega3Supplement, .breadBrunch, .watermelonSnack, .ironMorning,
//      .juiceSnack, .lactoNight
    ]

    feedEntities.forEach { entity in
      modelContext.insert(entity)
      print(#function, ": \(entity.content) inserted.")
    }
  }
}
