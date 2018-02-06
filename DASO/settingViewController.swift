//
//  settingViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting";
        let logo = #imageLiteral(resourceName: "DASO-BUTTON");
        let button = UIBarButtonItem(image: logo, landscapeImagePhone: UIImage(), style: .plain, target: self, action: #selector(logoPressed));
        navigationItem.rightBarButtonItem = button;
        
       
    }
    func logoPressed() {
        let webview = WebViewViewController();
        navigationController?.pushViewController(webview, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    

}
