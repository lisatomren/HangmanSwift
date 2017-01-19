//
//  GameResultController.swift
//  Hangman
//
//  Created by Lisa Tomren Kjørli on 10/12/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//

import UIKit

class GameResultController: UIViewController {


    var player: Player!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var resultIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.background
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        if player.lost{
            resultLabel.text = "You lost!"
            resultIcon.image = UIImage( named: "crying.png")
        }
        else{
            resultLabel.text = "You won!"
            resultIcon.image = UIImage( named: "smiling.png")
        }
        
        correctWordLabel.text = "correct word was: " + player.correctWord
        
    }

}


