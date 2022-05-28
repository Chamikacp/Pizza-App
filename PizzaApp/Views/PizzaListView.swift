//
//  PizzaListView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI

// Pizza list view
struct PizzaListView: View {

    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack {
                    Picker(selection: $vm.selectedValue, label: Text("Category")) {
                        Text("All🍕").tag(PizzaType.all)
                        Text("Meat🥩").tag(PizzaType.meat)
                        Text("Veggie🥦").tag(PizzaType.vegetarian)
                    }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: vm.selectedValue) { _ in
                        vm.filterAndShowData()
                    }
                    
                    if(vm.pizzas.isEmpty){
                        VStack {
                            Spacer()
                            Text("No Pizzas")
                                .font(.system(size: 20.0, weight: Font.Weight.bold))
                            Spacer()
                        }
                    } else {
                        List {
                            ForEach(vm.pizzas, id: \.id) { pizza in
                                NavigationLink {
                                    DetailPizzaView(pizza: pizza)
                                } label: {
                                    PizzaRow(pizza: pizza)
                                }
                            }.onDelete(perform: deletePizza)
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: showSheet) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $vm.showingSheet) {
                        AddNewPizzaView().onDisappear(perform: {
                            vm.filterAndShowData()
                        })
                    }
                }
            }
        }
    }
    
    private func deletePizza(at offsets: IndexSet) {
        offsets.forEach { index in
            let pizza = vm.pizzas[index]
            vm.delete(pizza: pizza)
        }
        
        vm.filterAndShowData()
    }
    
    private func showSheet() {
        vm.showingSheet.toggle()
    }
}

struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView()
    }
}
