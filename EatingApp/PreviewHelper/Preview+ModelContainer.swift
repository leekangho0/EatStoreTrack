//
//  samples.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import SwiftData
import OSLog

extension ModelContainer {
  private static let logger = Logger(subsystem: "Core", category: "Infra")
  
  static var samples: () throws -> ModelContainer = {
    let schema = Schema([FeedEntity.self, TagEntity.self])
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: schema, configurations: configuration)
    Task { @MainActor in
      FeedEntity.insertSampleData(modelContext: container.mainContext)
    }
    return container
  }
  
  static func initialize(inMemory: Bool = false) -> ModelContainer {
    let schema = Schema([FeedEntity.self, TagEntity.self])
    let configuration = ModelConfiguration(isStoredInMemoryOnly: false)

    do {
      let container = try ModelContainer(for: schema, configurations: configuration)
      Task { @MainActor in
        try ModelContainer.loadDefaultTagIfneeded(container.mainContext)
        if inMemory {
          try ModelContainer.loadSampleTagIfDebug(container.mainContext)
        }
      }
      return container
    } catch {
      fatalError("can not initalize DB")
    }
  }
  
  static func loadDefaultTagIfneeded(_ context: ModelContext) throws {
      let descriptor = FetchDescriptor<TagEntity>()
      let defaultTags = try context.fetch(descriptor)
      
      if defaultTags.isEmpty {
        logger.warning("Not Exist Default Tag")
        let tagEntity: [TagEntity] = [
          .coffee, .dumbling, .multiVitamin, .noodle,
         .ramen, .ramen, .sushi, .tea, .chicken
        ]
        
        tagEntity.forEach { tag in
          context.insert(tag)
        }
        
        try context.save()
      } else {
        logger.info("Default Tags Already Exists")
      }
  }
  
  static func loadSampleTagIfDebug(_ context: ModelContext) throws {
    let feedEntities: [FeedEntity] = [.americano, .chicken, .multiVitamin,
                                      .noodle, .ramen, .tea, .sushiAndDumbling]
    feedEntities.forEach { entity in
      context.insert(entity)
    }
    logger.info("Default Tags Already Exists")
  }
}
