//
//  PizzaRowView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-21.
//

import SwiftUI

// Pizza Row view
struct PizzaRow: View {
    
    let pizza: Pizza
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 100.0, height: 100.0)
                Image(pizza.imageName ?? "")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: 100.0, height: 100.0)
            }
            
            Text("\(pizza.name ?? "")")

            Spacer()
        }
    }
    
    

}
