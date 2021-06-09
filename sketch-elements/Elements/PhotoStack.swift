//
//  PhotoStack.swift
//  sketch-elements
//
//  Created by Filip Krayem on 06.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct PhotoStack: View {
    @Environment(\.colorScheme) var colorScheme
    
    var numberOfPhotos: Int
    var showcasedPhotos: [Photo]
    var hidden: Bool
    let rotations = [0, 8, -11]
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            ForEach(showcasedPhotos.indices, id: \.self) { i in
                URLImage(showcasedPhotos[i].urls.small, content: {
                    $0.image
                        .resizable()
                        .aspectRatio(1/1, contentMode: .fit)
                        .border((colorScheme == .dark ? Color.gray : Color.white), width: hidden ? 1 : 4)
                        .shadow(color: .black.opacity(0.075), radius: 1, x: 0, y: 1)
                        .rotationEffect(.init(degrees: Double(rotations[i])))
                      
                })
                .zIndex(Double(999 - i))
            }
            ZStack(alignment: .top, content: {
                Rectangle()
                    .frame(width: 50, height: 20)
                    .foregroundColor(.white)
                    .cornerRadius(10, antialiased: true)
                    .padding(.bottom)
                Text("\(numberOfPhotos)")
                    .foregroundColor(Constant.color.photographyPrimary)
                    .font(.callout)
            })
            .zIndex(Double(1000))
            .opacity(hidden ? 0 : 1)
            
            
        })
    }
    
}
struct PhotoStack_Previews: PreviewProvider {
    static var previews: some View {
        PhotoStack(numberOfPhotos: 30, showcasedPhotos: Array(photographyData.prefix(3)), hidden: false)
            .environmentObject(UserData()) 
            .environment(\.colorScheme, .light)
    }
}

