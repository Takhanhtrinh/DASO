//
//  registerViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/29/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreData

class registerViewController: UIViewController, UITextFieldDelegate {
    private var backButton: UIButton!;
    private var nameView: UITextField! = UITextField();
    private var emailView: UITextField! = UITextField();
    private var password: UITextField! = UITextField();
    private var confirmPassword: UITextField! = UITextField();
    private var registerBt: UIButton!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createView
        createView();
        autoLayout();
     
        showData();
        
        
    }
    
    func showData() {
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest();
        do {
            let users = try getContext().fetch(fetchRequest) as! [Users];
            for user in users {
                print("user name : \(user.name)");
                print("email : \(user.email)");
                print("password \(user.password)");
            }
            
            
        }
        catch{
            print("error");
        }
        
        
        
        
    }
    
    fileprivate func createView() {
        backButton = UIButton(frame: .zero);
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside);
        backButton.setTitle("Back", for: .normal);
        backButton.contentHorizontalAlignment = .left;
        backButton.setTitleColor(UIColor.blue, for: .normal);
        backButton.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(backButton);
        
        
        createTextFields(textfield: nameView, placeHolder: "Enter Name" );
        createTextFields(textfield: emailView, placeHolder: "Enter Email");
        createTextFields(textfield: password, placeHolder: "Enter Password");
        createTextFields(textfield: confirmPassword, placeHolder: "Confirm Password");
        
        password.isSecureTextEntry = true;
        confirmPassword.isSecureTextEntry = true;
        
        nameView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50);
        emailView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50);
        password.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50);
        confirmPassword.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50);
        
        registerBt = UIButton();
        registerBt.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 50);
        registerBt.backgroundColor = BUTTON_COLOR;
        registerBt.setTitle("Register", for: .normal);
        registerBt.setTitleColor(UIColor.white, for: .normal);
        registerBt.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside);
        registerBt.translatesAutoresizingMaskIntoConstraints = false;
        registerBt.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        registerBt.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        
        
        
        
    }
    
    fileprivate func createTextFields(  textfield:  UITextField!, placeHolder: String?) {
        textfield?.placeholder = placeHolder;
        textfield!.translatesAutoresizingMaskIntoConstraints = false;
        textfield.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        textfield.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        textfield.keyboardType = .default;
        textfield.autocorrectionType = .no;
        textfield.delegate = self;
        
    }
    
    
    

    
    fileprivate func autoLayout() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: INDENT),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -INDENT)
            
            ])
        
        let stackView = UIStackView(arrangedSubviews: [nameView,emailView,password,confirmPassword,registerBt]);
         view.addSubview(stackView);
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0.0)
            ])
        stackView.axis = .vertical;
        stackView.spacing = INDENT;
        stackView.distribution = .equalSpacing;
        nameView.createUnderline();
        emailView.createUnderline();
        password.createUnderline();
        confirmPassword.createUnderline();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @objc fileprivate func backButtonPressed(){
        dismiss(animated: true, completion: nil);
    }
    
    @objc private func registerButtonPressed() {
        if (emailView.text != "" && nameView.text != "" && password.text != "" && confirmPassword.text != "" && password.text == confirmPassword.text) {
            
            let user = Users(context: getContext());
            user.name = nameView.text;
            user.email = emailView.text;
            user.password = password.text;
            let appdelegate = UIApplication.shared.delegate as! AppDelegate;
            appdelegate.saveContext();
            dismiss(animated: true, completion: nil);
            
            
            
            
        }
        
        
        
        
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
  

    
}
