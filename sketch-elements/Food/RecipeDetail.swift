//
//  RecipeDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct RecipeDetail: View {
    
    var recipe: Recipe
    var category: String
    @EnvironmentObject var modalManager: ModalManager
    
    init(recipe: Recipe, category: String) {
        self.recipe = recipe
        self.category = category
    }
    
    var body: some View {
        return VStack(spacing: 0){
            Header(
                image: recipe.picture.uri,
                title: recipe.title
            )
            TabBar(
                [TabItem(name: "\(recipe.people) people", icon: "person.2.fill"),
                 TabItem(name: "\(recipe.minutes) minutes", icon: "clock.fill")]
            )
            ScrollView(.vertical, showsIndicators: false) {
                ButtonPrimary( title: "See Ingredients",action: self.modalManager.openModal)
                    .padding([.top, .leading, .trailing])
                VStack(alignment: .leading) {
                    ForEach(recipe.instructions) { instruction in
                        TextTableRow(
                            left: "\(self.recipe.instructions.firstIndex(of: instruction)! + 1)",
                            divider: self.recipe.instructions.firstIndex(of: instruction)! < self.recipe.instructions.count,
                            content: instruction
                        )
                    }
                }.padding([.top, .bottom])
                    .frame(maxWidth: .infinity)
                    .background(Color("Default"))
                    .cornerRadius(8)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("Gray"))
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: "bookmark").foregroundColor(.white))
        .onAppear {
            self.modalManager.newModal(position: .closed) {
                IngredientsModal(recipe: self.recipe, action: self.modalManager.closeModal)
            }
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipesData[4], category: recipeCategoriesData[0].title)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
