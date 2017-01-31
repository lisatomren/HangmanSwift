//
//  Player.swift
//  Hangman
//
//  Created by Lisa Tomren Kjørli on 30/11/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//

import Foundation
import UIKit

class Player {
    
    static let totalLives = 6
    let defaultWordPlayingSymbol: Character = "*"
    
    var lives: Int
    var categoryIcon: UIImage?
    var hangmanImageName : String = ""
    var correctWord: String
    //var winnerWords: [String]? // not in use yet
    var wordPlaying: String = ""
    
    var won: Bool {
        return (!wordPlaying.characters.contains(defaultWordPlayingSymbol))
    }
    
    var lost: Bool {
        return lives == 0
    }
    
    
    init(lives: Int = totalLives, categoryIcon: UIImage?, correctWord: String ){
        self.lives = lives
        self.categoryIcon = categoryIcon
        self.correctWord = correctWord
        self.wordPlaying = String (Array(repeating:defaultWordPlayingSymbol, count: correctWord.characters.count))
        self.hangmanImageName = getHangmanImage()
    }
    
    
    //char btn tapped, update word playing
    func updateWordPlaying( _ tappedChar: Character )    {

        for i in 0...correctWord.characters.count-1 {
            let index = correctWord.index(correctWord.startIndex, offsetBy: i)
            
				if ( correctWord[index] == tappedChar )
				{
                    wordPlaying.remove( at: index )
                    wordPlaying.insert(tappedChar, at: index)//update wordPlaying
				}
        }

    }
    
    func getHangmanImage() -> String
    {
        var imageName = ""
        
        switch self.lives {
        case 6:
            imageName = "hangman6.png"
        case 5:
            imageName = "hangman5.png"
        case 4:
            imageName = "hangman4.png"
        case 3:
            imageName = "hangman3.png"
        case 2:
            imageName = "hangman2.png"
        case 1:
            imageName = "hangman1.png"
        default:
            imageName = "hangman0.png"
        }
        
        return imageName
    }
    
    //update Player
    func update( tappedChar: Character ){
        
        if( correctWord.characters.contains( tappedChar ) ) { //correct char tapped
            updateWordPlaying(tappedChar)
        }
        else // wrong char tapped
        {
            lives -= 1
            hangmanImageName = getHangmanImage() // update hangman image
        }
    }
    
}



