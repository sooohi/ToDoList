//
//  ToDoList.swift
//  ToDoApp
//
//  Created by 박소희 on 2023/11/12.
//

import Foundation

struct ToDoList: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String
    var completed: Bool
}
