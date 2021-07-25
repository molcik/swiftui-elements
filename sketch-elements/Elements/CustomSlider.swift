//
//  Slider.swift
//  sketch-elements
//
//  Created by Filip Krayem on 24.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct CustomSlider: View {

    @Binding var percentage: Float // or some value binded

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.06))

                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(width: geometry.size.width * CGFloat(self.percentage / 100))
            }
            .cornerRadius(12, antialiased: true)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.percentage = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                }))
        }
    }
}
struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(percentage: .constant(20))
            .frame(width: 200, height: 10)
    }
}
