//
//  Slider.swift
//  sketch-elements
//
//  Created by Filip Krayem on 24.07.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI

struct SongProgressSlider: View {

    @Binding var seconds: Int // or some value binded
    var songTime: Int
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.06))

                Rectangle()
                    .foregroundColor(color)
                    .frame(width: geometry.size.width * CGFloat(self.seconds / songTime))
            }
            .cornerRadius(12, antialiased: true)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.seconds = Int(min(max(0, Float(value.location.x / geometry.size.width * CGFloat(songTime))), Float(songTime)))
                }))
        }
    }
}

struct SongProgressSlider_Previews: PreviewProvider {
    static var previews: some View {
        SongProgressSlider(seconds: .constant(20), songTime: 120, color: .accentColor)
            .frame(width: 200, height: 10)
    }
}
