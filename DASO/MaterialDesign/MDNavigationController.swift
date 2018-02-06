//
//  MDNavigationController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit


protocol MDNavigationControllerDelegate: class {
    func menuPressed(MdnavigationController: MDNavigationController);
}

class MDNavigationController: UINavigationController, UINavigationControllerDelegate,UIGestureRecognizerDelegate {
 
    
     var menuView: MenuBarTableView!;
      private var isShow = false;
     private var tapGesture: UITapGestureRecognizer!;
    weak var helper: MDNavigationControllerDelegate?;
    override var viewControllers: [UIViewController]{
        didSet {
            createMenuButton(viewControllers: viewControllers[0]);
            
        }
    }
    
    
  
    init() {
       super.init(navigationBarClass: MDNavigationBar.self, toolbarClass: nil)
        
        menuView = MenuBarTableView(frame: self.view.frame);
     
        self.view.addSubview(menuView);
        menuView.isHidden = true;
        
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed));
        self.view.addGestureRecognizer(tapGesture);
        tapGesture.delegate = self;
        
    
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    func buttonPressed() {
        if (!isShow){
            showMenu();
        }
        else {
            closeMenu();
        }
        
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    
    func createMenuButton(viewControllers: UIViewController) {
        let menuIcon = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(buttonPressed));
        viewControllers.navigationItem.hidesBackButton = true;
        viewControllers.navigationItem.leftBarButtonItem = menuIcon;
        
    }
    
    private func showMenu() {
        
        
        
        self.menuView.isHidden = false;
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuView.tableView.frame = CGRect(x: -UIScreen.main.bounds.width + MENU_OFFSET, y: 0, width: UIScreen.main.bounds.width - MENU_OFFSET, height: UIScreen.main.bounds.height);
            self.menuView.tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - MENU_OFFSET, height: UIScreen.main.bounds.height);
            
            
        },completion: { finished in
            self.isShow = true;
        })
        
    }
    
    
    private func closeMenu() {
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuView.tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - MENU_OFFSET, height: UIScreen.main.bounds.height);
            self.menuView.tableView.frame = CGRect(x: -UIScreen.main.bounds.width + MENU_OFFSET, y: 0, width: UIScreen.main.bounds.width - MENU_OFFSET, height: UIScreen.main.bounds.height);
        }, completion: { finished in
            self.menuView.isHidden = true;
            self.isShow = false;
            
        })
    }
        internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    
            if (gestureRecognizer == self.tapGesture && isShow) {
                let location = gestureRecognizer.location(in: self.view);
                if (location.x >= menuView.frame.width - MENU_OFFSET) {
                    closeMenu();
                    return true;
                }
            }
    
    
            return false;
        }
    
    
   
    
    
    
}
