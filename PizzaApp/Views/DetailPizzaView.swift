//
//  DetailPizzaView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI

// Details pizza view
struct DetailPizzaView: View {

    let pizza: Pizza
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Label("\(pizza.name ?? "")", systemImage: "")
                    .font(.system(size: 30, weight: Font.Weight.bold))
                    .padding(.horizontal)
                
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    Image(pizza.imageName ?? "")
                        .resizable()
                        .scaledToFit()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.bottom)
                
                Label("Ingredients :-", systemImage: "")
                    .font(.system(size: 20, weight: Font.Weight.bold))
                    .padding(.horizontal)
                Label("\(pizza.ingredients ?? "")", systemImage: "")
                    .padding(.horizontal)
                    .padding(.horizontal)
                
                Label("Type :-" + " \(pizza.type ?? "")", systemImage: "")
                    .font(.system(size: 20, weight: Font.Weight.bold))
                    .padding(.horizontal)
                    .padding(.top)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        vm.shouldShowAlert = true
                        vm.isFavorite.toggle()
                        vm.addToFavorites(pizza: pizza)
                    }) {
                        Label("", systemImage: vm.isFavorite ? "star.fill" : "star")
                            .foregroundColor(vm.isFavorite ? Color.yellow : Color.blue)
                    }
                }
            }
        }
        .onAppear(perform: {
            vm.isFavorite = pizza.isFavourite
        })
    }
}
