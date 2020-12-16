//
//  BackButton.swift
//  sketch-elements
//
//  Created by Filip Molcik on 30/06/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: Constant.icon.chevronBack)
                .font(.system(size: 24.0, weight: .medium))
            Text(title)
                .offset(x: -4)
        }.offset(x: -5)
        
    }
}
