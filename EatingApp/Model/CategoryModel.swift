//
//  CategoryModel.swift
//  EatingApp
//
//  Created by 이치훈 on 5/13/25.
//

import SwiftUI
import SwiftData

struct CategoryModel: Identifiable {
    let id: Int
    let name: String
    let emoji: String
  	let imageName: String
}

enum Category: String, CaseIterable {
  case food = "음식"
  case drink = "음료"
  case pill = "영양제"
}

enum CategoryFilter: Identifiable, CaseIterable {
  case all
  case category(Category)
  
  var id: String {
    switch self {
    case .all: return "All"
    case .category(let category): return category.rawValue
    }
  }
  
  var name: String {
    id
  }
  
  var icon: Image {
    switch self {
    case .all: return Image(.logo)
    case .category(let category):
      return category.icon
    }
  }
  
  static var allCases: [CategoryFilter] {
    [.all] + Category.allCases.map { .category($0) }
  }
}

extension Category: Identifiable, Hashable {
  var id: Self { return self }
  
  var icon: Image {
    switch self {
    case .food: return Image(.bob)
    case .drink: return Image(.drink)
    case .pill: return Image(.drug)
    }
  }
}
