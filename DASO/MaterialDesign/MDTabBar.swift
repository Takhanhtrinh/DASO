//
//  MDTabBar.swift
//  DASO
//
//  Created by Trinh Ta on 12/21/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDTabBar: UITabBarController,menuBarDelegate, UIGestureRecognizerDelegate{
    var menuView: MenuBarTableView!;
    var isShow = false;
    private var tapGesture: UITapGestureRecognizer!;
    override var viewControllers: [UIViewController]? {
        didSet {
            let textAttribute = [NSForegroundColorAttributeName: UIColor.white];
            for view in viewControllers!{
                if let navigationController = view as? UINavigationController {
                    for subView in navigationController.viewControllers{
                        createMenuButton(viewControllers: subView);
                        subView.navigationController?.navigationBar.backgroundColor = NAVIGATION_DRAWER_COLOR;
                        subView.navigationController?.navigationBar.isTranslucent = true;
                        subView.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default);
                        subView.navigationController?.navigationBar.shadowImage = UIImage();
                        subView.navigationController?.navigationBar.titleTextAttributes = textAttribute;
                        subView.navigationController?.navigationBar.tintColor = UIColor.white;
                        break;
                        
                        
                        
                    }
                }
                
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height - HOME_INDICATOR);
        menuView = MenuBarTableView(frame: frame);
        menuView.myProfileView.add_playerBt.addTarget(self, action: #selector(addNewPlayerPressed), for: .touchUpInside);
        
        
        self.view.addSubview(menuView);
        menuView.isHidden = true;
        menuView.delegate = self;
        
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonPressed));
        self.view.addGestureRecognizer(tapGesture);
        tapGesture.delegate = self;
        let textAttribute = [NSForegroundColorAttributeName: UIColor.white];
        for views in moreNavigationController.viewControllers {
            views.navigationController?.navigationBar.backgroundColor = NAVIGATION_DRAWER_COLOR;
            views.navigationController?.navigationBar.isTranslucent = true;
            views.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default);
            views.navigationController?.navigationBar.shadowImage = UIImage();
            views.navigationController?.navigationBar.titleTextAttributes = textAttribute;
            views.navigationController?.navigationBar.tintColor = UIColor.white;
            break;
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBar.isHidden = true;
    }
    
    func addNewPlayerPressed() {
        let addNewPlayerController = AddPlayersViewController();
        closeMenu();
        present(addNewPlayerController, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func viewSelected(menuBar: MenuBarTableView, selectedView: Int) {
        if (isShow) {
            if (selectedView < viewControllers!.count) {
                self.selectedIndex = selectedView;
                closeMenu();
            }
        }
        
    }
    func createMenuButton(viewControllers: UIViewController) {
        let menuIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-icon"), style: .plain, target: self, action: #selector(buttonPressed))
    
        viewControllers.navigationItem.hidesBackButton = true;
        viewControllers.navigationItem.leftBarButtonItem = menuIcon;
 
        
    }
    
    func buttonPressed() {
        if (!isShow) {
            showMenu();
        }
        else {
            closeMenu();
        }
    }
    
    private func showMenu() {
        
        
        self.menuView.isHidden = false;
        
        //before
        self.menuView.myProfileView.frame = CGRect(x: -self.menuView.frame.width + MENU_OFFSET , y: 0, width: self.menuView.frame.width - MENU_OFFSET, height: PROFILE_HEIGHT);
        //after
        let myProfileFrameAfter = CGRect(x: 0, y: 0, width: self.menuView.frame.width - MENU_OFFSET, height: PROFILE_HEIGHT);
        
        //before
        self.menuView.tableView.frame = CGRect(x: -self.menuView.frame.width + MENU_OFFSET, y: PROFILE_HEIGHT, width: self.menuView.frame.width - MENU_OFFSET, height: self.menuView.frame.height - PROFILE_HEIGHT);
        //after
        let tableFrameAfter = CGRect(x: 0, y: PROFILE_HEIGHT, width: self.menuView.frame.width - MENU_OFFSET, height: self.menuView.frame.height - PROFILE_HEIGHT);
        
        
        UIView.animate(withDuration: 0.3, animations: {
            
            
            self.menuView.myProfileView.frame = myProfileFrameAfter;
            
            self.menuView.tableView.frame = tableFrameAfter;
            self.menuView.layoutIfNeeded();
            
        },completion: { finished in
            self.isShow = true;
        })
        
    }
    
    
    private func closeMenu() {
        
        
        UIView.animate(withDuration: 0.3, animations: {
            //before
            self.menuView.myProfileView.frame = CGRect(x: 0 , y: 0, width: self.menuView.frame.width - MENU_OFFSET, height: PROFILE_HEIGHT);
            //after
            let myProfileFrameAfter = CGRect(x: -self.menuView.frame.width + MENU_OFFSET, y: 0, width: self.menuView.frame.width - MENU_OFFSET, height: PROFILE_HEIGHT);
            
            //before
            self.menuView.tableView.frame = CGRect(x: 0, y: PROFILE_HEIGHT, width: self.menuView.frame.width - MENU_OFFSET, height: self.menuView.frame.height - PROFILE_HEIGHT);
            //after
            let tableviewFrameAFter = CGRect(x: -self.menuView.frame.width + MENU_OFFSET, y: PROFILE_HEIGHT, width: self.menuView.frame.width - MENU_OFFSET, height: self.menuView.frame.height - PROFILE_HEIGHT);
            
            self.menuView.myProfileView.frame = myProfileFrameAfter;
            
            self.menuView.tableView.frame = tableviewFrameAFter;
            self.menuView.layoutIfNeeded();
            
            
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
