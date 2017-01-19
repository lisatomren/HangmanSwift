//
//  CategoriesController.swift
//  Hangman
//
//  Created by Lisa Tomren Kjørli on 30/11/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//
//
//
// collection view
// collection view header

import UIKit


class CategoriesController: UICollectionViewController {
    
    var allCategories = [Category]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = Constants.background
        
        //improve this
        allCategories = [
            Category(name:"fruits", icon: UIImage(named:"fruits.png"), words: ["apple", "orange", "banana", "lemon"]),
            Category(name:"clothes", icon:UIImage(named:"clothes.png"), words: ["pants","dress","socks", "skirt" ])
            
        ]

    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories.count
    }

    //cell styling
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath as IndexPath) as! CategoryCell

        cell.CategoryName.text = allCategories[indexPath.row].name
        cell.CategoryIcon.image = allCategories[indexPath.row].icon
        
        return cell
    }
    
    
    //Segue - set categorychosen in game controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartGame" {
            let gameController = segue.destination as! GameController;
            let cell = sender as! CategoryCell
            
            //send category chosen
            let categoryName = cell.CategoryName.text
            gameController.categoryChosen = allCategories.first(where:{ $0.name == categoryName})
            
            
        }
    }
    
    
    //collection header view - copy. 
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "header",
                                                                             for: indexPath) as! CategoriesHeader

            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    


}
