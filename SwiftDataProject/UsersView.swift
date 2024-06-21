//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Berserk on 21/06/2024.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name), SortDescriptor(\User.joinDate)])
        .modelContainer(for: User.self)
}
