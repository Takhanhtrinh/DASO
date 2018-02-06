//
//  MDLabel.swift
//  DASO
//
//  Created by Trinh Ta on 12/21/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class MDLabel: UILabel {
    init(frame: CGRect, title: String ) {
        super.init(frame: frame);
        self.text = title;
        self.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
