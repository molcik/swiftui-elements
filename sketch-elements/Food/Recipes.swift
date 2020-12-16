//
//  Recipes.swift
//  sketch-elements
//
//  Created by Filip Molcik on 27/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Recipes: View {
    
    var categories: [Category]
    var tintColor: Color = Constant.color.tintColor
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(categories) { category in
                    NavigationLink(
                        destination: RecipesListView(category: category)
                    ) {
                        CardWithBackground(title: category.title, subTitle: category.subtitle, height: 300.0, pictureUrl: category.picture.uri, description: nil)
                    }
                }
            }
            .background(Constant.color.gray)
            .navigationBarColor(tintColor.uiColor())
            .navigationBarTitle(Text("Recipes"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: Constant.icon.magnifyingGlass).foregroundColor(.white))
        }
    }
}

struct Recipes_Previews: PreviewProvider {
    static var previews: some View {
        Recipes(categories: recipeCategoriesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
