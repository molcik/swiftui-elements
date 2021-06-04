//
//  Photos.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//


import SwiftUI

struct Photos: View {
    
    var photos: [Photo]
    var tintColor: Color = Constant.color.tintColor
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    ForEach(photos, id: \.self) {
                        Text("\($0.id)")
                    }
                }
            }
        }
        .background(Constant.color.gray)
        .navigationBarColor(Constant.color.photographyPrimary.uiColor())
        .navigationBarTitle(Text("Photos"), displayMode: .large)
        .navigationBarItems(trailing: Image(systemName: Constant.icon.camera).foregroundColor(.white))
        
    }
}

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Recipes(categories: recipeCategoriesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
