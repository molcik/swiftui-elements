//
//  Button.swift
//  sketch-elements
//
//  Created by Filip Molcik on 08/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonPrimary: View {
    
    var title: String
    var action: () -> Void
    var color: Color?
    var iconName: String?
    
    var body: some View {
        Button(action: action){
            Image(systemName: iconName ?? "")
            Text(title)
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
        .background(Color("BrandPrimary"))
        .foregroundColor(.white)
        .cornerRadius(8)
    }
    
}

struct ButtonPrimary_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPrimary(title: "Test", action: {}).environmentObject(UserData())
    }
}
