//
//  PizzaListModel.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-21.
//

import Foundation

// Pizza List model
extension PizzaListView {
    class ViewModel: ObservableObject {
        
        let coreDataManager: PersistenceController = PersistenceController.shared
        
        @Published var selectedValue = PizzaType.all
        @Published var showingSheet = false
        @Published var pizzas: [Pizza] = []
        
        init() {
            filterAndShowData()
        }
        
        func delete(pizza: Pizza) {
            coreDataManager.deletePizza(pizza: pizza)
        }
        
        func filterAndShowData() {
                        
            switch selectedValue {
            case .all:
                pizzas = coreDataManager.fetchPizza()
            case .meat:
                pizzas = coreDataManager.fetchPizza().filter{$0.type == "Meat🥩"}
            case .vegetarian:
                pizzas = coreDataManager.fetchPizza().filter{$0.type == "Veggie🥦"}
            }
        }
    }
}
