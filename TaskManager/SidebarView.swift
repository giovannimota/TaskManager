//
//  SidebarView.swift
//  TaskManager
//
//  Created by Giovanni Mota on 08/07/24.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?
    @Binding var placeholder: String
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        List(selection: $selection) {
            Section("Favoritos") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName)
                        .tag(selection)
                }
                Text("\(speed)")
                            .foregroundColor(isEditing ? .red : .blue)
            }
            
            Section("Your Groups") {
                ForEach($userCreatedGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                        .tag(TaskSection.list(group))
                        .contextMenu {
                            Button("Delete", role: .destructive) {
                                if let index = userCreatedGroups.firstIndex(where: { $0.id == group.id}) {
                                    userCreatedGroups.remove(at: index)
                                }
                            }
                        }
                }
            }
            TextField("TouchBar Demo", text: $placeholder)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .focusable()
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("Adicionar grupo", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: .constant( TaskGroup.examples()), selection: .constant(.all), placeholder: .constant(""))
        .listStyle(.sidebar)
}
