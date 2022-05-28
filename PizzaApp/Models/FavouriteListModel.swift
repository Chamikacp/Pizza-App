//
//  FavouriteListModel.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-21.
//

import Foundation

// Favourite pizza model
extension FavouriteListView {
    class ViewModel: ObservableObject {
        @Published var pizzas: [Pizza] = []
        
        func fetchAllData() {
            pizzas = PersistenceController.shared.fetchPizza().filter{ $0.isFavourite }
        }
    }
}
