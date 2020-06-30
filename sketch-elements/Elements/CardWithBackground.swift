//
//  RecipeRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 29/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardWithBackground: View {
    
    var title: String
    var subTitle: String?
    var height: CGFloat
    var pictureUrl: URL
    var description: String?
    
    var body: some View {
        Card{
            VStack(){
                HStack() {
                    VStack(alignment: .leading) {
                        if (subTitle != nil ){
                            Text((subTitle!).uppercased())
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .opacity(0.6)
                        }
                        Text(title)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    Spacer()
                }
                Spacer()
                HStack() {
                    Text(description ?? "")
                    Spacer()
                }
                
            }
            .padding(.all)
            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(description != nil ? 0.3 : 0)]), startPoint: .top, endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .foregroundColor(Color.white)
            .background(
                URLImage(pictureUrl, content:  {
                    $0.image
                        .renderingMode(.original)
                        .resizable()
                })
            )
        }
    }
}

struct CardWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        CardWithBackground(
            title: recipesData[0].title,
            subTitle: recipeCategoriesData[0].subtitle,
            height: 300.0,
            pictureUrl: recipesData[0].picture.uri,
            description: "\(recipesData[0].minutes) minutes")
            .environmentObject(UserData())
    }
}
