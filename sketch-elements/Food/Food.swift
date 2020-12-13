//
//  ContentView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 26/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Food: View {
    
    var categories:[Category] = recipeCategoriesData
    var restaurants:[Restaurant] = restaurantsData
    
    var body: some View {
        TabView() {
            Recipes(categories: categories).tabItem {
                Text("Recipes")
                Image(systemName: Constant.icon.doc)
            }
            Restaurants(restaurants: restaurants).tabItem {
                Text("Restaurants")
                Image(systemName: Constant.icon.house)
            }
        }
        .tabBarOpaque()
        .accentColor(Constant.color.foodPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Food().environmentObject(UserData())
    }
}


