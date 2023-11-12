//
//  ContentView.swift
//  ToDoApp
//
//  Created by 박소희 on 2023/11/12.
//

import SwiftUI

struct ContentView: View {
    @State private var TDList: [ToDoList] = []

    var body: some View {
        NavigationView {
            List(TDList) { ToDoList in
                VStack(alignment: .leading) {
                    Text(ToDoList.title)
                    Text(ToDoList.description)
                }
            }
            .navigationTitle("ToDo List")
            .onAppear(perform: loadTDList)
        }
    }

    func loadTDList() {
        guard let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json") else {
            print("Error")
            return
        }

        do {
            let data = try Data(contentsOf: fileURL)
            TDList = try JSONDecoder().decode([ToDoList].self, from: data)
        } catch {
            print("Error")
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
