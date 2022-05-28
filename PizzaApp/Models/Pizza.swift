//
//  Pizza.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import Foundation

//Pizza Model
struct PizzaModel: Codable {
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: PizzaType.RawValue
}

// Pizza type
enum PizzaType: String, Codable {
    case all = "All🍕"
    case meat = "Meat🥩"
    case vegetarian = "Veggie🥦"
}
