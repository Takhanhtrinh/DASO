//
//  MDTextfield.swift
//  DASO
//
//  Created by Trinh Ta on 12/21/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

extension UIView{
    func createUnderline() {
        let border = CALayer();
        let width = CGFloat(1.0);
        border.borderColor = UIColor(white: 0, alpha: 0.42).cgColor;
        border.borderWidth = width;
        border.frame = CGRect(x: 0, y: self.frame.height - width, width: frame.width, height: frame.height);
        self.layer.addSublayer(border);
        self.layer.masksToBounds = true;
    }
    
    func createTopLine() {
        let border = CALayer();
        let width = CGFloat(1);
        border.borderColor = UIColor(white: 0, alpha: 0.42).cgColor;
        border.borderWidth = width;
        border.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height);
        self.layer.addSublayer(border);
        self.layer.masksToBounds = true;
    }
    
    
}



class MDTextfield: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 18);
    
    init(frame: CGRect, placeHolder: String) {
        super.init(frame: frame);
//        borderStyle = .none;
//        self.placeholder = placeholder;
//        createLine();
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }
//    
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }
//    
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }
//    override func caretRect(for position: UITextPosition) -> CGRect {
//        return .zero;
//    }
    
    
}


