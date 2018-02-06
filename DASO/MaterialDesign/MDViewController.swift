//
//  MDViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit



class MDViewController: UIViewController  {
    
    
    

    var tab: UITabBarController? {
        didSet {
            if (oldValue != nil) {
                oldValue!.view.removeFromSuperview();
                
            }
            self.view.addSubview(tab!.view);
        }
    }
    
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
   
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    

}
