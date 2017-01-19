//
//  NacigationController.swift
//  Hangman
//
//  Created by Lisa Tomren Kjørli on 09/12/2016.
//  Copyright © 2016 Lisa Tomren Kjørli. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //nav bar - 100% tranparent
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        
        
        //nav bar - white font
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [ NSForegroundColorAttributeName: UIColor.white]
        

       //self.navigationBar.titleTextAttributes = [
      //      NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Regular", size: 20) ,
     //     NSForegroundColorAttributeName: UIColor.white ]
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
