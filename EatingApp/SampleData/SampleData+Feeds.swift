//
//  SampleData+Feeds.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import Foundation

extension FeedEntity {
    static var feedSamples: [FeedEntity] {
        let tags = TagEntity.tagSamples
        func tag(named name: String) -> TagEntity? {
            return tags.first(where: { $0.name == name })
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")

        let datedFeeds: [(String, Category, [String], String)] = [
            ("아침에 에너지드링크 한 캔 박고 출근했어요", .drink, ["에너지드링크"], "2024-04-01 07:45"),
            ("불금엔 역시 콜라지~", .drink, ["콜라"], "2024-04-02 21:00"),
            ("점심으로 김치찌개 한 그릇 클리어!", .food, ["김치찌개"], "2024-04-03 12:20"),
            ("새벽 감성엔 역시 아메리카노 한 잔이지", .drink, ["아메리카노"], "2024-04-04 05:20"),
            ("저녁에 치킨 조합 완전 찐이죠", .food, ["치킨"], "2024-04-05 19:15"),
            ("오늘은 햄버거 세트로 점심 마무리!", .food, ["햄버거"], "2024-04-06 12:45"),
            ("오늘은 샐러드로 가볍게 한 끼!", .food, ["샐러드"], "2024-04-07 13:10"),
            ("운동 끝나고 유산균 하나 딱!", .pill, ["유산균"], "2024-04-08 21:00"),
            ("야근하면서 에너지드링크 두 캔째;;", .drink, ["에너지드링크"], "2024-04-09 23:30"),
            ("점심에 떡볶이 세트로 폭풍 흡입", .food, ["떡볶이"], "2024-04-10 12:50"),
            ("주말엔 역시 샐러드랑 보리차 조합이지", .food, ["샐러드", "보리차"], "2024-04-11 10:00"),
            ("저녁에 라면집 가서 얼큰하게 한 그릇", .food, ["라면"], "2024-04-16 18:00"),
            ("야식으로 피자 한 판 시켜서 냠냠", .food, ["피자"], "2024-04-18 22:10"),

            ("오늘 점심으로 스시를 먹었어요", .food, ["스시"], "2024-05-01 12:15"),
            ("아침에 종합 비타민을 챙겨 먹었어요", .pill, ["종합 비타민"], "2024-05-02 08:00"),
            ("오후에 홍차 한 잔 마셨어요", .drink, ["홍차"], "2024-05-03 15:30"),
            ("밤에 야식으로 라면을 먹었어요", .food, ["라면"], "2024-05-04 23:00"),
            ("국수를 점심 메뉴로 골랐어요", .food, ["국수"], "2024-05-05 13:00"),
            ("저녁에 치킨을 시켜 먹었어요", .food, ["치킨"], "2024-05-06 18:45"),
            ("출근길에 커피 한 잔 마셨어요", .drink, ["커피"], "2024-05-07 08:30"),
            ("산책하면서 딸기우유 홀짝", .drink, ["딸기우유"], "2024-05-08 16:20"),
            ("오늘은 피자+콜라 조합으로 치팅데이!", .food, ["피자", "콜라"], "2024-05-09 19:00"),
            ("아침에 스프라이트로 상쾌하게 시작", .drink, ["스프라이트"], "2024-05-10 07:50"),
            ("비오는 날엔 따뜻한 홍차 한 잔이 딱", .drink, ["홍차"], "2024-05-11 18:10")
        ]

        return datedFeeds.compactMap { content, category, tagNames, dateString in
            guard let date = dateFormatter.date(from: dateString) else { return nil }
            let feed = FeedEntity(
                content: content,
                category: category,
                tags: tagNames.compactMap { tag(named: $0) }
            )
            feed.createdDate = date
            feed.updatedDate = date
            return feed
        }
    }
}
