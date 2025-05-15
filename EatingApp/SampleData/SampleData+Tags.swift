//
//  SampleData+Tags.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation

extension TagEntity {
  static let sushi = TagEntity(name: "스시", emoji: "🍣", category: .food)
  static let noodle = TagEntity(name: "국수", emoji: "🍜", category: .food)
  static let coffee = TagEntity(name: "커피", emoji: "☕️", category: .drink)
  static let chicken = TagEntity(name: "치킨", emoji: "🍗", category: .food)
  
  static let tea = TagEntity(name: "홍차", emoji: "🫖", category: .drink)
  static let ramen = TagEntity(name: "라면", emoji: "🍜", category: .food)
  static let dumbling = TagEntity(name: "만두", emoji: "🥟", category: .food)
  static let multiVitamin = TagEntity(name: "종합비타민", emoji: "💊", category: .pill)
}
