//
//  SoundPlayer.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation
import AVFoundation

struct SoundPlayer {
    
    // MARK: - Properties
    
    var player: AVAudioPlayer?
    
    // MARK: - Methods
    
    mutating func playSound(named soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            // Don't play sound
        }
    }
}
