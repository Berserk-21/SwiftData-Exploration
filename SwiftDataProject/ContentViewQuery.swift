//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Berserk on 21/06/2024.
//

import SwiftUI
import SwiftData

struct ContentViewQuery: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        Text(user.name)
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteRow(at: indexSet)
                })
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User(name: "name", city: "city", joinDate: .now)
                    modelContext.insert(user)
                    
                    // Perform the navigation because the path is binded to the NavigationStack.
                    path.append(user)
                }
            }
        }
    }
    
    func deleteRow(at indexSet: IndexSet) {
        indexSet.forEach { index in
            modelContext.delete(users[index])
        }
    }
}

#Preview {
    ContentViewQuery()
}
