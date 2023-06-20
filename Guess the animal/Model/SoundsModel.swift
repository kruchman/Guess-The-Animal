//
//  SoundsModel.swift
//  Guess the animal
//
//  Created by Юрий Кручинин on 18/6/23.
//

import UIKit
import AVFoundation

class SoundsModel {
    
    var player: AVAudioPlayer!
    
    let arrayOfRightSounds = ["right first", "right second", "right third"]
    
    var isSoundOn = true
    
    func enableSound() {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Failed to enable sound: \(error)")
            }
        }
        
        func disableSound() {
            do {
                try AVAudioSession.sharedInstance().setCategory(.ambient, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Failed to disable sound: \(error)")
            }
        }
    
    func playSoundWrong() {
        let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func playSoundRight() {
        let url = Bundle.main.url(forResource: arrayOfRightSounds.randomElement(), withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
