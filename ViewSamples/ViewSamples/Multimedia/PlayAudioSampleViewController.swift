//
//  PlayAudioSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import AVFoundation

class PlayAudioSampleViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global().async {
            if let path = Bundle.main.path(forResource: "sample", ofType: "mp3") {
                if let data = NSData(contentsOfFile: path) as? Data {
                    do {
                        try AVAudioSession.sharedInstance().setActive(true)
                        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                        
                        self.player = try AVAudioPlayer(data: data)
                        self.player.delegate = self
                        
                        if self.player.prepareToPlay() && self.player.play() {
                            
                        }
                        
                    } catch {
                        print("error")
                    }
                    
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        player?.stop()
    }
}


extension PlayAudioSampleViewController: AVAudioPlayerDelegate {
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        
    }
    
    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        if player != nil && UInt(flags) == AVAudioSessionInterruptionOptions.shouldResume.rawValue {
            player.play()
        }
    }
}
