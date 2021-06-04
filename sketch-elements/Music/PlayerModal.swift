//
//  ModalPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 02/03/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//


import SwiftUI
import UIKit
import URLImage

struct PlayerModal: View {
    
    var recipe: Recipe
    var action: () -> Void
    @State private var volume: Double = 30
    var albums: [Playlist]
    //var playlists: [Playlist]
    
    var body: some View {
        VStack(){
            //ModalHeader(action: self.action, title: "Ingredients")
            ModalHeader(action: self.action, title: "Nazev pisnicky", attachment: AnyView(_fromValue: Constant.icon.dots), tintColor: Constant.color.musicPrimary)
            /*ScrollView(.horizontal){

                //Text("Ahoj")
            }*/
            CardPictureModalPlayer(height: 300.0,
                                   pictureOneUrl: albums[1].picture.uri,
                                   albums: playlistData)
            /*
            Card {
                Spacer()
                    .background(
                        URLImage(albums[1].picture.uri, content:  {
                            $0.image
                                .renderingMode(.original)
                                .resizable()
                        })
                    )
            }
            .padding(.horizontal)
            */
            
            Spacer()
            
            /*ScrollView(.vertical){
                ForEach(self.recipe.ingredients) {ingredient in
                    CheckBoxTableRow(
                        divider: true,
                        content: ingredient.name,
                        description: ingredient.quantity,
                        checked: ingredient.checked
                    )
                }
            }*/
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack(){
                ButtonPlayer(
                    action: {Void.self},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.repeatIcon)
                        //.accentColor(Constant.color.musicPrimary)
                }
                //.padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {Void.self},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.backward)
                        //.accentColor(Constant.color.musicPrimary)
                }
                //.padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {Void.self},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.play)
                        //.accentColor(Constant.color.musicPrimary)
                }
                //.padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {Void.self},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.forward)
                        //.accentColor(Constant.color.musicPrimary)
                }
                //.padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {Void.self},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.shuffle)
                        //.accentColor(Constant.color.musicPrimary)
                }
                
                
                //.padding([.leading, .trailing])

                //Spacer()
            }
            //Divider()
            
 
            VStack(){
                Spacer()
                Slider(value: $volume, in: 0...100)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                Spacer()
                //Divider()
                
                Slider(value: $volume, in: 0...100)
                    //.padding(.horizontal)
                    .accentColor(.orange)
                Spacer()
            }

            
        }
    }
}

struct PlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        PlayerModal(recipe: recipesData[0], action: {}, albums: playlistData).environmentObject(UserData())
    }
}

