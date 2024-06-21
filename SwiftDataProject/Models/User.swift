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
    var name: String
    var city: String
    var joinDate: Date
    // Choose the deletion option when a user object is deleted.
    // Cascade means the jobs related objects will be deleted.
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
