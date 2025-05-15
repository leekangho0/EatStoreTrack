//
//  RelationModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation

struct RelationModel: Identifiable {
    let id: Int
    let feed_id: Int
    let tag_id: Int
    let use_yn: String
    let create_date: String
    let update_date: String
}
