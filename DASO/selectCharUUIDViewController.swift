//
//  selectCharUUIDViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/16/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit
import CoreBluetooth
class selectCharUUIDViewController: UIViewController,CBPeripheralDelegate, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!;
    var peripheral : CBPeripheral!;
    var selectedService: CBService!;
    let cellID = "CellID";
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheral.delegate = self;
        peripheral.discoverCharacteristics(nil, for: selectedService);
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        for characterestic in service.characteristics! {
            print(characterestic);
        }
        tableView = UITableView(frame: view.frame);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID);
        tableView.delegate = self;
        tableView.dataSource = self;
        view.addSubview(tableView);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (peripheral != nil) {
            return 1;
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (peripheral != nil && selectedService != nil) {
            print("number of row \(selectedService.characteristics!.count)");
            return selectedService.characteristics!.count;

        }
        
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (peripheral == nil && selectedService == nil) {
            return UITableViewCell();
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath);
        let characterestic = selectedService.characteristics![indexPath.row];
        cell.textLabel?.text = characterestic.description;
    
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let characterestic = selectedService.characteristics![indexPath.row];
        let readVC = ReadDataVC();
        readVC.peripheral = peripheral;
        readVC.selectedCharacterstic = characterestic;
        navigationController?.pushViewController(readVC, animated: true);
        
        
    }


}
