//
//  Task.swift
//  TaskManager
//
//  Created by Giovanni Mota on 06/07/24.
//

import Foundation

struct Task: Identifiable, Hashable {
    
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), details: String? = nil){
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task {
        Task(title: "Buy milk", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Teste 1"),
            Task(title: "Teste 2", isCompleted: true),
            Task(title: "Teste 3", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
            Task(title: "Teste 4"),
            Task(title: "Teste 5"),
            Task(title: "Teste 6"),
            Task(title: "Teste 7", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "Teste 8"),
            Task(title: "Teste 9", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
            Task(title: "Teste 10"),
        ]
    }
    
    // Parei em 39:15
}
