//
//  Places.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
struct Places: View {

    var tintColor: Color = Constant.color.tintColor
    
    var body: some View {
        
      Text("places")
    }
}

struct Places_Previews: PreviewProvider {
    static var previews: some View {
        Places()
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
