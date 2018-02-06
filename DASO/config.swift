//
//  config.swift
//  DASO
//
//  Created by Trinh Ta on 11/2/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import Foundation
import UIKit
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


extension UIColor {
    convenience init(hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255;
        let green = CGFloat((hex & 0xFF00) >> 8) / 255;
        let blue = CGFloat((hex & 0xFF)) / 255;
        self.init(red: red, green: green, blue: blue, alpha: 1.0);
    }
}

//database 
let DATABASE_PLAYER = "PlayerData";
let BUTTON_HEIGHT = CGFloat(36);

let PLAYER_CELL_HEIGHT = CGFloat(50 + 16 + 8 + 20 + 20 + 15);

let NAVIGATION_SIZE = CGFloat(44);
let TABBAR_SIZE = CGFloat(49);
let INDENT = CGFloat(16);
let TEXT_FIELD_HEIGHT = CGFloat(31);

let FONT_SIZE = CGFloat(14);

//image size for addPlayerview
let IMAGE_SIZE = CGFloat(100);
//spacing vertical stackview
let SPACING = 8.0;

let NAVIGATION_DRAWER_COLOR = UIColor(hex: 0x2196F3);
let DASO_RED_COLOR = UIColor(hex: 0xe5000b);

let BUTTON_COLOR = UIColor(hex: 0x2196F3)

let MAXIMUM_HANDICAP_TIME = Double(5);
let MINIMUM_HANDICAP_TIME = Double(1);

let ADD_PLAYER_ICON_SIZE = CGSize(width: 48, height: 48);

let PROFILE_IMAGE_SIZE = CGSize(width: 75, height: 75);

let TEXTFIELD_WITH_LABEL_HEIGHT = CGFloat(69);

let TEXTFILELD_WITH_PICKER_VIEW = CGFloat(68);

let PROFILE_HEIGHT: CGFloat = {
    if UIDevice().userInterfaceIdiom == .phone {
        if (UIScreen.main.nativeBounds.height == 2436) {
            //detect iphone x safe area
            return 200;
        }
    }
    
    
    return 180;
}();


let isIphoneX: Bool = {
    if UIDevice().userInterfaceIdiom == .phone {
        if (UIScreen.main.nativeBounds.height == 2436) {
            //detect iphone x safe area
            return true;
        }
        
    }
    return false;
}()


let HOME_INDICATOR: CGFloat = {
   
    return (isIphoneX == true) ? 34 : 0;
}()


let STEPPER_SIZE = CGSize(width: 94, height: 29);
let STEPPER_RADIUS = CGFloat(4);


enum AddPlayerViewStatus {
    case editPlayerView, newPlayerView
}


let SWITCH_SIZE = CGSize(width: 51, height: 31);

let SOCCER_POSITIONS = ["GK", "RB", "CB", "LB", "RWB", "LWB", "CDM", "CM", "CAM", "RM", "LM", "RW", "LW", "CF", "ST"];

func getScreenWidth()->CGFloat {
    let size = UIScreen.main.bounds;
    return size.size.width;
}

let DROP_DOWN_ICON = " ▼";







let MENU_OFFSET = CGFloat(56);

let STATUS_BAR: CGFloat = {
    if (isIphoneX) {
        return 44;
    }
    return 20;
}()




//Email REGREX
let EMAIL_REGREX = "^[A-Za-z0-9.!#$%&'*+-/=?^_`{|}~]+@[A-Za-z0-9]+\\.[A-Za-z0-9]+\\.?[A-Za-z0-9]+?";
//name REGREX
let NAME_REGREX = "^([A-Za-z]+)";

// print array of string if regrex is match
func matches(forRegex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: forRegex, options: .anchorsMatchLines);
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        
        
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}


func firstMatch(forRegex: String, text:String) ->String {
    do {
        let regrex = try NSRegularExpression(pattern: forRegex, options: .anchorsMatchLines);
        let nsString = text as NSString;
        let result = regrex.rangeOfFirstMatch(in: text, options: [], range: NSRange(location: 0, length: nsString.length));
        if (!NSEqualRanges(result, NSMakeRange(NSNotFound, 0))) {
            let rt = nsString.substring(with: result);
            return rt;
        }
        
        
        
        
    } catch let error {
        print(error.localizedDescription);
        
    }
    
    
    return "";
    
}


func isMatch(forRegex: String,text: String)->Bool {
    return firstMatch(forRegex: forRegex, text: text) != "";
}










func ERROR_MESSAGE(_className: String, _content: String)->String {
    let rt = "ERROR__________[\(_className)] \(_content)";
    return rt;
    
}



