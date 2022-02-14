//
//  MusicManager.swift
//  MusicAndNews
//
//  Created by Santo Michael Sihombing on 14/02/22.
//

import Foundation
import AVFoundation

public class MusicManager {
    static let shared = MusicManager()
    
    private var av: AVAudioPlayer?
    public var isPlaying: Bool = false
    
    public func player(path: String) {
        let path = Bundle.main.path(forResource: path, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            av = try AVAudioPlayer(contentsOf: url)
            av?.numberOfLoops = .max
            if isPlaying {
                av?.stop()
                self.isPlaying = false
            } else {
                av?.play()
                self.isPlaying = true
            }
            
        } catch {
            // couldn't load file :(
            fatalError("couldn't load file :(")
        }
    }
}
