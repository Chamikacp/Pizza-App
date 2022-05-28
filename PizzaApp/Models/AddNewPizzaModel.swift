//
//  AddNewPizzaModel.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-21.
//

import Foundation

// Add new pizza Model
extension AddNewPizzaView {
    class ViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var ingredients: String = ""
        @Published var imageName: String = ""
        @Published var selectedType = PizzaType.meat
        
        @Published var shouldShowAlert: Bool = false
        
        func savePizza() {
            PersistenceController().addPizza(pizza: PizzaModel(
                name: name,
                ingredients: ingredients,
                imageName: imageName.isEmpty ? "placeholder" : imageName,
                thumbnailName: imageName.isEmpty ? "placeholder" : imageName,
                type: selectedType.rawValue)
            )
        }
    }
}
