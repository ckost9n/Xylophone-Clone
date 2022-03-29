//
//  ViewController.swift
//  Xylophone Clone
//
//  Created by Konstantin on 27.03.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var buttonCollection: [UIButton]!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonCollection()
    }
    
    func setupButtonCollection() {
        for button in buttonCollection {
            button.layer.cornerRadius = 10
        }
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

