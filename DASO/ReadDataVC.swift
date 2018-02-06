//
//  ReadDataVC.swift
//  DASO
//
//  Created by Trinh Ta on 12/16/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreBluetooth
class ReadDataVC: UIViewController,CBPeripheralDelegate, UITableViewDelegate, UITableViewDataSource {
    var peripheral: CBPeripheral!;
    var selectedCharacterstic: CBCharacteristic!;
    var numberOfByte:UILabel!;
    var bytes:[UInt8]?;
//    [Impact Number,Score,Target x, Target y,Impact x, Impact y, Accuracy (in), Interval (ms), Speed (mph), Scoring mode"]
    
    var tableView:UITableView!;
    let cellID = "cellID";
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (peripheral != nil && selectedCharacterstic != nil) {
            peripheral.readValue(for: selectedCharacterstic);
            peripheral.setNotifyValue(true, for: selectedCharacterstic);
        }
        
        tableView = UITableView(frame: self.view.frame);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
        tableView.delegate = self;
        tableView.dataSource = self;
        view.addSubview(tableView);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        let value = characteristic.value;
        if (value != nil) {
            bytes = [UInt8](value!);
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if (error != nil) {
            print(error!);
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) {
            if(indexPath.row == 0) {
                if (bytes != nil) {
                    cell.textLabel?.text = "Number Of Bytes: \(bytes!.count)";
                }
                else {
                    cell.textLabel?.text = "Number Of Bytes: 0 ";
                }
            }
            else if (indexPath.row == 1) {
                if (bytes != nil) {
                    
                }
                else {
                    
                }
            }
            return cell;
        }
        return UITableViewCell();
    
    }
}
