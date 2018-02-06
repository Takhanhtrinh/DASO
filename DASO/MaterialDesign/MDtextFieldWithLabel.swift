//
//  MDtextFieldWithLabel.swift
//  DASO
//
//  Created by Trinh Ta on 12/29/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDtextFieldWithLabel: UIView {
    var labelText: String? {
        didSet {
            label.text = labelText;
        }
        
    }
    var warmningText: String? {
        didSet {
            warmningLabel.text = warmningText;
        }
    }
    
    var placeHolder: String? {
        didSet {
            textField.placeholder = placeHolder;
        }
    }
    
    var label: UILabel!;
    var warmningLabel:UILabel!;
    var textField: UITextField!;
    private var seperator: UIView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        createView();
    }
    func createView() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 14));
        label.font = UIFont(name: "Roboto-Regular", size: 12);
        label.textColor = UIColor(white: 0, alpha: 0.54);
//        label.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(label);
        
        textField = UITextField(frame: CGRect(x: 0, y: label.frame.maxY, width: self.frame.width, height: 24 + 9));
        textField.font = UIFont(name: "Roboto-Medium", size: 14);
        textField.textColor = UIColor.black;
        //create underline for textField;
        textField.createUnderline();
        textField.autocorrectionType = .no;
        addSubview(textField);
        
        warmningLabel = UILabel(frame: CGRect(x: 0, y: textField.frame.maxY + 8, width: self.frame.width, height: 14));
        warmningLabel.font = UIFont(name: "Roboto-Regular", size: 10);
        warmningLabel.textColor = UIColor.red;
        
//        warmningLabel.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(warmningLabel);
        
        
        
    }
    

}
