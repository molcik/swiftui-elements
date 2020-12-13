//
//  Guides.swift
//  sketch-elements
//
//  Created by Filip Molcik on 13/12/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Guides: View {
    
    var categories: [Category]
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
            .navigationBarColor(UIColor(named:"TravelPrimary"))
            .navigationBarTitle(Text("Guides"), displayMode: .large)
            .navigationBarItems(trailing: Image(systemName: "magnifyingglass").foregroundColor(.white))
        }
    }
}

struct Guides_Previews: PreviewProvider {
    static var previews: some View {
        Guides(categories: recipeCategoriesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
