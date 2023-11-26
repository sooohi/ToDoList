//
//  ToDoListDetail.swift
//  ToDoApp
//
//  Created by 박소희 on 11/26/23.
//

import Foundation
import SwiftUI

struct ToDoListDetail: View {
    @Binding var todoList: ToDoList

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit ToDo List")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Title")
                            .font(.headline)
                            .foregroundColor(.green)

                        TextField("Enter Title", text: $todoList.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.headline)
                            .foregroundColor(.green)

                        TextField("Enter Description", text: $todoList.description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Toggle("Completed", isOn: $todoList.completed)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.green)
                }
            }
            .navigationBarTitle("Edit ToDo List", displayMode: .inline)
        }
    }
}
