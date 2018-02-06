//
//  menuDrawerViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/23/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class menuDrawerViewController: UIViewController {
    var leftView: UIView!;
    var frontView: UIView!;
    
    
    
    
    init(leftViewController: UIViewController, frontViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil);
        createViews();
        
        assignView(leftViewController: leftViewController, frontViewController: frontViewController);
        
       
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
   
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func menuPressed() {
        print("press");
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func createViews() {
        leftView = UIView(frame: CGRect(x: -(UIScreen.main.bounds.width - MENU_OFFSET), y: self.view.frame.origin.y, width:self.view.frame.width - MENU_OFFSET, height: self.view.frame.height));
        
        leftView.backgroundColor = UIColor.red;
        
        
        frontView = UIView(frame: self.view.frame);
        
        frontView.backgroundColor = UIColor.green;
        
        
    }
    
    func  assignView(leftViewController: UIViewController, frontViewController: UIViewController) {
        
    }
    
   

}
