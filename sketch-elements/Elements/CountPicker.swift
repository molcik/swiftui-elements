//
//  CountPicker.swift
//  sketch-elements
//
//  Created by Filip Molcik on 20/11/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import Foundation

import SwiftUI

struct CountPicker: View {
    @State var defaultValue = 0
    var minValue = 0
    var maxValue = 12
    var label = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.defaultValue += self.defaultValue > self.minValue ? -1 : 0
                }) {
                        HStack {
                            Image(systemName: "minus").font(Font.body.weight(.bold))
                            Spacer()
                        }

                }.padding()
                HStack {
                    Spacer()
                    Text("\(self.defaultValue) \(self.label)").fontWeight(.bold)
                    Spacer()
                }
                Button(action: {
                    self.defaultValue += self.defaultValue < self.maxValue ? 1 : 0
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "plus").font(Font.body.weight(.bold))
                    }
                }.padding()
            }
            .foregroundColor(Color("BrandPrimary"))
            .frame(minWidth: 100, maxWidth: .infinity)
            .background(Color("BrandPrimary").opacity(0.2))
            .cornerRadius(8)
        }
    }
}
    

struct CountPicker_Previews: PreviewProvider {
    static var previews: some View {
        CountPicker(label: "people")
    }
}
