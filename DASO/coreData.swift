//
//  coreData.swift
//  DASO
//
//  Created by Trinh Ta on 12/29/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreData



func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    return appDelegate.persistentContainer.viewContext;
}
