//
//  CardMusic.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 26/01/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import SwiftUI
import URLImage

struct CardPlaylist: View {
    
    var title: String
    //var subTitle: String?
    var height: CGFloat
    var pictureUrl: URL
    var description: String?
    let largeConfig = UIImage.SymbolConfiguration(scale: .medium)
    var albums: [Playlist]

    
    var body: some View {
        Card{
            ZStack(){
                VStack(spacing: 0){
                    HStack(){
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: height/2 )
                            .foregroundColor(Color.white)       .background(
                                URLImage(albums[0].picture.uri, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                                    })
                                )
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: height/2 )
                            .foregroundColor(Color.white)       .background(
                                    URLImage(albums[1].picture.uri, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                                    })
                                )
                        }
                    HStack(){
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: height/2 )
                            .foregroundColor(Color.white)       .background(
                                    URLImage(albums[2].picture.uri, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                                    })
                                )
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: height/2 )
                            .foregroundColor(Color.white)       .background(
                                    URLImage(albums[3].picture.uri, content:  {
                                $0.image
                                    .renderingMode(.original)
                                    .resizable()
                                    })
                                )
                        }
                    }
                VStack(){
                    HStack() {
                        VStack(alignment: .leading) {
                            /*
                             if (subTitle != nil ){
                                Text((subTitle!).uppercased())
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .opacity(0.6)
                            }*/
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
                        ZStack(){
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                                .opacity(0.6)
                            Image(systemName: Constant.icon.play)
                                .scaleEffect(CGSize(width: 1.4, height: 1.4))
                                
                        }
                    }
                }
                    
                .padding(.all)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(description != nil ? 0.3 : 0)]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundColor(Color.white)
                /*.background(
                    URLImage(pictureUrl, content:  {
                        $0.imageOne
                            .renderingMode(.original)
                            .resizable()
                    })
                )*/

                }
                
            }
            

            
            
            
        }
    }


struct CardPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        CardPlaylist(
            title: "Little Victories",
            //title: recipesData[0].title,
            //subTitle: recipeCategoriesData[0].subtitle,
            height: 300.0,
            pictureUrl: recipesData[0].picture.uri,
            description: "Color minutes, Ribbons, Brother",
            albums: playlistData
        )
            .environmentObject(UserData())
    }
}
