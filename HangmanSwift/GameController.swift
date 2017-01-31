//
//  GameController.swift
//  Hangman
//  Created by Lisa Tomren Kjørli on 30/11/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//
//
//



import UIKit

class GameController: UIViewController {
    
 
    @IBOutlet weak var categoryIcon: UIBarButtonItem!
    @IBOutlet weak var wordPlayingLabel: UILabel!
    @IBOutlet weak var hangmanAnimationImage: UIImageView!
   
    
    var categoryChosen: Category! // set in categories controller
    var player: Player!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = Constants.background
        
        //new game
        let correctWord = self.categoryChosen.getRandomWord()
        player = Player(categoryIcon: nil, correctWord: correctWord)
       
        wordPlayingLabel.text = player.wordPlaying
        hangmanAnimationImage.image = UIImage(named: player.hangmanImageName)
        categoryIcon.image = UIImage( named: categoryChosen.tabBarIcon)
    }
    
    
    //char button tapped
    @IBAction func charButtonTapped(_ sender: UIButton) {
        let charKeyText = sender.currentTitle?.lowercased()
        let charTapped = charKeyText?[(charKeyText?.startIndex)!]
        
        //update player
        player.update(tappedChar: charTapped! )
        
        //upate view
        sender.isEnabled = false
        sender.isUserInteractionEnabled = false
        wordPlayingLabel.text = player.wordPlaying
        hangmanAnimationImage.image = UIImage(named: player.hangmanImageName)
        
        if( player.lost || player.won )
        {
            goToGameResultView()
            //self.perform(#selector(goToGameResultView), with: nil, afterDelay: 1.0) //1 sec
        }
        
    }
    
    //Segue - set player in game result controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowGameResultView" {
            
            let controller = segue.destination as! GameResultController;
            controller.player = player
        }
    }
    
    func goToGameResultView(){
          self.performSegue(withIdentifier: "ShowGameResultView", sender: self)
    }
    
}



