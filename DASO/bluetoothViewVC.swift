//
//  bluetoothViewVC.swift
//  DASO
//
//  Created by Trinh Ta on 12/14/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreBluetooth

class bluetoothViewVC: UIViewController, CBCentralManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    var myCentralManager: CBCentralManager!;
    var peripheral: CBPeripheral!;

    var array = [UUID: CBPeripheral]();
    
    var tableView: UITableView!;
    let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myCentralManager = CBCentralManager(delegate: self, queue: nil);
        
        tableView = UITableView(frame: view.frame);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
        view.addSubview(tableView);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("bluetooth is on");
       
             myCentralManager.scanForPeripherals(withServices: nil, options: nil);
        case .poweredOff:
            print("bluetotth is power off");
          
        case .unsupported:
            print("not supported");
      
        case .unknown:
                  print("bluetooth is unknow");
           
        case .resetting:
                  print("bluetooth is unknow");
        case .unauthorized:
                  print("bluetooth is unknow");
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
       
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if(array[peripheral.identifier] == nil) {
            array[peripheral.identifier] = peripheral;
            tableView.reloadData();
        }
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! UITableViewCell;
        let keys = Array(array.keys);
        
        
        cell.textLabel?.text = array[keys[indexPath.row]]!.name;
        
        return cell;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = Array(array.keys);
        peripheral = array[keys[indexPath.row]];
       
        myCentralManager.connect(peripheral, options: nil);
        myCentralManager.stopScan();
        
        
        
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        let infoView = InfoBtViewController();
        infoView.Peripheral = peripheral;
        navigationController?.pushViewController(infoView, animated: true);
    }
    
    
    
  
}



