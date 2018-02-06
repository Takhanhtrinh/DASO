//
//  GoalsViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    let cellid = "cellid";
    var profileView: UIImageView!;
    var nameButton: MDButtonWithLabel!;
    var tableView: UITableView!;
    var goals = Goals.createSample();
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Goals";
        
        let logo = #imageLiteral(resourceName: "DASO-BUTTON");
        let button = UIBarButtonItem(image: logo, landscapeImagePhone: UIImage(), style: .plain, target: self, action: #selector(logoPressed));
        navigationItem.rightBarButtonItem = button;
        
        createView();
        autolayout();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createView() {
        profileView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75));
        profileView.image = #imageLiteral(resourceName: "profile");
        profileView.translatesAutoresizingMaskIntoConstraints = false;
        profileView.layer.cornerRadius = profileView.frame.width / 2;
        profileView.layer.masksToBounds = true;
        profileView.contentMode = .scaleAspectFit;
        view.addSubview(profileView);
        
        nameButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 68));
        nameButton.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(nameButton);
        
        tableView = UITableView(frame: .zero);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(tableView);
        tableView.allowsSelection = false;
        tableView.separatorStyle = .none;
        
        tableView.register(goalCell.self, forCellReuseIdentifier: cellid);
    }
    
    
    func autolayout() {
        profileView.widthAnchor.constraint(equalToConstant: 75).isActive = true;
        profileView.heightAnchor.constraint(equalToConstant: 75).isActive = true;
        profileView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        profileView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: NAVIGATION_SIZE + INDENT + STATUS_BAR).isActive = true;
        
        nameButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        nameButton.heightAnchor.constraint(equalToConstant: 63).isActive = true;
        nameButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor, constant: 0.0).isActive = true;
        nameButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 0.0).isActive = true;
        nameButton.addPicker();
        nameButton.pickerView?.delegate = self;
        nameButton.textField.text = name[0] + " ▼";
        nameButton.textField.textAlignment = .center;
        nameButton.textField.textColor = UIColor.blue;
        
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1));
        seperator.backgroundColor = UIColor(white: 0, alpha: 0.5);
        seperator.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(seperator);
        seperator.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: INDENT).isActive = true;
        seperator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: INDENT).isActive = true;
        seperator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -INDENT).isActive = true;
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        
        
        tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true;
        tableView.heightAnchor.constraint(equalToConstant: self.view.frame.height - NAVIGATION_SIZE - STATUS_BAR - 75 - 63).isActive = true;
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true;
        tableView.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: INDENT).isActive = true;
        
        
        
        
        
        
        
    }
   
    


    func logoPressed() {
        let webview = WebViewViewController();
        navigationController?.pushViewController(webview, animated: true);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! goalCell;
        cell.textLabel?.text = goals[indexPath.row].goalName;
        if (goals[indexPath.row].isComplete) {
            cell.accessoryType = .checkmark;
        }
        
        
        return cell;
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return name.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return name[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameButton.textField.text = name[row] + " ▼"
    }
    
}



class goalCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

