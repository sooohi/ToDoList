//
//  ContentView.swift
//  ToDoApp
//
//  Created by 박소희 on 2023/11/12.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var todoLists = [ToDoList]()

    var body: some View {
        NavigationView {
            List {
                ForEach(todoLists) { todoList in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: todoList.completed ? "heart.fill" : "heart")
                                .foregroundColor(todoList.completed ? .green : Color(red: 127/255, green: 255/255, blue: 0))

                            NavigationLink(destination: ToDoListDetail(todoList: $todoLists[todoLists.firstIndex(of: todoList)!])) {
                                Text(todoList.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }

                        Text(todoList.description)
                            .font(.subheadline)
                            .foregroundColor(Color(red: 85/255, green: 85/255, blue: 85/255))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.systemBackground)))
                }
                .onDelete(perform: deleteToDoList)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("ToDo List", displayMode: .inline)
            .navigationBarItems(leading: EditButton().accentColor(.green), trailing: addToDoButton)
            .accentColor(.green)
        }
        .onAppear(perform: loadData)
    }

    var addToDoButton: some View {
        Button(action: addToDoList) {
            Image(systemName: "plus")
                .foregroundColor(.green)
                .font(.headline)
        }
        .buttonStyle(PlainButtonStyle())
    }

    func addToDoList() {
        guard !todoLists.contains(where: { $0.title == "New ToDo List" }) else {
            return
        }

        let newToDoList = ToDoList(id: todoLists.count + 1, title: "Enter title", description: "Enter description", completed: false)
        todoLists.append(newToDoList)
        saveData()
    }

    func deleteToDoList(at offsets: IndexSet) {
        todoLists.remove(atOffsets: offsets)
        saveData()
    }

    func loadData() {
        if let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                todoLists = try JSONDecoder().decode([ToDoList].self, from: data)
            } catch {
                print("Error")
            }
        }
    }

    func saveData() {
        do {
            let data = try JSONEncoder().encode(todoLists)
            if let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json") {
                try data.write(to: fileURL)
            }
        } catch {
            print("Error")
        }
    }
}

