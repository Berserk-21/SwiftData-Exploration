//
//  User.swift
//  SwiftDataProject
//
//  Created by Berserk on 21/06/2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    // Choose the deletion option when a user object is deleted.
    // Cascade means the jobs related objects will be deleted.
    // Default is nullify.
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
