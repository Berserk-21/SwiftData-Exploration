//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Berserk on 21/06/2024.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.unwrappedJobs.count))
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy McKeen", city: "Dublin", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "John Lennon", city: "Newcastle", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                Button("Add Singer") {
                    // Adds objects related to others.
                    let user = users.first(where: { $0.name == "Ed Sheeran" })
                    user?.jobs?.append(Job(name: "Singer", priority: 0))
                    
                    let lennon = users.first(where: { $0.name == "John Lennon" })
                    lennon?.jobs?.append(Job(name: "Singer", priority: 0))
                }
            }
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chaplin", city: "New York", joinDate: .now)
        let job1 = Job(name: "Actor", priority: 3, owner: nil)
        let job2 = Job(name: "Comedian", priority: 4, owner: nil)
        
        modelContext.insert(user1)
        
        // We can complete attributes from a model that has been inserted.
        // The data model will integrate it automatically.
        user1.jobs = [job1, job2]
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name), SortDescriptor(\User.joinDate)])
        .modelContainer(for: User.self)
}
