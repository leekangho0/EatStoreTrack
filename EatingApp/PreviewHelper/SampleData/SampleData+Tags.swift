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

  static let beer = TagEntity(name: "맥주", emoji: "🍺", category: .drink)
  static let wine = TagEntity(name: "와인", emoji: "🍷", category: .drink)
  static let milk = TagEntity(name: "우유", emoji: "🥛", category: .drink)
  static let juice = TagEntity(name: "주스", emoji: "🧃", category: .drink)
  static let water = TagEntity(name: "물", emoji: "💧", category: .drink)

  static let hamburger = TagEntity(name: "햄버거", emoji: "🍔", category: .food)
  static let pizza = TagEntity(name: "피자", emoji: "🍕", category: .food)
  static let steak = TagEntity(name: "스테이크", emoji: "🥩", category: .food)
  static let rice = TagEntity(name: "밥", emoji: "🍚", category: .food)
  static let bread = TagEntity(name: "빵", emoji: "🥖", category: .food)

  static let banana = TagEntity(name: "바나나", emoji: "🍌", category: .food)
  static let apple = TagEntity(name: "사과", emoji: "🍎", category: .food)
  static let grape = TagEntity(name: "포도", emoji: "🍇", category: .food)
  static let strawberry = TagEntity(name: "딸기", emoji: "🍓", category: .food)
  static let watermelon = TagEntity(name: "수박", emoji: "🍉", category: .food)

  static let vitaminC = TagEntity(name: "비타민C", emoji: "🧪", category: .pill)
  static let omega3 = TagEntity(name: "오메가3", emoji: "🫒", category: .pill)
  static let lactobacillus = TagEntity(name: "유산균", emoji: "🧫", category: .pill)
  static let iron = TagEntity(name: "철분제", emoji: "🧲", category: .pill)
  static let calcium = TagEntity(name: "칼슘제", emoji: "🦴", category: .pill)
}
