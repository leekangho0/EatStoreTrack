//
//  TagModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import Foundation

struct TagModel: Identifiable {
    let id: Int
    let name: String
    let emoji: String
    let category_id: Int
    let use_yn: String
}
