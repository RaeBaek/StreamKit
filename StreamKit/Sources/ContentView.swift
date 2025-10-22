//
//  ContentView.swift
//  StreamKit
//
//  Created by 백래훈 on 10/21/25.
//

import AVKit
import Core
import Player
import SwiftUI

struct ContentView: View {
    @State private var videos: [Video] = []

    var body: some View {
        NavigationStack {
            List(videos, id: \.id) { video in
                NavigationLink(video.title) {
                    PlayerView(player: AVPlayer(url: video.url))
                }
            }
            .navigationTitle("StreamKit")
            .task {
                do {
                    videos = try await NetworkService.shared.fetchVideoList()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
