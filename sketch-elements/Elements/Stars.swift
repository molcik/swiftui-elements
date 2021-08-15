//
//  RecipeRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 29/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct Stars: View {
    
    var rating: Int
    var label: String
    var color = Constant.color.tintColor
    var maximumRating = 5
    var star = Image(systemName: Constant.icon.star)
    
    init(_ rating: Int, label: String = "", color:Color = Constant.color.tintColor) {
        self.rating = rating
        self.label = label
        self.color = color
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1..<maximumRating + 1) { number in
                self.star
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(number > self.rating ? self.color.opacity(0.3) : self.color)
            }
            if label.isEmpty == false {
                Text(label)
                    .font(.footnote)
                    .opacity(0.6)
                    .padding(2)
            }
        }.eraseToAnyView()
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars(4, label: "167 reviews", color: Color("TravelPrimary"))
    }
}

