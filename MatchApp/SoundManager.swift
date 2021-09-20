//
//  SoundManager.swift
//  MatchApp
//
//  Created by Mehar on 20/09/2021.
//

import Foundation
import AVFoundation

class SoundManager {
    
   static  var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect{
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
   static func playSound(_ effect:SoundEffect){
        var soundFilename = ""
        
        //determine which sound effect we want to play and set that file name
        
        switch effect{
        
        case .flip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        }
        //get the path of sound file in bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else{
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        //create a URL object from the string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do{
            //create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            //play the sound
            audioPlayer?.play()
        }catch{
            //couldnt create ausio player object
            print("couldnt create ausio player object for \(soundFilename)")
        }
        
    }
}
