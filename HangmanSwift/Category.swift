//
//  Category.swift
//  Hangman
//
//  Created by Lisa Tomren Kjørli on 30/11/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//

import UIKit
import Foundation

class Category {
    var name: String
    var icon: UIImage?
    var words:[String]!
    var tabBarIcon: String
    
    init(name: String, icon: UIImage?, words:[String] ){
        self.name = name
        self.icon = icon
        self.words = words
        self.tabBarIcon = name + "IconTopBar.png"
    }
    
    func getRandomWord() -> String
    {
        let index = Int(arc4random_uniform(UInt32((words.count))))
        return words[index]
    }

    
    
}
