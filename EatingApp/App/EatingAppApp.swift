//
//  EatingAppApp.swift
//  EatingApp
//
//  Created by kangho lee on 5/12/25.
//

import SwiftUI
import SwiftData

@main
struct EatingAppApp: App {
    var body: some Scene {
        WindowGroup {
            FirstView()
        }
        .modelContainer(for: CategoryEntity.self)
    }
}
