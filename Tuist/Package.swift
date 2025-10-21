// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "Collections": .framework,
            "Alamofire": .framework,
        ]
    )
#endif

let package = Package(
    name: "StreamKit",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
            from: "1.3.0"
        ),
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            from: "5.10.2"
        ),
    ]
)
