//
//  sampleData.swift
//  EatingApp
//
//  Created by drfranken on 5/13/25.
//

import Foundation

let sampleCategories: [CategoryModel] = [
  CategoryModel(
        id: 1,
        name: "먹을거",
        emoji: "🍽️",
        imageName: "bob"
    ),CategoryModel(
        id: 2,
        name: "마실거",
        emoji: "🍹",
        imageName: "drink"
    ),CategoryModel(
        id: 3,
        name: "영양제",
        emoji: "💊",
        imageName: "drug"
    ),

]


let sampleFeeds: [FeedModel] = [
    FeedModel(
        id: 1,
        content: "아 맵다 매워",
        category_id: 1,
        use_yn: "Y",
        create_date: "2025-05-09 12:12:12",
        update_date: "2025-05-09 12:12:12",
        tags: [TagModel(id: 1, name: "불닭뽀끔면", emoji: "🍝", category_id: 1, use_yn: "Y"),
               TagModel(id: 6, name: "김치찌개", emoji: "🥘", category_id: 1, use_yn: "Y"),]
    ), FeedModel(
        id: 2,
        content: "아 달다 달아",
        category_id: 1,
        use_yn: "Y",
        create_date: "2025-05-10 12:12:12",
        update_date: "2025-05-10 12:12:12",
        tags: [TagModel(id: 3, name: "사탕", emoji: "🍭", category_id: 1, use_yn: "Y"),]
    ), FeedModel(
        id: 3,
        content: "아 시원 시원",
        category_id: 2,
        use_yn: "Y",
        create_date: "2025-05-10 12:13:12",
        update_date: "2025-05-10 12:13:12",
        tags: [TagModel(id: 4, name: "아아", emoji: "🥤", category_id: 2, use_yn: "Y"),
               TagModel(id: 14, name: "콜라", emoji: "🥤", category_id: 2, use_yn: "Y"),]
    ), FeedModel(
        id: 4,
        content: "아 쓰다 쓰다",
        category_id: 3,
        use_yn: "Y",
        create_date: "2025-05-11 12:13:12",
        update_date: "2025-05-11 12:13:12",
        tags: [TagModel(id: 17, name: "홍삼", emoji: "🧧", category_id: 3, use_yn: "Y"),
               TagModel(id: 5, name: "녹용", emoji: "☠️", category_id: 3, use_yn: "Y"),]
    )
]


let sampleTags: [TagModel] = [
  TagModel(id: 1, name: "불닭뽀끔면", emoji: "🍝", category_id: 1, use_yn: "Y"),
  TagModel(id: 2, name: "피자", emoji: "🍕", category_id: 1, use_yn: "Y"),
  TagModel(id: 3, name: "사탕", emoji: "🍭", category_id: 1, use_yn: "Y"),
  TagModel(id: 4, name: "아아", emoji: "🥤", category_id: 2, use_yn: "Y"),
  TagModel(id: 5, name: "녹용", emoji: "☠️", category_id: 3, use_yn: "Y"),
  TagModel(id: 6, name: "김치찌개", emoji: "🥘", category_id: 1, use_yn: "Y"),
  TagModel(id: 7, name: "초밥", emoji: "🍣", category_id: 1, use_yn: "Y"),
  TagModel(id: 8, name: "햄버거", emoji: "🍔", category_id: 1, use_yn: "Y"),
  TagModel(id: 9, name: "떡볶이", emoji: "🌶️", category_id: 1, use_yn: "Y"),
  TagModel(id: 10, name: "치킨", emoji: "🍗", category_id: 1, use_yn: "Y"),
  TagModel(id: 11, name: "라면", emoji: "🍜", category_id: 1, use_yn: "Y"),
  TagModel(id: 12, name: "스테이크", emoji: "🥩", category_id: 1, use_yn: "Y"),
  TagModel(id: 13, name: "샐러드", emoji: "🥗", category_id: 1, use_yn: "Y"),
  TagModel(id: 14, name: "콜라", emoji: "🥤", category_id: 2, use_yn: "Y"),
  TagModel(id: 15, name: "에스프레소", emoji: "☕", category_id: 2, use_yn: "Y"),
  TagModel(id: 16, name: "보리차", emoji: "🍵", category_id: 2, use_yn: "Y"),
  TagModel(id: 17, name: "홍삼", emoji: "🧧", category_id: 3, use_yn: "Y"),
  TagModel(id: 18, name: "비타민D", emoji: "🌞", category_id: 3, use_yn: "Y"),
  TagModel(id: 19, name: "유산균", emoji: "🦠", category_id: 3, use_yn: "Y"),
  TagModel(id: 20, name: "생수", emoji: "💧", category_id: 2, use_yn: "Y"),
  TagModel(id: 21, name: "스프라이트", emoji: "🫧", category_id: 2, use_yn: "Y"),
  TagModel(id: 22, name: "아메리카노", emoji: "☕️", category_id: 2, use_yn: "Y"),
  TagModel(id: 23, name: "밀크쉐이크", emoji: "🥤", category_id: 2, use_yn: "Y"),
  TagModel(id: 24, name: "에너지드링크", emoji: "⚡️", category_id: 2, use_yn: "Y"),
  TagModel(id: 25, name: "탄산수", emoji: "🥂", category_id: 2, use_yn: "Y"),
  TagModel(id: 26, name: "칵테일", emoji: "🍸", category_id: 2, use_yn: "Y"),
  TagModel(id: 27, name: "녹차", emoji: "🍃", category_id: 2, use_yn: "Y"),
  TagModel(id: 28, name: "딸기우유", emoji: "🥛", category_id: 2, use_yn: "Y"),
  TagModel(id: 29, name: "식혜", emoji: "🍶", category_id: 2, use_yn: "Y")
]

