//
//  ListVIew.swift
//  ToDoList
//
//  Created by Шарап Бамматов on 09.10.2022.
//

import SwiftUI

struct ListVIew: View {
    @EnvironmentObject var vm: ListViewModel
    
    var body: some View {
        ZStack {
            if vm.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn ))
            } else {
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteItems)
                    .onMove(perform: vm.moveItems)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 🔪")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddView()
            }))
    }
    
}

struct ListVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListVIew()
        }
        .environmentObject(ListViewModel())
    }
}
