//
//  MDButton.swift
//  DASO
//
//  Created by Trinh Ta on 12/27/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame);
        titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14);
        setTitleColor(UIColor.white, for: .normal);
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16);
        layer.cornerRadius = 2;
        layer.masksToBounds = true;
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
