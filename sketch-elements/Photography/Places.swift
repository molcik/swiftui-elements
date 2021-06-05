//
//  Places.swift
//  sketch-elements
//
//  Created by Filip Krayem on 03.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import MapKit

struct Places: View {

    var tintColor: Color = Constant.color.tintColor
    
    var body: some View {
            
        MapView(coordinate: photographyData[0].locationCoordinate)
        
    }
}

struct Places_Previews: PreviewProvider {
    static var previews: some View {
        Places()
            .environmentObject(UserData())
            .environment(\.colorScheme, .light)
    }
}
