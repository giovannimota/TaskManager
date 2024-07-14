//
//  TouchbarView.swift
//  TaskManager
//
//  Created by Giovanni Mota on 12/07/24.
//

import SwiftUI

struct TouchbarView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            Image(systemName: "gauge.with.dots.needle.0percent")
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            ).frame(width: 250)
                .tint(Color.cyan)
                .cornerRadius(20)
            Image(systemName: "gauge.with.dots.needle.67percent")
        }.padding(.horizontal).cornerRadius(12).background(Color.gray.opacity(0.3))
    }
}

#Preview {
    TouchbarView()
}
