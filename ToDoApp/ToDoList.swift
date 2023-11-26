//
//  ToDoList.swift
//  ToDoApp
//
//  Created by 박소희 on 2023/11/12.
//
import Foundation
import SwiftUI

struct ToDoList: Identifiable, Codable, Equatable {
    var id: Int
    var title: String
    var description: String
    var completed: Bool
}
