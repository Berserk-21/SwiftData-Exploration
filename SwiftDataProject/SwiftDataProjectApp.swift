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
            UsersView(minimumJoinDate: .distantPast, sortOrder: [SortDescriptor(\User.name), SortDescriptor(\User.joinDate)])
        }
        // We don't have to declare the Job model because User hold a property of this type.
        .modelContainer(for: User.self)
    }
}
