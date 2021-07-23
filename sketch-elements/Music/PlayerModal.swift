//
//  ModalPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 02/03/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import AVKit
import SwiftUI
import UIKit
import URLImage

struct PlayerModal: View {
    var action: () -> Void
    @State private var volume: Double = 30
    var albums: [Album]
    @State var audioPlayer: AVPlayer!
    
    var body: some View {
        VStack {
            ModalHeader(action: self.action, title: "Nazev pisnicky", attachment: AnyView(_fromValue: Constant.icon.dots), tintColor: Constant.color.musicPrimary)
         
            ModalPlayerCard(albums: albums, image: albums[0].picture.uri)
         
            Spacer()
      
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack {
                ButtonPlayer(
                    action: {},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.repeatIcon)
                    // .accentColor(Constant.color.musicPrimary)
                }
                // .padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.backward)
                    // .accentColor(Constant.color.musicPrimary)
                }
                // .padding([.leading, .trailing])
                Spacer()
                
                var buttonTrigger = true

                Button(action: {
                    if buttonTrigger {
                        self.audioPlayer.play()
                        buttonTrigger.toggle()
                    }
                    else {
                        self.audioPlayer.pause()
                        buttonTrigger.toggle()
                    }
                    
                    // buttonTrigger.toggle()
                    // self.buttonTrigger = false
                }) {
                    Image(systemName: Constant.icon.playPause)
                    // .accentColor(Constant.color.musicPrimary)
                }
                    
                /*
                 ButtonPlayer(
                     action: {Void.self},
                     foregroundColor: Constant.color.musicPrimary
                 ) {
                     Image(systemName: Constant.icon.play)
                         //.accentColor(Constant.color.musicPrimary)
                 }
                 //.padding([.leading, .trailing])
                 */
                
                Spacer()
                ButtonPlayer(
                    action: {},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.forward)
                    // .accentColor(Constant.color.musicPrimary)
                }
                // .padding([.leading, .trailing])
                Spacer()
                ButtonPlayer(
                    action: {},
                    foregroundColor: Constant.color.musicPrimary
                ) {
                    Image(systemName: Constant.icon.shuffle)
                    // .accentColor(Constant.color.musicPrimary)
                }
                
                // .padding([.leading, .trailing])

                // Spacer()
            }
            // Divider()
            
            VStack {
                Spacer()
                Slider(value: $volume, in: 0...100)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                Spacer()
                // Divider()
                
                Slider(value: $volume, in: 0...100)
                    // .padding(.horizontal)
                    .accentColor(.orange)
                Spacer()
            }
        }
        .onAppear {
            // let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            // self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            if let musicUrl = URL(string: "https://firebasestorage.googleapis.com/v0/b/react-native-e.appspot.com/o/albums%2Fbrother%2FThe%20Likes%20of%20Love.m4a?alt=media&token=b4fcc9cb-6add-4058-9a23-83f7abf1fb") {
                self.audioPlayer = AVPlayer(url: musicUrl)
                
                // self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(string: //"https://s3.amazonaws.com/kargopolov/kukushka.mp3")!)
            }
        }
    }
}

struct PlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        PlayerModal(action: {}, albums: musicData).environmentObject(UserData())
    }
}
