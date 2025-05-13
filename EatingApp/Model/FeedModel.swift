//
//  FeedModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation

struct FeedModel: Identifiable {
    let id: Int
    let content: String
    let category_id: Int
    let use_yn: String
    let create_date: String
    let update_date: String
    let tags: [TagModel]
}
