//
//  PlayVideoSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import MediaPlayer

class PlayVideoSampleViewController: UIViewController {
    
    var player: MPMoviePlayerController!

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "sample", withExtension: "mp4") {
            player = MPMoviePlayerController(contentURL: url)
            player.scalingMode = .aspectFit
            player.view.frame = containerView.bounds
            containerView.addSubview(player.view)
            
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        player.play()
    }
    
    @IBAction func stopVideo(_ sender: Any) {
        player.stop()
    }
    
}
