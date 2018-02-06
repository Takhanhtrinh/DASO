//
//  Goals.swift
//  DASO
//
//  Created by Trinh Ta on 1/4/18.
//  Copyright © 2018 Trinh Ta. All rights reserved.
//

import Foundation
struct Goals {
    var goalName:String!;
    var isComplete:Bool!;
    
    static func createSample() -> [Goals] {
        
//        let goal = "Play for 3 Hours";
//        let goal1 = "8,000 touches";
//        let goal2 = "Beat a 5 Star Player on Total";
//        let goal3 = "Accuracy over 40 MPH > 75%";
//        let goal4 = "Accuracy less than 2 s. trap time > 60%";
//
        let array = [Goals(goalName: "Play for 3 Hours", isComplete: true), Goals(goalName: "8,000 touches", isComplete:true ), Goals(goalName: "Beat a 5 Star Player on Total", isComplete: false), Goals(goalName: "Accuracy over 40 MPH > 75%", isComplete: false), Goals(goalName: "Accuracy less than 2 s. trap time > 60%", isComplete: false)];
        
        
        
        return array;
        
        
    }
    
    
}
