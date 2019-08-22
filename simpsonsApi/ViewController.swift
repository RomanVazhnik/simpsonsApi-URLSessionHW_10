//
//  ViewController.swift
//  simpsonsApi
//
//  Created by Роман Важник on 22/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var cloudOne: UIImageView!
    @IBOutlet var cloudTwo: UIImageView!
    @IBOutlet var cloudThree: UIImageView!
    
    @IBOutlet var startButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStartButton()
    }

    @IBAction func startButtonPressed() {
        UIView.animate(withDuration: 1) {
            self.cloudOne.frame.origin.x -= 100
            self.cloudTwo.frame.origin.x += 100
            self.cloudThree.frame.origin.x -= 200
        }
        
        startButton.animation = "fadeOut"
        startButton.animate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cloudOne.isHidden = true
            self.cloudTwo.isHidden = true
            self.cloudThree.isHidden = true
            self.performSegue(withIdentifier: "secondVC", sender: nil)
        }
    }
    
    func setupStartButton() {
        startButton.duration = 0.5
        startButton.delay = 0
    }
    
}

