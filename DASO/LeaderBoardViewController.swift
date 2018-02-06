//
//  LeaderBoardViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    var tableView: UITableView!;
    var imageView: UIImageView!;
    var nameBt: MDButtonWithLabel!;
    var locationBt: MDButtonWithLabel!;
    var modeBt: MDButtonWithLabel!;
    
    
    
    private let cellID = "CellID";
    let ranks = Rank.createSameple();
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leaderboard";
        let logo = #imageLiteral(resourceName: "DASO-BUTTON");
        let button = UIBarButtonItem(image: logo, landscapeImagePhone: UIImage(), style: .plain, target: self, action: #selector(logoPressed));
        navigationItem.rightBarButtonItem = button;
        
        
        createView();
        autoLayout();
        
    }
    func logoPressed() {
        let webview = WebViewViewController();
        navigationController?.pushViewController(webview, animated: true);
    }

    
 
    func createView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75 ));
        imageView.image = #imageLiteral(resourceName: "profile");
        imageView.layer.cornerRadius = imageView.frame.width / 2;
        imageView.layer.masksToBounds = true;
        imageView.contentMode = .scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(imageView);
        
        nameBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 68));
        nameBt.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(nameBt);
        
        locationBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: 68));
        locationBt.translatesAutoresizingMaskIntoConstraints = false;
        locationBt.label.text = "Location";
//        view.addSubview(nameBt);
        
        modeBt = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width: (self.view.frame.width - INDENT * 2) / 2 - 8, height: 68));
        modeBt.translatesAutoresizingMaskIntoConstraints = false;
        modeBt.label.text = "Time";
//        view.addSubview(nameBt);
    
        
        tableView = UITableView(frame: self.view.bounds);
        tableView.register(leaderboardCell.self, forCellReuseIdentifier: cellID);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(leaderboardCell.self, forCellReuseIdentifier: cellID);
        tableView.separatorStyle = .none;
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(tableView);
        
        
    }
    func autoLayout(){
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true;
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true;
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: INDENT + NAVIGATION_SIZE + STATUS_BAR).isActive = true;
        
        nameBt.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true;
        nameBt.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        nameBt.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true;
        nameBt.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0.0).isActive = true;
        nameBt.textField.text = name[0] + " " + DROP_DOWN_ICON;
        nameBt.textField.textColor = UIColor.blue;
        nameBt.textField.textAlignment = .center;
        nameBt.addPicker();
        nameBt.pickerView?.delegate = self;
        
        let stackview = UIStackView(arrangedSubviews: [locationBt, modeBt]);
        stackview.axis = .horizontal;
        stackview.distribution = .fillEqually;
        stackview.spacing = 8.0;
        stackview.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(stackview);
        
        stackview.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        stackview.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        stackview.topAnchor.constraint(equalTo: nameBt.bottomAnchor, constant: INDENT).isActive = true;
        stackview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: INDENT).isActive = true;
        locationBt.textField.layoutIfNeeded();
        modeBt.textField.layoutIfNeeded();
      
        locationBt.textField.text = "Seattle ▼";
        locationBt.textField.textColor = UIColor.blue;
        modeBt.textField.text = "30 seconds ▼";
        modeBt.textField.textColor = UIColor.blue;
        
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - INDENT * 2, height: 1));
        seperator.backgroundColor = UIColor(white: 0, alpha: 0.5);
        seperator.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(seperator);
        
        seperator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: INDENT).isActive = true;
        seperator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -INDENT).isActive = true;
        seperator.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: INDENT).isActive = true;
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        
        tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true;
        tableView.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: INDENT).isActive = true;
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0.0).isActive = true;
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true;
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! leaderboardCell;
        cell.namelb.text = ranks[indexPath.row].name;
        cell.scorelb.text = String(ranks[indexPath.row].score)
        cell.ranklb.text = String(ranks[indexPath.row].rank)
        
        return cell;
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == nameBt.pickerView) {
            return 1;
        }
        else {
            return 0;
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == nameBt.pickerView) {
            return name.count;
        }
        else {
            return 0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == nameBt.pickerView) {
            return name[row];
            
        }
        else {
            return String();
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == nameBt.pickerView) {
            nameBt.textField.text = name[row] + " " + DROP_DOWN_ICON;
        }
    }
 
    
    
}


class leaderboardCell: UITableViewCell {
    
    var ranklb: UILabel!;
    var namelb: UILabel!;
    var scorelb: UILabel!;
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        createView();
        autolayout();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        ranklb = UILabel(frame: .zero
        );
        ranklb.translatesAutoresizingMaskIntoConstraints = false;
//        ranklb.backgroundColor = UIColor.red;
//        addSubview(ranklb);
        
        namelb = UILabel(frame: .zero);
        namelb.translatesAutoresizingMaskIntoConstraints = false;
        namelb.textAlignment = .center;
//        namelb.backgroundColor = UIColor.blue;
//        addSubview(namelb);
        
        scorelb = UILabel(frame: .zero);
        scorelb.translatesAutoresizingMaskIntoConstraints = false;
        scorelb.textAlignment = .right;
//        scorelb.backgroundColor = UIColor.green;
//        addSubview(scorelb);
        
     
        
        
        
    }
    func autolayout(){
        let stackview = UIStackView(arrangedSubviews: [ranklb,namelb,scorelb]);
        stackview.axis = .horizontal;
        stackview.distribution = .fillEqually;
        stackview.spacing = 2.0;
        stackview.translatesAutoresizingMaskIntoConstraints = false;
         addSubview(stackview);
        stackview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - INDENT * 2 ).isActive = true;
        stackview.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true;
        stackview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        stackview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        
       
    }
    
  
    
}


