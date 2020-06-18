//
//  Restaurants.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/05/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Restaurants: View {
    
    var restaurants: [Category]
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(restaurants) { category in
                    NavigationLink(
                        destination: RecipesListView(category: category)
                    ) {
                        Card(title: category.title, subTitle: category.subtitle, height: 300.0, pictureUrl: category.picture.uri, description: nil)
                    }
                }
            }
            .background(Color("Gray"))
            .navigationBarColor(UIColor(named:"BrandPrimary"))
            .navigationBarTitle(Text("Recipes"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass").foregroundColor(.white))
        }
    }
}

struct Restaurants_Previews: PreviewProvider {
    static var previews: some View {
        Restaurants(restaurants: recipeCategoriesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
