//
//  RecordAudioSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class RecordAudioSampleViewController: UIViewController {
    
    var recorder: AVAudioRecorder!
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.duckOthers)
            
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                
            })
        } catch {
            print("error")
        }
    }

    @IBAction func performStartRecord(_ sender: Any) {
        do {
            let fileManager = FileManager()
            
            let documentsUrl = try fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            
            let url = documentsUrl.appendingPathComponent("rec.m4a")
            
            let options = [AVFormatIDKey: NSNumber(value:Int(kAudioFormatAppleLossless)),
                           AVSampleRateKey: NSNumber(value:44100.0),
                           AVNumberOfChannelsKey: NSNumber(value:1),
                           AVEncoderAudioQualityKey: NSNumber(value:AVAudioQuality.high.rawValue)]
            
            recorder = try AVAudioRecorder(url: url, settings: options)
            recorder.delegate = self
            
            if recorder.prepareToRecord() && recorder.record() {
                print("start")
            } else {
                print("failed to record")
                recorder = nil
            }
            
        } catch {
            print("error")
        }
    }
    
    @IBAction func performStopRecord(_ sender: Any) {
        recorder.stop()
    }
    
    @IBAction func performPlay(_ sender: Any) {
        do {
            let fileManager = FileManager()
            
            let documentsUrl = try fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
            
            let url = documentsUrl.appendingPathComponent("rec.m4a")
            
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedRead)
            
            player = try AVAudioPlayer(data: data)
            if player.prepareToPlay() && player.play() {
                print("started")
            }
        } catch {
            print("error")
        }
    }
}


extension RecordAudioSampleViewController: AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    func audioRecorderEndInterruption(_ recorder: AVAudioRecorder, withOptions flags: Int) {
        if UInt(flags) == AVAudioSessionInterruptionOptions.shouldResume.rawValue {
            recorder.record()
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("ok")
            self.recorder = nil
        }
    }
}
