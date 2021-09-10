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
        let imageNumber = Int.random(in: 0...9)
        let imageName = "image\(imageNumber)"
        imageView.image = UIImage(named: imageName)
        
        let messages = ["You Are Awesome!", "You Are Great!", "You Are Fantastic!", "Fabulous? That's You!", "When the Genius Bar Needs Help, They Call You"]
        let messageNumber = Int.random(in: 0...messages.count-1)
        messageLabel.text = messages[messageNumber]
    }
    
}

