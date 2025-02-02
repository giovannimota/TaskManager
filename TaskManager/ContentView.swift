//
//  ContentView.swift
//  TaskManager
//
//  Created by Giovanni Mota on 06/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: TaskSection? = TaskSection.all
    @State private var allTasks = Task.examples()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var searchTerm: String = ""
    @State private var placeholder: String = ""
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection, placeholder: $placeholder)
        } detail: {
            
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({ $0.isCompleted }))
                case .upcoming:
                    StaticTaskListView(title: "All", tasks: allTasks.filter({ !$0.isCompleted }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                case .none:
                    Text("none")
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({ $0.title.contains(searchTerm) }))
            }
        }
        .touchBar {
            TouchbarView()
        }
        .searchable(text: $searchTerm)
    }
}

#Preview {
    ContentView()
}
