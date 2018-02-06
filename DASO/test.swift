//
//  Player.swift
//  DASO
//
//  Created by Trinh Ta on 11/7/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//


import UIKit
//import CoreData
enum SoccerPosition: Int16 {
    case NONE,GK, RB, CB, LB, RWB, LWB, CDM, CM, CAM, RM, LM, RW, LW, CF, ST
}


func strToSoccerPosition(value: String)->SoccerPosition {
    var rt = SoccerPosition.NONE;
    switch value {
    case "GK":
        rt = SoccerPosition.GK;
        break;
    case "RB":
        rt = SoccerPosition.RB;
        break;
    case "CB":
        rt = SoccerPosition.CB;
        break;
    case "LB":
        rt = SoccerPosition.LB;
        break;
    case "RWB":
        rt = SoccerPosition.RWB;
        break;
    case "LWB":
        rt = SoccerPosition.LWB;
        break;
    case "CDM":
        rt = SoccerPosition.CDM;
        break;
    case "CM":
        rt = SoccerPosition.CM;
        break;
    case "CAM":
        rt = SoccerPosition.CAM;
        break;
    case "RM":
        rt = SoccerPosition.RM;
        break;
    case "LM":
        rt = SoccerPosition.LM;
        break;
    case "RW":
        rt = SoccerPosition.RW;
        break;
    case "LW":
        rt = SoccerPosition.LW;
        break;
    case "CF":
        rt = SoccerPosition.CF;
        break;
    case "ST":
        rt = SoccerPosition.ST;
        break;
    default:
        rt = SoccerPosition.NONE;
        assertionFailure("[Soccer Position ERROR] can't find the position");
        break;
    }
    return rt;
}

func soccerPositionToStr(value: SoccerPosition) ->String {
    var rt = "";
    switch value {
    case .CAM:
        rt = "CAM";
        break;
    case .CB:
        rt = "CB";
        break;
    case .CDM:
        rt = "CDM";
        break;
    case .CF:
        rt = "CF";
        break;
    case .CM:
        rt = "CM";
        break;
    case .GK:
        rt = "GK";
        break;
    case .LB:
        rt = "LB";
        break;
    case .LM:
        rt = "LM";
        break;
    case .LW:
        rt = "LW";
        break;
    case .LWB:
        rt = "LWB";
        break;
    case .RB:
        rt = "RB";
        break;
    case .RM:
        rt = "RM";
        break;
    case .RW:
        rt = "RW";
        break;
    case .RWB:
        rt = "RWB";
        break;
    case .ST:
        rt = "ST";
        break;
    default:
        rt = "None";
        break;
    }
    return rt;
    
}
//
//
//
//class Player: myCoreDataProtocol{
//    
//    typealias T = Player;
//    
//    private var firstName:String?;
//    private var lastName:String?;
//    private var email:String?;
//    private var position: SoccerPosition?;
//    
//    
//    static let databaseName = "PlayerData";
//    
//    
//    var image: UIImage?;
//   
//    init() {
//        firstName = "";
//        lastName = "";
//        email = "";
//        position = SoccerPosition.NONE;
//    }
//    
//    init(firstName: String,lastName:String,email:String, position: SoccerPosition) {
//        self.firstName = firstName;
//        self.lastName = lastName;
//        self.email = email;
//        self.position = position;
//    }
//    
//    func getFirstName()->String {
//        return firstName!;
//    }
//    
//    func getLastName()->String {
//        return lastName!;
//    }
//    
//    func getEmail()->String{
//        return email!;
//    }
//    
//    func getPosition()->SoccerPosition {
//        return self.position!;
//    }
//    
//    func setFirstName(value:String) {
//        self.firstName = value;
//    }
//    func setLastName(value: String) {
//        self.lastName = value;
//    }
//    func setEmail(value:String) {
//        self.email = value;
//    }
//    func setPosition(value:SoccerPosition) {
//        self.position = value;
//    }
//    
//    
//    
//    static func saveData(object: Player) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
//        let context = appDelegate.persistentContainer.viewContext;
//        let data = NSEntityDescription.insertNewObject(forEntityName: Player.databaseName, into: context);
//        
//        
//        
//        data.setValue(object.firstName, forKey: "firstName");
//        data.setValue(object.lastName, forKey: "lastName");
//        data.setValue(object.email, forKey: "email");
//        let pos = NSNumber(value: object.position!.rawValue);
//        data.setValue(pos.int16Value, forKey: "position");
//        
//        do {
//            try context.save();
//            print(Player.databaseName + " " + "saved");
//        } catch {
//            print(Player.databaseName + " " + "is error");
//        }
//        
//        
//    }
//    
//    static func loadData() -> [Player] {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
//        let context = appDelegate.persistentContainer.viewContext;
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: databaseName);
//        request.returnsObjectsAsFaults = false;
//       
//        
//        
//        do {
//            let results = try context.fetch(request);
//            let rt = results as! [NSManagedObject];
//            var array = [Player]();
//            
//            var isDone = true;
//            
//            for result in rt {
//                 let player = Player();
//                
//                if let firstName = result.value(forKey: "firstName") as? String{
//
//                    player.setFirstName(value: firstName);
//                }
//                else {
//                    isDone = false;
//                }
//                if let lastName = result.value(forKey: "lastName") as? String {
//     
//                    player.setLastName(value: lastName);
//                }
//                else{
//                    isDone = false;
//                }
//                if let email = result.value(forKey: "email") as? String {
//                    player.setEmail(value: email);
//                }
//                else {
//                    isDone = false;
//                }
//                if let pos = result.value(forKey: "position") as? Int16 {
//                    let position = SoccerPosition(rawValue: pos);
//                    
//                    player.setPosition(value: position!);
//                }
//                else {
//                    isDone = false;
//                }
//                
//                
//                assert(isDone == true);
//                
//                if (isDone){
//                    array.append(player);
//                }
//               
//                
//            }
//            
//            return array;
//            
//        }catch {
//            print("load data from" + " " + databaseName + " " + "error");
//            return [];
//        }
//      
//    }
//    
//    
//    static func deleteObject(object: Player) {
//        
//    }
//    
//    static func clear() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
//        let context = appDelegate.persistentContainer.viewContext;
//        
//        
//        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: Player.databaseName);
//        
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch);
//            
//            
//        do {
//            try context.execute(deleteRequest);
//            try context.save();
//        }
//         catch {
//            print("<CoreDataProtol> clear error for Player");
//        }
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//}
//
//
//
//extension Player: Equatable {
//    static func ==(lhs:Player, rhs:Player) ->Bool {
//        return (lhs.getFirstName() == rhs.getFirstName() && lhs.getLastName() == rhs.getLastName() && lhs.getEmail() == rhs.getEmail());
//    }
//}
//
//
//
//extension Player: Comparable {
//    static func <(lhs:Player, rhs:Player)->Bool {
//        return lhs.getFirstName() < rhs.getFirstName();
//    }
//    
//    static func >(lhs:Player, rhs:Player)->Bool {
//        return !(lhs < rhs);
//    }
//    
//}
