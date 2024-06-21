//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Berserk on 21/06/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentViewFilter()
        }
        .modelContainer(for: User.self)
    }
}
