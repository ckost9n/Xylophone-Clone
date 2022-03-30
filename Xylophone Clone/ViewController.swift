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
        togleButtonAlpha(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.togleButtonAlpha(sender)
        }
        guard let buttonText = sender.currentTitle else { return }
        playSound(buttonText)
    }
    
    func togleButtonAlpha(_ button: UIButton) {
        button.alpha = button.alpha == 1 ? 0.5 : 1
    }
    
    func playSound(_ buttonText: String) {
        guard let url = Bundle.main.url(forResource: buttonText, withExtension: "wav") else { return }
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()

//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
    }
    
}

