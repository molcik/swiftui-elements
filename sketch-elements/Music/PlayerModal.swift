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
    @State private var volume: Float = 30
    var song: Song
    @State var audioPlayer: AVPlayer!
    @State var isPlaying: Bool = false

    var body: some View {
        VStack {
            ModalHeader(action: self.action, title: song.name, attachment: AnyView(_fromValue: Constant.icon.dots), tintColor: Constant.color.musicPrimary)
            ModalPlayerCard(image: musicData[0].picture.uri).padding(.top)
            VStack {
                Spacer(minLength: 35)
          
                HStack {
                    ButtonPlayer(
                        action: {},
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName: Constant.icon.repeatIcon)
                    }
                    Spacer()
                    ButtonPlayer(
                        action: {},
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName: Constant.icon.backward)
                    }
                    Spacer()
                
                    var buttonTrigger = true

                    Button(action: {
                        if buttonTrigger {
                            self.audioPlayer.play()
                        }
                        else {
                            self.audioPlayer.pause()
                        }
                        buttonTrigger.toggle()
                        isPlaying.toggle()
                    }) {
                        Image(systemName: isPlaying ? Constant.icon.pause : Constant.icon.play)
                    }
                    
                    Spacer()
                    ButtonPlayer(
                        action: {},
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName: Constant.icon.forward)
                    }
                    Spacer()
                    ButtonPlayer(
                        action: {},
                        foregroundColor: Constant.color.musicPrimary
                    ) {
                        Image(systemName: Constant.icon.shuffle)
                    }
                }.padding([.horizontal, .bottom])
                VStack {
                    HStack {
                        Text("0:35").foregroundColor(Constant.color.musicPrimary)
                        CustomSlider(percentage: $volume)
                            .frame(height: 10)
                            .padding()
                        Text("2:00").foregroundColor(Constant.color.musicPrimary)
                    }
                    
                    Spacer()
                }.padding([.horizontal, .top])
            }
            .padding(20)
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
}

struct PlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        PlayerModal(action: {}, song: getAlbumSongs(musicData[0])[0]).environmentObject(UserData())
    }
}
