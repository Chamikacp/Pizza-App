//
//  FavouriteListView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI

// Favourite list view
struct FavouriteListView: View {
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if(vm.pizzas.isEmpty){
                    Spacer()
                    Text("No Favourite Pizzas")
                        .font(.system(size: 20.0, weight: Font.Weight.bold))
                    Spacer()
                } else {
                    List {
                        ForEach(vm.pizzas, id: \.id) { pizza in
                            NavigationLink {
                                DetailPizzaView(pizza: pizza)
                            } label: {
                                PizzaRow(pizza: pizza)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: vm.fetchAllData)
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteListView()
    }
}
