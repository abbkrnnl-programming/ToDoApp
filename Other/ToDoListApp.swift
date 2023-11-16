//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Абубакир on 28.10.2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
