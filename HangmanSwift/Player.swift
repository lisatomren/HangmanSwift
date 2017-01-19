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
    var winnerWords: [String]? // not in use yet
    var wordPlaying: String = ""
    var lost = false
    var won = false
    
    
    init(lives: Int = totalLives, categoryIcon: UIImage?, correctWord: String ){
        self.lives = lives
        self.categoryIcon = categoryIcon
        self.correctWord = correctWord
        self.wordPlaying = getDefaultWordPlaying()
        self.hangmanImageName = getHangmanImage()
    }
    
    
    //get default word playing with symbol *
    func getDefaultWordPlaying() -> String {
        
        var defaultWordPlaying = ""
        for _ in correctWord.characters{
            defaultWordPlaying.insert( defaultWordPlayingSymbol, at: wordPlaying.endIndex  )
        }
        return defaultWordPlaying
    }
    
    //update word playing
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
    
    
    func hasLetter( _ tappedChar: Character) -> Bool
    {
        return correctWord.characters.contains(tappedChar)
    }
    
    //update Player
    func update( tappedChar: Character ){
        
        if( hasLetter( tappedChar ) ) { //player tapped correct char
            updateWordPlaying(tappedChar)
            won = (!wordPlaying.characters.contains(defaultWordPlayingSymbol))
        }
        else // wrong char tapped
        {
            lives -= 1         
            lost = ( lives == 0 )
            hangmanImageName = getHangmanImage()
        }
    }
    
}



