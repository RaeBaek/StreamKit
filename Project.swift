import ProjectDescription

let project = Project(
    name: "StreamKit",
    settings: .settings(
        base: [
            "SWIFT_VERSION": "5.10",
            "DEVELOPMENT_TEAM": "DD66GTY4AT",
            "CODE_SIGN_STYLE": "Automatic",
        ],
        configurations: [
            .debug(name: .debug, xcconfig: "Configs/Debug-Dev.xcconfig"),
            .release(name: .release, xcconfig: "Configs/Release-Prod.xcconfig"),
        ]
    ),
    targets: [
        // App
        .target(
            name: "StreamKit",
            destinations: .iOS,
            product: .app,
            bundleId: "com.raehoon.StreamKit",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "",
                    "UIImageName": "",
                ],
                "APP_ENV": "$(APP_ENV)",
            ]),
            buildableFolders: [
                "StreamKit/Sources",
                "StreamKit/Resources",
            ],
            //            scripts: [
            //              .pre(script: "swiftformat .", name: "SwiftFormat"),
            //              .pre(script: "swiftlint --quiet", name: "SwiftLint")
            //            ],
            scripts: [
                // ✅ SwiftFormat
//                .pre(script: """
//                export PATH="$HOME/.local/share/mise/installs/swiftformat/0.58.5/bin:$PATH"
//                swiftformat .
//                """, name: "SwiftFormat"),

                // ✅ SwiftLint
//                .pre(script: """
//                export PATH="$HOME/.local/share/mise/installs/swiftlint/0.62.1:$PATH"
//                swiftlint --quiet
//                """, name: "SwiftLint"),
            ],
            //			scripts: [
            //				.pre(script: "/Users/baek/.local/share/mise/installs/swiftformat/0.58.5/bin/swiftformat .", name: "SwiftFormat"),
            //				.pre(script: "/Users/baek/.local/share/mise/installs/swiftlint/0.62.1/swiftlint --quiet", name: "SwiftLint"),
            //			],
            dependencies: [
                .target(name: "Core"),
                .target(name: "Player"),
                .external(name: "Collections", condition: .none),
                .external(name: "Alamofire", condition: .none),
            ]
        ),
        // Unit Tests
        .target(
            name: "StreamKitTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.raehoon.StreamKitTests",
            infoPlist: .default,
            buildableFolders: [
                "StreamKit/Tests",
            ],
            dependencies: [.target(name: "StreamKit")]
        ),
        // Core module
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.raehoon.StreamKit.core",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/Core/Sources/**"],
            resources: ["Modules/Core/Resources/**"],
            dependencies: []
        ),

        // Player module
        .target(
            name: "Player",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.raehoon.StreamKit.player",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/Player/Sources/**"],
            resources: ["Modules/Player/Resources/**"],
            dependencies: [.target(name: "Core")] // Player가 Core를 사용
        ),
    ]
)
