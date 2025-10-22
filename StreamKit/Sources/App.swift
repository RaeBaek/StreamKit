//
//  App.swift
//  StreamKit
//
//  Created by 백래훈 on 10/21/25.
//

import Collections
import Player
import SwiftUI

struct StreamKitApp2: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView2: View {
    var deque = Deque([1, 2, 3])

    let engine = PlayerEngine()
    let env = Bundle.main.infoDictionary?["APP_ENV"] as? String ?? "UNKNOWN"
    let env2 = Bundle.main.object(forInfoDictionaryKey: "APP_ENV") as? String ?? "UNKNOWN"
    // 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234dsdsdsadsadsdsadsads
    var body: some View {
        VStack {
            Text("Hello, StreamKit!")
                .padding()

            Button("Start Player") { self.engine.start() }
                .padding()

            Text(self.env)
                .padding()

            Text(self.env2)
                .padding()
        }
    }
}
