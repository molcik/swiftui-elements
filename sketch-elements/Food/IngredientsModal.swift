//
//  IngredientsModal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct IngredientsModal: View {
    
    var recipe: Recipe
    var action: () -> Void
    
    var body: some View {
        VStack(){
            ModalHeader(action: self.action, title: "Ingredients")
            ScrollView(.vertical){
                ForEach(self.recipe.ingredients) {ingredient in
                    CheckBoxTableRow(
                        divider: true,
                        content: ingredient.name,
                        description: ingredient.quantity,
                        checked: ingredient.checked
                    )
                }
            }
            Divider()
            HStack(){
                ButtonPrimary(
                    action: {
                        self.action()
                    },
                    backgroundColor: Constant.color.foodPrimary
                ) {
                    Text("Add to Reminders")
                        .font(.headline)
                }
            }
            .padding([.horizontal, .bottom], 24)
        }
    }
}

struct IngredientsModal_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsModal(recipe: recipesData[0], action: {}).environmentObject(UserData())
    }
}
