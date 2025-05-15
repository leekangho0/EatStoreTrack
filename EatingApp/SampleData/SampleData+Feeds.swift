//
//  SampleData+Feeds.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation

extension FeedEntity {


  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter
  }()


  static let sushiAndDumbling: FeedEntity = {
    let feed = FeedEntity(content: "스시와 만두 먹음", category: .food, tags: [.sushi, .dumbling])
    let specificDate = dateFormatter.date(from: "2025-03-16 13:24")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let multiVitamin: FeedEntity = {
    let feed = FeedEntity(content: "종합 비타민 먹음", category: .pill, tags: [.multiVitamin])
    let specificDate = dateFormatter.date(from: "2025-03-21 09:10")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let tea: FeedEntity = {
    let feed = FeedEntity(content: "홍차 먹음", category: .drink, tags: [.tea])
    let specificDate = dateFormatter.date(from: "2025-03-26 16:35")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let ramen: FeedEntity = {
    let feed = FeedEntity(content: "라면 먹음", category: .food, tags: [.ramen])
    let specificDate = dateFormatter.date(from: "2025-03-30 22:05")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let noodle: FeedEntity = {
    let feed = FeedEntity(content: "국수 먹음", category: .food, tags: [.noodle])
    let specificDate = dateFormatter.date(from: "2025-04-02 12:50")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let chicken: FeedEntity = {
    let feed = FeedEntity(content: "치킨 먹음", category: .food, tags: [.chicken])
    let specificDate = dateFormatter.date(from: "2025-04-04 19:40")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let americano: FeedEntity = {
    let feed = FeedEntity(content: "아메리카노 먹음", category: .drink, tags: [.coffee])
    let specificDate = dateFormatter.date(from: "2025-04-07 08:22")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let steakDinner: FeedEntity = {
    let feed = FeedEntity(content: "오랜만에 스테이크로 저녁을 해결했다. 부드럽고 맛있었다.", category: .food, tags: [.steak])
    let specificDate = dateFormatter.date(from: "2025-03-15 18:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let pizzaLunch: FeedEntity = {
    let feed = FeedEntity(content: "점심으로 피자를 먹었는데 치즈가 아주 풍부했다.", category: .food, tags: [.pizza])
    let specificDate = dateFormatter.date(from: "2025-03-20 12:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let morningBanana: FeedEntity = {
    let feed = FeedEntity(content: "아침에 바나나 하나로 가볍게 시작했다.", category: .food, tags: [.banana])
    let specificDate = dateFormatter.date(from: "2025-03-22 08:15")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let vitaminCMorning: FeedEntity = {
    let feed = FeedEntity(content: "비타민C 보충을 위해 아침에 복용함.", category: .pill, tags: [.vitaminC])
    let specificDate = dateFormatter.date(from: "2025-04-01 07:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let sundayWine: FeedEntity = {
    let feed = FeedEntity(content: "일요일 저녁에 와인 한 잔으로 마무리. 분위기 좋았음.", category: .drink, tags: [.wine])
    let specificDate = dateFormatter.date(from: "2025-04-06 20:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let postWorkoutProtein: FeedEntity = {
    let feed = FeedEntity(content: "운동 후 단백질 보충을 위해 우유 한 잔 마심.", category: .drink, tags: [.milk])
    let specificDate = dateFormatter.date(from: "2025-04-10 17:45")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let appleSnack: FeedEntity = {
    let feed = FeedEntity(content: "오후 간식으로 사과를 먹었다. 아삭하고 달콤했다.", category: .food, tags: [.apple])
    let specificDate = dateFormatter.date(from: "2025-04-12 15:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let cafeLatte: FeedEntity = {
    let feed = FeedEntity(content: "카페에서 라떼 한 잔과 함께 여유로운 오후를 보냄.", category: .drink, tags: [.coffee])
    let specificDate = dateFormatter.date(from: "2025-04-15 14:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let hamburgerLunch: FeedEntity = {
    let feed = FeedEntity(content: "점심으로 햄버거를 먹었는데 고기가 두툼했다.", category: .food, tags: [.hamburger])
    let specificDate = dateFormatter.date(from: "2025-04-18 12:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let pizzaNight: FeedEntity = {
    let feed = FeedEntity(content: "야식으로 남은 피자 데워먹음. 역시 식은 피자도 맛있다.", category: .food, tags: [.pizza])
    let specificDate = dateFormatter.date(from: "2025-04-20 22:15")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let calciumNight: FeedEntity = {
    let feed = FeedEntity(content: "자기 전에 칼슘제를 복용. 뼈 건강 챙기기!", category: .pill, tags: [.calcium])
    let specificDate = dateFormatter.date(from: "2025-04-22 21:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let grapeDessert: FeedEntity = {
    let feed = FeedEntity(content: "디저트로 포도 한 송이를 먹음. 씨 없는 포도라 더 좋았다.", category: .food, tags: [.grape])
    let specificDate = dateFormatter.date(from: "2025-04-25 16:45")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let strawberryToast: FeedEntity = {
    let feed = FeedEntity(content: "아침으로 딸기잼 바른 토스트와 함께 커피 한 잔.", category: .food, tags: [.strawberry])
    let specificDate = dateFormatter.date(from: "2025-04-28 08:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let riceDinner: FeedEntity = {
    let feed = FeedEntity(content: "집밥으로 흰쌀밥과 함께 된장국을 먹었다.", category: .food, tags: [.rice])
    let specificDate = dateFormatter.date(from: "2025-05-01 19:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let omega3Supplement: FeedEntity = {
    let feed = FeedEntity(content: "오메가3 보충제 섭취. 기억력 향상 기대!", category: .pill, tags: [.omega3])
    let specificDate = dateFormatter.date(from: "2025-05-03 07:45")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let breadBrunch: FeedEntity = {
    let feed = FeedEntity(content: "브런치로 바게트에 버터 발라서 먹음. 고소했다.", category: .food, tags: [.bread])
    let specificDate = dateFormatter.date(from: "2025-05-06 11:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let watermelonSnack: FeedEntity = {
    let feed = FeedEntity(content: "더운 날씨엔 수박 한 조각이 최고다.", category: .food, tags: [.watermelon])
    let specificDate = dateFormatter.date(from: "2025-05-10 14:20")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let ironMorning: FeedEntity = {
    let feed = FeedEntity(content: "빈혈 예방을 위해 아침에 철분제를 복용했다.", category: .pill, tags: [.iron])
    let specificDate = dateFormatter.date(from: "2025-05-12 08:10")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let juiceSnack: FeedEntity = {
    let feed = FeedEntity(content: "오후에 주스를 마시며 잠깐 휴식했다.", category: .drink, tags: [.juice])
    let specificDate = dateFormatter.date(from: "2025-05-13 15:00")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()

  static let lactoNight: FeedEntity = {
    let feed = FeedEntity(content: "자기 전 유산균을 챙겨먹음. 장 건강에 도움!", category: .pill, tags: [.lactobacillus])
    let specificDate = dateFormatter.date(from: "2025-05-14 22:30")!
    feed.createdDate = specificDate
    feed.updatedDate = specificDate
    return feed
  }()
}
