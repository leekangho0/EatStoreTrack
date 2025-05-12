//
//  Item.swift
//  EatingApp
//
//  Created by kangho lee on 5/12/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
