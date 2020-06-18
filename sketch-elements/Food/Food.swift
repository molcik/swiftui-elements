//
//  ContentView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 26/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    
    var categories:[Category] = recipeCategoriesData
    
    var body: some View {
        TabView() {
            RecipesView(categories: categories).tabItem {
                Text("Recipes")
                Image(systemName: "doc")
            }
            Text("Tab Content 2").tabItem {
                Text("Restaurants")
                Image(systemName: "person.crop.circle")
            }
        }
        .tabBarOpaque()
        .accentColor(Color("BrandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView().environmentObject(UserData())
    }
}


