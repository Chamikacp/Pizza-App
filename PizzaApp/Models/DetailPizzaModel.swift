//
//  DetailPizzaModel.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-21.
//

import Foundation

// Detail pizza model
extension DetailPizzaView {
    class ViewModel: ObservableObject {
        @Published var shouldShowAlert: Bool = false
        @Published var isFavorite: Bool = false
        
        func addToFavorites(pizza: Pizza) {
            pizza.isFavourite = isFavorite
            PersistenceController.shared.saveContext()        }
    }
}
