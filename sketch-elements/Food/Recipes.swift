//
//  Recipes.swift
//  sketch-elements
//
//  Created by Filip Molcik on 27/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct RecipesView: View {
    
    var categories: [Category]
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("BrandPrimary")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(categories) { category in
                        NavigationLink(
                            destination: RecipesListView(category: category)
                        ) {
                            Card(title: category.title, subTitle: category.subtitle, height: 300.0, pictureUrl: category.picture.uri, description: nil)
                        }
                    }
                }
                .background(Color("Gray"))
            }
            .navigationBarColor(.clear)
            .navigationBarTitle("Recipes", displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass").foregroundColor(.white))
        }
    }
}


struct Recipes_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(categories: recipeCategoriesData)
            .environmentObject(UserData())
    }
}
