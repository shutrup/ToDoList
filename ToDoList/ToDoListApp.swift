//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Шарап Бамматов on 09.10.2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListVIew()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
