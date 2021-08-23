//
//  ModalPlayer.swift
//  sketch-elements
//
//  Created by Oliver Jansta on 02/03/2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import AVKit
import Combine
import SwiftUI
import UIKit

struct PlayerModal: View {
    var action: () -> Void
    @State private var seconds: Float = 0
    @State var songTime: Float = 1
    @State var audioPlayer = AVPlayer()
    @Binding var modalState: ModalState
    @ObservedObject var viewModel: MusicViewModel

    var body: some View {
        VStack {
            ModalHeader(action: self.action, title: viewModel.song.name, attachment: AnyView(_fromValue: Constant.icon.dots), tintColor: Constant.color.musicPrimary)
            ModalPlayerCard(image: viewModel.song.album!.picture.uri).padding(.top)
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

                    ButtonPlayer(action: {
                                     if !viewModel.isMusicPlaying() {
                                         viewModel.play()
                                         self.audioPlayer.play()
                                     }
                                     else {
                                         viewModel.pause()
                                         self.audioPlayer.pause()
                                     }

                                 },
                                 foregroundColor: Constant.color.musicPrimary) {
                        Image(systemName: viewModel.isMusicPlaying() ? Constant.icon.pause : Constant.icon.play)
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
                        Text("\(timeFromSeconds(Int(seconds)))").foregroundColor(Constant.color.musicPrimary)
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.06))
                                Rectangle()
                                    .foregroundColor(Constant.color.musicPrimary)
                                    .frame(width: geometry.size.width * CGFloat(self.seconds / songTime))
                            }
                            .cornerRadius(12, antialiased: true)
                            .gesture(DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    self.seconds = Float(min(max(0, Float(value.location.x / geometry.size.width * CGFloat(songTime))), Float(songTime)))
                                    self.audioPlayer.seek(to: CMTimeMake(value: Int64(self.seconds), timescale: 1))
                                })
                        }.frame(height: 10)

                        Text("\(timeFromSeconds(Int(songTime)))").foregroundColor(Constant.color.musicPrimary)
                    }
                    Spacer()
                }.padding([.horizontal, .top])
                    .padding(20)
            }
            .onReceive(viewModel.$song, perform: { _ in
                self.audioPlayer.seek(to: CMTime.zero)
                playSong()

            })
            .onReceive(viewModel.$isPlaying, perform: { isPlaying in
                if isPlaying {
                    self.audioPlayer.play()
                } else {
                    self.audioPlayer.pause()
                }
            })
        }
    }

    func playSong() {
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//        let song = Bundle.main.url(forResource: "Hearts Were Gold", withExtension: "mp3")
//        self.audioPlayer.replaceCurrentItem(with: AVPlayerItem(url: song!))
        self.audioPlayer.pause()
        self.audioPlayer.replaceCurrentItem(with: AVPlayerItem(url: self.viewModel.song.uri))

        // This is here so music doesn't start playing right at the start of the app
        if self.viewModel.isMusicPlaying() {
            self.audioPlayer.play()
        }

        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 1, preferredTimescale: timeScale)
        self.audioPlayer.addPeriodicTimeObserver(forInterval: time, queue: .main) { time in
            seconds = Float(CMTimeGetSeconds(time))
        }
        self.songTime = Float(CMTimeGetSeconds((self.audioPlayer.currentItem?.asset.duration)!))
    }
}

struct PlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        PlayerModal(action: {}, modalState: .constant(ModalState.closed), viewModel: MusicViewModel()).environmentObject(UserData())
    }
}
