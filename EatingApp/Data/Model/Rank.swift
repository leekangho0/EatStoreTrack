//
//  Rank.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import Foundation

struct Rank: Ranking {
  let rank: Int
  let name: String
  let emoji: String
  let count: Int
  
  var value: String { emoji + name }
  
  init(_ rank: Int, _ name: String, _ emoji: String, _ count: Int) {
    self.rank = rank
    self.name = name
    self.emoji = emoji
    self.count = count
  }
}
