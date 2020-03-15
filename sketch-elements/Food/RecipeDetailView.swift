//
//  RecipeDetailView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 01/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation
//
//  RecipesList.swift
//  sketch-elements
//
//  Created by Filip Molcik on 29/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct RecipeDetailView: View {
    
    var recipe: Recipe
    var category: String
    @State var ingredientsPresented: Bool = true
    
    var body: some View {
        VStack(spacing: 0){
            Header(
                image: recipe.picture.uri,
                title: recipe.title
                // leftItem: AnyView(BackButton(title: category, action: navigateBack)),
                // rightItem: AnyView(Image(systemName: "bookmark"))
            )
            TabBar(recipe: recipe)
            ScrollView(.vertical, showsIndicators: false) {
                ButtonPrimary(
                    title: "See Ingredients",
                    action: {self.ingredientsPresented.toggle()}
                )
                    .padding([.top, .leading, .trailing])
                VStack(alignment: .leading) {
                    ForEach(0 ..< recipe.instructions.count) {
                        TableRow(
                            left: "\($0+1)",
                            divider: $0 + 1 < self.recipe.instructions.count,
                            middle: self.recipe.instructions[$0]
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
        .halfSheet(isPresented: self.$ingredientsPresented) {
            Text("hola")
        }
    }
    
}

struct TableRow: View {
    
    var left: String
    var divider: Bool
    var middle: String?
    var right: String?
    
    var body: some View {
        Group {
            HStack(alignment: .top) {
                Text("\(left)").foregroundColor(.gray).padding(.leading)
                Text(middle ?? "(empty)").padding(.horizontal)
            }.padding(.horizontal)
            divider ? Divider() : nil
        }
    }
}

struct TabBar: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack () {
            Spacer()
            VStack() {
                Image(systemName: "person.2.fill")
                Text("\(recipe.people) people")
                    .font(.caption)
            }
            Spacer()
            Spacer()
            VStack() {
                Image(systemName: "clock.fill")
                Text("\(recipe.minutes) minutes")
                    .font(.caption)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64.0)
        .background(Color("Default"))
        .foregroundColor(Color("BrandPrimary"))
    }
}


struct BackButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .font(.system(size: 24.0, weight: .medium))
            Text(title)
                .offset(x: -4)
        }.offset(x: -5)
        
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[4], category: recipeCategoriesData[0].title)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
