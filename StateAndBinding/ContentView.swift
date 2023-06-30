//
//  ContentView.swift
//  StateAndBinding
//
//  Created by 胡文博 on 2023/06/28.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlayingM = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .frame(height: 300)
                PlayerButton(isPlaying: $isPlayingM)
            }
            Text(isPlayingM ? "播放中" : "准备中")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct PlayerButton: View {
    // 单一数据源(single source of truth, ssot)概念
    @Binding var isPlaying: Bool
    var body: some View{
        Button {
            isPlaying.toggle()
        } label: {
            Text(isPlaying ? "暂停" : "播放").font(.largeTitle)
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
