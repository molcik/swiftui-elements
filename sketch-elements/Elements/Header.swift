//
//  Header.swift
//  sketch-elements
//
//  Created by Filip Molcik on 08/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct Header: View {
    
    var image: URL
    var title: String?
    var leftItem: AnyView?
    var rightItem: AnyView?
    
    var body: some View {
        VStack(){
            HStack(){
                leftItem
                Spacer()
                rightItem
            }
            
            Spacer()
            HStack(){
                Text(title ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding(.top)
        .padding(.all)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom))
        .background(
            URLImage(image, content:  {
                $0.image
                    .renderingMode(.original)
                    .resizable(capInsets: .init(), resizingMode: .tile)
            }))
            .frame(maxWidth: .infinity)
            .frame(height: 223)
    }
}
