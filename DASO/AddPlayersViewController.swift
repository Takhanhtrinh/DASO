//
//  PlayersViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/29/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class AddPlayersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var backButton: UIButton!;
    var scrollView: UIScrollView!;
    var container: UIView!;
    var addPhotoBt: UIButton!;
    var profileImageView: UIImageView!;
    var firstNameLb: MDtextFieldWithLabel!;
    var lastNameLb: MDtextFieldWithLabel!;
    var emailLb: MDtextFieldWithLabel!;
    var cityLb: MDtextFieldWithLabel!;
    var teamLb: MDtextFieldWithLabel!;
    var ageLb: MDButtonWithLabel!;
    var genderBt: MDButtonWithLabel!;
    var heightBt: MDButtonWithLabel!;
    var positionBt: MDButtonWithLabel!;
    
    var addButton: UIButton!;
    
    let MINIMUM_AGE = Int(5);
    let MAXIMUM_AGE = Int(50);
    
    let MINIMUM_HEIGHT = 4;
    let MAXIMUM_HEIGHT = 8;
    
    var heightInFeet:Int!;
    var heightInInch:Int!;
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightInFeet = MINIMUM_HEIGHT;
        heightInInch = 0;
        
        
        createView();
        autolayout();

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    func createView() {
        
        scrollView = UIScrollView(frame:.zero);
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
         view.addSubview(scrollView);
        
        
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: NAVIGATION_SIZE));
        backButton.setTitle("Back", for: .normal);
        backButton.translatesAutoresizingMaskIntoConstraints = false;
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside);
        backButton.backgroundColor = NAVIGATION_DRAWER_COLOR;
        backButton.contentHorizontalAlignment = .left;
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: INDENT, bottom: 0, right: 0);
        view.addSubview(backButton);
        
        profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: PROFILE_IMAGE_SIZE.width, height: PROFILE_IMAGE_SIZE.height));
        profileImageView.image = #imageLiteral(resourceName: "profile");
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2;
        profileImageView.layer.masksToBounds = true;
        profileImageView.contentMode = .scaleAspectFit;
        profileImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        addPhotoBt = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 36));
        addPhotoBt.setTitle("Change Profile Image", for: .normal);
        addPhotoBt.setTitleColor(NAVIGATION_DRAWER_COLOR, for: .normal);
        addPhotoBt.addTarget(self, action: #selector(changeProfileImagePressed), for: .touchUpInside);
        addPhotoBt.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14);
        addPhotoBt.translatesAutoresizingMaskIntoConstraints = false;
        
        firstNameLb = MDtextFieldWithLabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: TEXTFIELD_WITH_LABEL_HEIGHT));
        firstNameLb.labelText = "First Name"
        firstNameLb.translatesAutoresizingMaskIntoConstraints = false;
        
        lastNameLb = MDtextFieldWithLabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: TEXTFIELD_WITH_LABEL_HEIGHT));
        lastNameLb.labelText = "Last Name"
        lastNameLb.translatesAutoresizingMaskIntoConstraints = false;
        
        emailLb = MDtextFieldWithLabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: TEXTFIELD_WITH_LABEL_HEIGHT));
        emailLb.labelText = "Email"
        emailLb.translatesAutoresizingMaskIntoConstraints = false;
        
        cityLb = MDtextFieldWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFIELD_WITH_LABEL_HEIGHT));
        cityLb.labelText = "City"
        cityLb.translatesAutoresizingMaskIntoConstraints = false;
        
        
        teamLb = MDtextFieldWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFIELD_WITH_LABEL_HEIGHT));
        teamLb.labelText = "Team"
        teamLb.translatesAutoresizingMaskIntoConstraints = false;
        
        ageLb = MDButtonWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFILELD_WITH_PICKER_VIEW));
        ageLb.label.text = "Age";
        ageLb.label.font = UIFont(name: "Roboto-Medium", size: 12);
        ageLb.label.textColor = UIColor(white: 0, alpha: 0.54);
        ageLb.translatesAutoresizingMaskIntoConstraints = false;
        
        genderBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFILELD_WITH_PICKER_VIEW));
        genderBt.label.text = "Gender";
        genderBt.label.font = UIFont(name: "Roboto-Medium", size: 12);
        genderBt.label.textColor = UIColor(white: 0, alpha: 0.54);
        genderBt.translatesAutoresizingMaskIntoConstraints = false;
        
        heightBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFILELD_WITH_PICKER_VIEW));
        heightBt.label.text = "Height";
        heightBt.label.font = UIFont(name: "Roboto-Medium", size: 12);
        heightBt.label.textColor = UIColor(white: 0, alpha: 0.54);
        heightBt.translatesAutoresizingMaskIntoConstraints = false;
        
        positionBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 0, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: TEXTFILELD_WITH_PICKER_VIEW));
        positionBt.label.text = "Position";
        positionBt.label.font = UIFont(name: "Roboto-Medium", size: 12);
        positionBt.label.textColor = UIColor(white: 0, alpha: 0.54);
        positionBt.translatesAutoresizingMaskIntoConstraints = false;
        
        
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 36));
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside);
        addButton.setTitle("Add", for: .normal);
        addButton.setTitleColor(UIColor.white, for: .normal);
        addButton.setTitleColor(UIColor.black, for: .highlighted);
        addButton.layer.cornerRadius = 4;
        addButton.backgroundColor = NAVIGATION_DRAWER_COLOR;
        addButton.translatesAutoresizingMaskIntoConstraints = false;
        
        
        

       
    }
    
    func autolayout() {
        //autolayout backbutton
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: STATUS_BAR),
            backButton.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            backButton.heightAnchor.constraint(equalToConstant: NAVIGATION_SIZE)
            ]);
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: backButton.topAnchor, constant: NAVIGATION_SIZE),
            scrollView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
            
            ])
         container = UIView(frame: view.frame);
        
        container.addSubview(profileImageView);
        container.addSubview(addPhotoBt);
        container.addSubview(firstNameLb);
        container.addSubview(lastNameLb);
        container.addSubview(emailLb);
        container.addSubview(cityLb);
        container.addSubview(teamLb);
        container.addSubview(ageLb);
        container.addSubview(genderBt);
        container.addSubview(heightBt);
        container.addSubview(positionBt);
        container.addSubview(addButton);
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: INDENT),
            profileImageView.widthAnchor.constraint(equalToConstant: PROFILE_IMAGE_SIZE.width),
            profileImageView.heightAnchor.constraint(equalToConstant: PROFILE_IMAGE_SIZE.height),
            
            addPhotoBt.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            addPhotoBt.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            
            firstNameLb.topAnchor.constraint(equalTo: addPhotoBt.bottomAnchor, constant: INDENT),
            firstNameLb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            firstNameLb.widthAnchor.constraint(equalToConstant: container.frame.width - INDENT * 2),
            firstNameLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            firstNameLb.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -INDENT),
            
            lastNameLb.topAnchor.constraint(equalTo: firstNameLb.bottomAnchor, constant: INDENT),
            lastNameLb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            lastNameLb.widthAnchor.constraint(equalToConstant: container.frame.width - INDENT * 2),
            lastNameLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            emailLb.topAnchor.constraint(equalTo: lastNameLb.bottomAnchor, constant: INDENT),
            emailLb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            emailLb.widthAnchor.constraint(equalToConstant: container.frame.width - INDENT * 2),
            emailLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            cityLb.topAnchor.constraint(equalTo: emailLb.bottomAnchor, constant: INDENT),
            cityLb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            cityLb.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            cityLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            teamLb.topAnchor.constraint(equalTo: emailLb.bottomAnchor, constant: INDENT),
            teamLb.leadingAnchor.constraint(equalTo: cityLb.trailingAnchor, constant: 8),
            teamLb.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            teamLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            ageLb.topAnchor.constraint(equalTo: teamLb.bottomAnchor, constant: INDENT),
            ageLb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            ageLb.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            ageLb.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            genderBt.topAnchor.constraint(equalTo: teamLb.bottomAnchor, constant: INDENT),
            genderBt.leadingAnchor.constraint(equalTo: ageLb.trailingAnchor, constant: 8),
            genderBt.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            genderBt.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            heightBt.topAnchor.constraint(equalTo: genderBt.bottomAnchor, constant: INDENT),
            heightBt.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: INDENT),
            heightBt.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            heightBt.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            positionBt.topAnchor.constraint(equalTo: genderBt.bottomAnchor, constant: INDENT),
            positionBt.leadingAnchor.constraint(equalTo: heightBt.trailingAnchor, constant: 8),
            positionBt.widthAnchor.constraint(equalToConstant: (container.frame.width - INDENT * 2) / 2 - 8),
            positionBt.heightAnchor.constraint(equalToConstant: TEXTFIELD_WITH_LABEL_HEIGHT),
            
            addButton.topAnchor.constraint(equalTo: positionBt.bottomAnchor, constant: INDENT),
            addButton.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 0.0),
            addButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2),
            addButton.heightAnchor.constraint(equalToConstant: 36)
            
            
            
            ])
        ageLb.createDropDownIcon();
        ageLb.addPicker();
        ageLb.pickerView?.delegate = self;
        ageLb.pickerView?.dataSource = self;
        ageLb.textField.text = "5";
        
        genderBt.createDropDownIcon();
        genderBt.addPicker();
        genderBt.pickerView?.delegate = self;
        genderBt.pickerView?.dataSource = self;
        genderBt.textField.text = "Male";
      
        
        positionBt.createDropDownIcon();
        positionBt.addPicker();
        positionBt.pickerView?.delegate = self;
        positionBt.pickerView?.dataSource = self;
        positionBt.textField.text = SOCCER_POSITIONS[0];
        
        heightBt.createDropDownIcon();
        heightBt.addPicker();
        heightBt.pickerView?.delegate = self;
        heightBt.pickerView?.dataSource = self;
        heightBt.textField.text = "4'0";
        scrollView.addSubview(container);
        
       
        view.addSubview(scrollView);
        view.bringSubview(toFront: backButton);
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
         scrollView.contentSize = CGSize(width: self.view.frame.width, height: addButton.frame.maxY + INDENT);
    }
    
    func addButtonPressed() {
        resetAllWarnning();
        //check empty textfield
        var flag = true;
        
        if (firstNameLb.textField.text == "") {
            firstNameLb.warmningText = "*Please Enter Frist Name";
            flag = false;
        }
         if (lastNameLb.textField.text == "") {
            lastNameLb.warmningText = "*Please Enter Last Name";
            flag = false;
        }
         if (emailLb.textField.text == "") {
            emailLb.warmningText = "*Please Enter Email";
            flag = false;
        }
        
         if (cityLb.textField.text == "") {
            cityLb.warmningText = "*Please Enter City";
            flag = false;
        }
         if (teamLb.textField.text == "") {
            teamLb.warmningText = "*Please Enter Team Name";
            flag = false;
        }
        
        if (flag) {
            //check email
            if (!isMatch(forRegex: EMAIL_REGREX, text: emailLb.textField.text!)) {
                emailLb.warmningText  = "Please Enter Valid Email";
                return;
            }
            
            
            
        }
        
        
        
    }
    
    
    func resetAllWarnning() {
        let views = container.subviews;

        for view in views {
            if let warnningLabelView = view as? MDtextFieldWithLabel {
                warnningLabelView.warmningText = "";
            }
            
            
        }
        
        
        
    }
    
    func changeProfileImagePressed() {
        
    }
    
    func backButtonPressed() {
        dismiss(animated: true, completion: nil);
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == ageLb.pickerView) {
            return 1;
        }
        else if (pickerView == genderBt.pickerView) {
            return 1;
        }
        else if (pickerView == heightBt.pickerView) {
            return 2;
        }
        
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == ageLb.pickerView) {
            return MAXIMUM_AGE - MINIMUM_AGE;
        }
        else if (pickerView == genderBt.pickerView) {
            return 2;
        }
        else if (pickerView == heightBt.pickerView) {
            if (component == 0) {
                return MAXIMUM_HEIGHT - MINIMUM_HEIGHT;
            }
            return 12
        }
        return SOCCER_POSITIONS.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == ageLb.pickerView) {
            return String(row + MINIMUM_AGE);
        }
        else if (pickerView == genderBt.pickerView) {
            if (row == 0) {
                return "Male"
            }
            return "Female";
        }
        else if (pickerView == heightBt.pickerView) {
            //feet
            if (component == 0) {
                return String(row + MINIMUM_HEIGHT) + "'";
            }
            return String(row);
            //inch
            
        }
        
        return SOCCER_POSITIONS[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == ageLb.pickerView) {
            ageLb.textField.text = String(row + MINIMUM_AGE);
        }
        else if (pickerView == genderBt.pickerView) {
            if (row == 0) {
                genderBt.textField.text =  "Male"
            }
            genderBt.textField.text =  "Female";
        }
        else if (pickerView == heightBt.pickerView) {
            if (component == 0) {
                heightInFeet = row + MAXIMUM_HEIGHT - MINIMUM_HEIGHT;
                heightBt.textField.text = String(row + MAXIMUM_HEIGHT - MINIMUM_HEIGHT) + "'" + String(heightInInch);
                
            }
            else {
                heightInInch = row;
                heightBt.textField.text?.removeAll();
                heightBt.textField.text = String(heightInFeet) + "'";
                heightBt.textField.text?.append(String(row));
                
            }
            
        }
        else if (pickerView == positionBt.pickerView) {
            positionBt.textField.text = SOCCER_POSITIONS[row];
        }
    }
    

    
}
