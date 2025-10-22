//
//  PlayerView.swift
//  Player
//
//  Created by 백래훈 on 10/22/25.
//

import AVKit
import SwiftUI

public struct PlayerView: View {
    private var player: AVPlayer

    public init(player: AVPlayer) {
        self.player = player
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
            Text("플레이어 상태: \(player.status)")
        }
    }
}

#Preview {
    PlayerView(player: AVPlayer())
}
