import Collections
import Player
import SwiftUI

@main
struct StreamKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
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
