//
//  RecipeDetail.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    var category: String
    @EnvironmentObject var modalManager: ModalManager

    init(recipe: Recipe, category: String) {
        self.recipe = recipe
        self.category = category
    }

    var body: some View {
        return VStack(spacing: 0) {
            Header(image: recipe.picture.uri, height: 223) {
                VStack {
                    Spacer()
                    HStack {
                        Text(recipe.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
            TabBar(
                content: [
                    TabItem(name: "\(recipe.people) people", icon: Constant.icon.person),
                    TabItem(name: "\(recipe.minutes) minutes", icon: Constant.icon.clock)
                ]
            )
            ScrollView(.vertical, showsIndicators: false) {
                ButtonPrimary(action: { self.modalManager.openModal(position: .partiallyRevealed) }) {
                    Text("See Ingredients")
                        .font(.headline)
                }.padding([.top, .leading, .trailing])
                VStack(alignment: .leading) {
                    ForEach(0 ..< recipe.instructions.count) { index in
                        TextTableRow(
                            left: "\(index + 1)",
                            divider: index < self.recipe.instructions.count - 1,
                            content: recipe.instructions[index]
                        )
                    }
                }.padding([.top, .bottom])
                    .frame(maxWidth: .infinity)
                    .background(Constant.color.bgDefault)
                    .cornerRadius(8)
                    .padding([.leading, .bottom, .trailing])
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .background(Constant.color.gray)
        .edgesIgnoringSafeArea([.top])
        .navigationBarTitle("", displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.bookmark).foregroundColor(.white))
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
