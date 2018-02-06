//
//  customTextField.swift
//  DASO
//
//  Created by Trinh Ta on 10/26/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class customTextField: UITextField {
    init(frame: CGRect, title: String, keyboardType:UIKeyboardType, underLine:Bool) {
        super.init(frame: frame);
        self.placeholder = title;
        self.keyboardType = keyboardType;
        self.returnKeyType = .done;
        self.font = UIFont.systemFont(ofSize: 15);
        self.autocorrectionType = .no;
        self.font = UIFont(name: "Roboto-Regular.ttf", size: 15);
        self.contentVerticalAlignment = .center;
        self.clearButtonMode = .whileEditing;
        if (underLine) {
            underlined();
        }
    

        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor;
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
