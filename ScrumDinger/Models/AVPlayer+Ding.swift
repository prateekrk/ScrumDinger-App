//
//  AVPlayer+Ding.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 20/10/24.
//

import Foundation
import AVFoundation
extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
