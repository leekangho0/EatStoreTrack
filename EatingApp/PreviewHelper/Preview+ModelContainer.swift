//
//  samples.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import SwiftData

extension ModelContainer {
  static var samples: () throws -> ModelContainer = {
    let schema = Schema([FeedEntity.self, TagEntity.self])
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: schema, configurations: configuration)
    Task { @MainActor in
      FeedEntity.insertSampleData(modelContext: container.mainContext)
    }
    return container
  }
}
