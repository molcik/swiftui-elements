//
//  RecipeRow.swift
//  sketch-elements
//
//  Created by Filip Molcik on 29/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardWithAttachment: View {
    
    var title: String
    var subTitle: String?
    var pictureUrl: URL
    var attachment: AnyView?
    
    var body: some View {
        Card{
            HStack(){
                VStack(alignment: .leading){
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(subTitle ?? "")
                        .font(.footnote)
                        .opacity(0.6)
                    Spacer()
                    attachment
                }
                Spacer()
                VStack(alignment: .trailing){
                    URLImage(pictureUrl, content:  {
                        $0.image
                            .renderingMode(.original)
                            .resizable()
                    })
                        .frame(width: 110, height: 70)
                        .cornerRadius(4)
                }
            }
            .frame(height:70)
            .foregroundColor(Constant.color.contrast)
            .padding()
        }
    }
}

struct CardWithAttachment_Previews: PreviewProvider {
    static var previews: some View {
        CardWithAttachment(
            title: recipesData[0].title,
            subTitle: recipeCategoriesData[0].subtitle,
            pictureUrl: recipesData[0].picture.uri,
            attachment: AnyView(Stars(3, label: "\(120) reviews")))
            .environmentObject(UserData())
    }
}
