//
//  ViewController.swift
//  DASO
//
//  Created by Trinh Ta on 10/26/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {
    let USERNAME = "Admin";
    let PASSWORD = "DASO";

    let FORGOT_PASSWORD_FONT_SIZE = CGFloat(12.0);
    
    var logoImage:UIImageView!;
    var logoName: UILabel!;
    var signUpBt:UIButton!;
    var forgotBt:UIButton!;
    var loginBtn:UIButton!;
    var userNameTF:customTextField!;
    var passWordTF:customTextField!;
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        setupView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
        logoName = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50));
        logoName.text = "Soccer Smart Wall";
        logoName.font = UIFont(name: "Roboto-Bold", size: 30);
        logoName.textColor = UIColor.black;
        logoName.translatesAutoresizingMaskIntoConstraints = false;
        logoName.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        logoName.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        logoName.textAlignment = .center;
        
        //logo image
        logoImage = UIImageView();
        let image = #imageLiteral(resourceName: "Logo")
        logoImage.image = image;
        logoImage.contentMode = .scaleAspectFit;
        //auto layout
//        logoImage.frame = CGRect(x: 0, y: 0, width: 50, height: 200);
        logoImage.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - INDENT * 2).isActive = true;
        logoImage.heightAnchor.constraint(equalToConstant: 160).isActive = true;
        
        
        loginBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50));
        loginBtn.translatesAutoresizingMaskIntoConstraints = false;
        loginBtn.setTitle("Login", for: .normal);
        loginBtn.backgroundColor = DASO_RED_COLOR;
        loginBtn.layer.cornerRadius = 5;
        loginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside);
        //autolayout
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        loginBtn.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        
        userNameTF = customTextField(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: TEXT_FIELD_HEIGHT), title: "Enter Username", keyboardType: .default, underLine: true);
        userNameTF.delegate = self;
        //auto layout usernamTF
        userNameTF.translatesAutoresizingMaskIntoConstraints = false;
        //padding 16 both size
        userNameTF.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        userNameTF.heightAnchor.constraint(equalToConstant: TEXT_FIELD_HEIGHT).isActive = true;

        passWordTF = customTextField(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: TEXT_FIELD_HEIGHT), title: "Enter Password", keyboardType: .default, underLine: true);
        passWordTF.isSecureTextEntry = true;
        passWordTF.delegate = self;
        //auto layout usernamTF
        passWordTF.translatesAutoresizingMaskIntoConstraints = false;

        //padding 16 both size
        passWordTF.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        passWordTF.heightAnchor.constraint(equalToConstant: TEXT_FIELD_HEIGHT).isActive = true;
        
        //sign up button
        signUpBt = UIButton();
        signUpBt.setTitle("Register", for: .normal);
        signUpBt.addTarget(self, action: #selector(signUpBtPressed), for: .touchUpInside);
        signUpBt.backgroundColor = UIColor.white;
        signUpBt.layer.borderColor = UIColor.black.cgColor;
        signUpBt.layer.borderWidth = 1.0;
        signUpBt.setTitleColor(UIColor.black, for: .normal);
        signUpBt.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        signUpBt.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2 - 16 - CGFloat(SPACING) / 2).isActive = true;
        
        //forfot button
        forgotBt = UIButton();
        forgotBt.setTitle("Forgot Password?", for: .normal);
//        forgotBt.titleLabel?.font = UIFont.systemFont(ofSize: FORGOT_PASSWORD_FONT_SIZE);
        forgotBt.titleLabel?.font = UIFont(name: "Roboto-Regular.ttf", size: FORGOT_PASSWORD_FONT_SIZE);
        forgotBt.addTarget(self, action: #selector(forgotPasswordPressed), for: .touchUpInside);
        forgotBt.backgroundColor = UIColor.white;
        forgotBt.setTitleColor(UIColor.gray, for: .normal);
        forgotBt.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        forgotBt.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2 - 16 - CGFloat(SPACING) / 2).isActive = true;
        //horizontal stack for signup button and forgot button
        let horizontalStackView = UIStackView(arrangedSubviews: [signUpBt,forgotBt ]);
        horizontalStackView.axis = .horizontal;
        horizontalStackView.distribution = .equalSpacing;
        horizontalStackView.spacing = CGFloat(SPACING);
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(horizontalStackView);

        //stackView
        let stackView = UIStackView(arrangedSubviews: [logoImage,logoName, userNameTF,passWordTF,loginBtn,horizontalStackView]);
        stackView.axis = .vertical;
        stackView.distribution = .equalSpacing;
        stackView.alignment = .center;
        stackView.spacing = 16.0;
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(stackView);
        //autolayout
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true;
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive = true;
    }
    
    func forgotPasswordPressed() {
        print("forgot password pressed");
    }
    
    func signUpBtPressed() {
        let signupView = registerViewController();
        present(signupView, animated: true, completion: nil);
        
    }
    
    func loginBtnPressed() {
        
        var allowLogin = false;
        
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest();
        do {
            let fetchUsers = try getContext().fetch(fetchRequest) as! [Users];
            for user in fetchUsers {
                if (user.email == userNameTF.text && user.password == passWordTF.text) {
                    allowLogin = true;
                    break;
                }
            }
            
            
        }
        catch {
            fatalError("cant fetch users ")
        }
        
        
//        if (userNameTF.text == USERNAME && passWordTF.text == PASSWORD) {
        
        if (allowLogin == true) {
        let tabBar = MDTabBar();
            let index = IndexPath(row: 0, section: 0);
            tabBar.menuView.tableView.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.none);
       
        
    
        
        let nvc2 = UINavigationController();
        let perfomaceViewController = PerfomaceViewController();
        nvc2.viewControllers = [perfomaceViewController];
    
        
        let nvc1 = UINavigationController();
        let playerView = PlayViewController();
        nvc1.viewControllers = [playerView];
      
        
        let nvc3 = UINavigationController();
        let goals = GoalsViewController();
        nvc3.viewControllers = [goals];
        
        
        let nvc4 = UINavigationController();
        let leaderboard = LeaderBoardViewController();
        nvc4.viewControllers = [leaderboard];
  
        
        let nvc5 = UINavigationController();
        let setting = settingViewController();
        nvc5.viewControllers = [setting]
    
     
        
            tabBar.menuView.myProfileView.nameLb.text = name[0];
        tabBar.viewControllers = [nvc1,nvc2,nvc3,nvc4,nvc5];
        present(tabBar, animated: true, completion: nil);
        }
        
            
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}

