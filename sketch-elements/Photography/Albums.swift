//
//  Albums.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
struct Albums: View {
    
    var tintColor: Color = Constant.color.tintColor
    
    var body: some View {
        
      Text("albums")
    }
}

struct Albums_Previews: PreviewProvider {
    static var previews: some View {
        Recipes(categories: recipeCategoriesData)
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
