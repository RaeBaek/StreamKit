//
//  NetworkService.swift
//  Core
//
//  Created by 백래훈 on 10/22/25.
//

import Foundation

public final class NetworkService {
    public static let shared = NetworkService()

    private init() {}

    public func fetchVideoList() async throws -> [Video] {
        // 임시 데이터
        return [
            Video(
                id: "1",
                title: "테스트 영상",
                url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!
            ),
        ]
    }
}
