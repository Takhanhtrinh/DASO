//
//  InfoBtViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/16/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreBluetooth
class InfoBtViewController: UIViewController,CBPeripheralDelegate, UITableViewDelegate,UITableViewDataSource {
    var Peripheral: CBPeripheral?;
    
    var tableview: UITableView!;
    
    let cellID = "CellID";
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Peripheral != nil) {
            Peripheral!.delegate = self;
            Peripheral!.discoverServices(nil);
        }
        let backbutton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed));
        self.navigationItem.hidesBackButton = true;
        self.navigationItem.leftBarButtonItem = backbutton;
       
       
    }
    func backPressed () {
        let vc = navigationController?.viewControllers[0] as! bluetoothViewVC;
        if(Peripheral != nil) {
            vc.myCentralManager.cancelPeripheralConnection(Peripheral!);
        }
        vc.peripheral = nil;
       
        self.navigationController?.popViewController(animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if(Peripheral != nil){
//            print("number of sections" + String(Peripheral!.services!.count));
//            return Peripheral!.services!.count;
            return 1;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let services = Peripheral?.services else {
//            return 0;
//        }
//        guard let characteristics = services[section].characteristics else {
//            return 0;
//        }
//        return characteristics.count;
        if (Peripheral != nil ) {
            return (Peripheral?.services!.count)!;
        }
        else {
            return 0;
        }
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let services = Peripheral?.services else {
            return UITableViewCell();
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath);
        cell.textLabel?.text = services[indexPath.row].description;
        
        
        
//        print("characterstics ne: " + String (services[indexPath.row].characteristics!.count));
        
        return cell;
        
        
        
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services! {
            print(service);
        }
        tableview = UITableView(frame: view.frame, style: .grouped);
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
        tableview.delegate = self;
        tableview.dataSource = self;
        view.addSubview(tableview);
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (Peripheral != nil) {
            let service = Peripheral!.services![indexPath.row];
            let newVc = selectCharUUIDViewController();
            newVc.selectedService = service;
            newVc.peripheral = Peripheral;
            navigationController?.pushViewController(newVc, animated: true);

        }
        
        
    }

}
