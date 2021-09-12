//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Richard Shum on 9/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton)  {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You've Got the Design Skills of Jony Ive"]
        
        var newMessage = messages[Int.random(in: 0...messages.count-1)]
        while messageLabel.text == newMessage {
            newMessage = messages[Int.random(in: 0...messages.count-1)]
        }
        messageLabel.text = messages[Int.random(in: 0...messages.count-1)]
        
        var newImage = UIImage(named: "image\(Int.random(in: 0...9))")
        while imageView.image == newImage {
            newImage = UIImage(named: "image\(Int.random(in: 0...9))")
        }
        imageView.image = newImage
    }
    
}

