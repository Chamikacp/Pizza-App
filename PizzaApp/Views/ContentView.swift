//
//  ContentView.swift
//  PizzaApp
//
//  Created by Chamika Perera on 2022-05-14.
//

import SwiftUI
import CoreData

// Home View
struct ContentView: View {
    var body: some View {
        TabView {
            PizzaListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("PizzaList")
            }
            FavouriteListView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
