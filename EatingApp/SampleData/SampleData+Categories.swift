//
//  SampleData+Feed.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation
import SwiftData

extension FeedEntity {
  fileprivate struct FeedKey: Hashable {
    let content: String
    let category: String
  }

  static func insertSampleData(modelContext: ModelContext) {
    let existingTags = (try? modelContext.fetch(FetchDescriptor<TagEntity>())) ?? []
    let existingTagNames = Set(existingTags.map { $0.name })

    TagEntity.tagSamples.forEach { tag in
      if !existingTagNames.contains(tag.name) {
        modelContext.insert(tag)
      }
    }

    let existingFeeds = (try? modelContext.fetch(FetchDescriptor<FeedEntity>())) ?? []
    let existingFeedKeys = Set(existingFeeds.map { FeedKey(content: $0.content, category: $0.category) })

    // DB에 이미 존재하는 태그를 name 기준으로 맵으로 저장
    let tagMap = Dictionary(uniqueKeysWithValues: existingTags.map { ($0.name, $0) })

    FeedEntity.feedSamples.forEach { feed in
      let key = FeedKey(content: feed.content, category: feed.category)
      if !existingFeedKeys.contains(key) {
        // 기존 태그 중 동일한 이름이 있으면 교체
        feed.tags = feed.tags.compactMap { tagMap[$0.name] }
        modelContext.insert(feed)
      }
    }
  }
}
