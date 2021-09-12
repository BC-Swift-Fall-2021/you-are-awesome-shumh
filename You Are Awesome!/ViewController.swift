//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Richard Shum on 9/1/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var soundNumber = -1
    var messageNumber = -1
    let totalNumberOfSounds = 6
    let totalNumberOfImages = 10
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    
    func playSound(name: String){
       if let sound = NSDataAsset(name: name){
           do {
               try audioPlayer = AVAudioPlayer(data: sound.data)
               audioPlayer.play()
           } catch {
               print("😡 Error: \(error.localizedDescription)Could not read data from file \(name)")
           }
       } else {
           print("😡 Error: Could not read data from file \(name)")
       }
   }
    
    func nonRepeatingRandom(originalNumber: Int, upperBounds: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds-1)
        } while originalNumber == newNumber
        return newNumber
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton)  {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You've Got the Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperBounds: messages.count)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperBounds: totalNumberOfImages)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperBounds: totalNumberOfSounds)
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")
        }
    }
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil { //if is.On is false
                audioPlayer.stop()
        }
    }
    
}

