////
////  MiniPlayer.swift
////  sketch-elements
////
////  Created by Oliver Jansta on 02/03/2021.
////  Copyright © 2021 Filip Molcik. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//import URLImage
//
//struct MiniPlayer: View {
//    var albums: [Album]
//    @EnvironmentObject var modalManager: ModalManager
//    
//    
//    var body: some View {
//        HStack{
//            Image(systemName: Constant.icon.play)
//                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .scaleEffect(CGSize(width: 1.4, height: 1.4))
//                
//            //Text("Play/Pause")
//            
//            Button(action: {self.modalManager.openModal(position: .partiallyRevealed)}) {
//            
//            
//            Spacer()
//            VStack{
//                Text("Nazev skladby")
//                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
//                Text("Nazev alba")
//                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
//            }
//            Spacer()
//            
//            }.padding([.top, .leading, .trailing])
//            
//            
//            
//            //Image(systemName: Constant.icon.doc)
//            URLImage(albums[0].picture.uri, content:  {
//                image in image
//                    .renderingMode(.original)
//                    .resizable()
//            }).frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            .cornerRadius(3)
//            //UISlider()
//        }
//        .padding([.horizontal, .bottom], 10.0)
//        //.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
//        .foregroundColor(Constant.color.musicPrimary)
//        .onAppear {
//            self.modalManager.newModal(position: .closed) {
//                PlayerModal(recipe: recipesData[0], action: self.modalManager.closeModal, albums: playlistData)
//            }
//        }
//    }
//    
//}
//
//struct MiniPlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPlayer(albums: playlistData)
//    }
//}
