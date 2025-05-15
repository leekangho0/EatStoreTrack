//
//  SampleData+Tags.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation

extension TagEntity {
  static var tagSamples: [TagEntity] {
    return [
      TagEntity(name: "스시", emoji: "🍣", category: .food),
      TagEntity(name: "국수", emoji: "🍜", category: .food),
      TagEntity(name: "커피", emoji: "☕️", category: .drink),
      TagEntity(name: "치킨", emoji: "🍗", category: .food),
      TagEntity(name: "홍차", emoji: "🫖", category: .drink),
      TagEntity(name: "라면", emoji: "🍜", category: .food),
      TagEntity(name: "만두", emoji: "🥟", category: .food),
      TagEntity(name: "종합비타민", emoji: "💊", category: .pill),
      TagEntity(name: "불닭뽀끔면", emoji: "🍝", category: .food),
      TagEntity(name: "피자", emoji: "🍕", category: .food),
      TagEntity(name: "사탕", emoji: "🍭", category: .food),
      TagEntity(name: "아아", emoji: "🥤", category: .drink),
      TagEntity(name: "녹용", emoji: "☠️", category: .pill),
      TagEntity(name: "김치찌개", emoji: "🥘", category: .food),
      TagEntity(name: "햄버거", emoji: "🍔", category: .food),
      TagEntity(name: "떡볶이", emoji: "🌶️", category: .food),
      TagEntity(name: "스테이크", emoji: "🥩", category: .food),
      TagEntity(name: "샐러드", emoji: "🥗", category: .food),
      TagEntity(name: "콜라", emoji: "🥤", category: .drink),
      TagEntity(name: "에스프레소", emoji: "☕", category: .drink),
      TagEntity(name: "보리차", emoji: "🍵", category: .drink),
      TagEntity(name: "홍삼", emoji: "🧧", category: .pill),
      TagEntity(name: "비타민D", emoji: "🌞", category: .pill),
      TagEntity(name: "유산균", emoji: "🦠", category: .pill),
      TagEntity(name: "생수", emoji: "💧", category: .drink),
      TagEntity(name: "스프라이트", emoji: "🫧", category: .drink),
      TagEntity(name: "아메리카노", emoji: "☕️", category: .drink),
      TagEntity(name: "밀크쉐이크", emoji: "🥤", category: .drink),
      TagEntity(name: "에너지드링크", emoji: "⚡️", category: .drink),
      TagEntity(name: "탄산수", emoji: "🥂", category: .drink),
      TagEntity(name: "칵테일", emoji: "🍸", category: .drink),
      TagEntity(name: "녹차", emoji: "🍃", category: .drink),
      TagEntity(name: "딸기우유", emoji: "🥛", category: .drink),
      TagEntity(name: "식혜", emoji: "🍶", category: .drink)
    ]
  }
}
