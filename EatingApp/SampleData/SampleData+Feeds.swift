//
//  SampleData+Feeds.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation

extension FeedEntity {
  static let sushiAndDumbling = FeedEntity(content: "스시와 만두 먹음", category: .food, tags: [.sushi, .dumbling])
  static let multiVitamin = FeedEntity(content: "종합 비타민 먹음", category: .pill, tags: [.multiVitamin])
  static let tea = FeedEntity(content: "홍차 먹음", category: .drink, tags: [.tea])
  
  static let ramen = FeedEntity(content: "라면 먹음", category: .food, tags: [.ramen])
  static let noodle = FeedEntity(content: "국수 먹음", category: .food, tags: [.noodle])
  static let chicken = FeedEntity(content: "치킨 먹음", category: .food, tags: [.chicken])
  static let americano = FeedEntity(content: "아메리카노 먹음", category: .drink, tags: [.coffee])
}
