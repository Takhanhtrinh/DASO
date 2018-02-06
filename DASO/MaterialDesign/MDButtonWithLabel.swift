//
//  MDButton.swift
//  DASO
//
//  Created by Trinh Ta on 12/26/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDButtonWithLabel: UIView {
    var label: MDLabel!;
    var textField: MDTextfield!;
    var pickerView: UIPickerView?;
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
        autolayout();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        let frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: 14);
        label = MDLabel(frame: frame, title: "");
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont(name: "Roboto-Medium", size: 12);
        label.textColor = UIColor(white: 0, alpha: 0.54);
    
        addSubview(label);
        
//        button = UIButton(frame: .zero);
//        button.translatesAutoresizingMaskIntoConstraints = false;
//        button.backgroundColor = UIColor.clear;
//        button.layer.cornerRadius = 1;
//        button.layer.borderWidth = 2;
//        button.layer.borderColor = UIColor.blue.cgColor;
//
//        button.contentHorizontalAlignment = .left;
//        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0);
      
        textField = MDTextfield(frame: CGRect(x: self.frame.origin.x, y: label.frame.origin.y + label.frame.height + 8 , width: self.frame.width, height: 40));
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.backgroundColor = UIColor.clear;
//        textField.layer.cornerRadius = 1;
//        textField.layer.borderWidth = 2;
//        textField.layer.borderColor = UIColor.blue.cgColor;
//        textField.textAlignment = .left;
        textField.textColor = UIColor(white: 0, alpha: 0.87);
        textField.allowsEditingTextAttributes = false;
    
        
        
        
        
        addSubview(textField);
        
        
        
    }
    func autolayout(){
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true;
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true;
        label.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 14).isActive = true;
        

//        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
//        button.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
//        button.heightAnchor.constraint(equalToConstant: 40).isActive = true;
//        button.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true;
//        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8.0).isActive = true;
        textField.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true;
        textField.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true;
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0.0).isActive = true;
        

    
      
   
        
    }
    func createDropDownIcon() {
//        let myframe = CGRect(x: button.frame.width - INDENT, y: 0, width: 10, height: button.frame.height);
//        let dropDownLb = MDLabel(frame: myframe, title: "▼");
////        dropDownLb.translatesAutoresizingMaskIntoConstraints = false;
//        dropDownLb.textColor = UIColor.blue;
//        dropDownLb.font = UIFont(name: "Roboto-Medium", size: 12);
//        textField.addSubview(dropDownLb);
        
        let myframe = CGRect(x: textField.frame.width - INDENT, y: 0, width: 10, height: textField.frame.height);
        let dropDownLb = MDLabel(frame: myframe, title: "▼");
        //        dropDownLb.translatesAutoresizingMaskIntoConstraints = false;
        dropDownLb.textColor = NAVIGATION_DRAWER_COLOR;
        dropDownLb.font = UIFont(name: "Roboto-Medium", size: 12);
        textField.createUnderline();
        textField.addSubview(dropDownLb);
    
        
    }
    func addPicker() {
        createToolBar();
        createPickerView();
        hideCaret();
    }
    
    private func createToolBar() {
        let toolbar = UIToolbar();
        toolbar.barStyle = .default;
        toolbar.isTranslucent = true;
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed));
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil);
        toolbar.setItems([space, space, doneButton], animated: true);
        toolbar.isUserInteractionEnabled = true;
        toolbar.sizeToFit();
        
        textField.inputAccessoryView = toolbar;
        
        
        
        
        
    }
    
    private func createPickerView() {
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 217));
        pickerView?.showsSelectionIndicator = true;
        textField.inputView = pickerView;
    }
    
    func donePressed() {
        textField.resignFirstResponder();
    }
    
    func hideCaret() {
        textField.tintColor = .clear;
    }
    
  
    
    
}
