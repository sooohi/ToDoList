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
            List {
                ForEach(TDList.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: TDList[index].completed ? "checkmark.square" : "square")
                                .onTapGesture {
                                    TDList[index].completed.toggle()
                                }
                            Text(TDList[index].title)
                        }
                        Text(TDList[index].description)
                    }
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
