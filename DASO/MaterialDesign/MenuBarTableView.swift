//
//  MenuBarTableView.swift
//  DASO
//
//  Created by Trinh Ta on 12/18/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit


protocol menuBarDelegate: class {
    func viewSelected(menuBar: MenuBarTableView, selectedView: Int);
}


class MenuBarTableView: UIView, UITableViewDelegate, UITableViewDataSource, playerListViewDelegate {
    var tableView: UITableView!;
    var myProfileView: profileView!;
    weak var delegate: menuBarDelegate?;
    
    
    
    
    let menu = ["Play", "Performace", "Goals", "Leaderboard", "Settings"];
    let profileCellID = "profileCellID";
    let menuCellID = "menuCellID";
    let playerListID = "playerListID";
    
    var leadingConstrait: NSLayoutConstraint!;
    
    
    override init(frame: CGRect) {
        
        
        super.init(frame:frame);
        
        backgroundColor = UIColor(white: 0, alpha: 0.5);
        
//        myProfileView = profileView(frame: CGRect(x: -frame.origin.x, y: 0, width: frame.width - MENU_OFFSET, height: PROFILE_HEIGHT));
        myProfileView = profileView(frame: CGRect(x: -frame.origin.x, y: 0, width: frame.width - MENU_OFFSET, height: PROFILE_HEIGHT), isCouch: true);
        
        
        
        
        let tableFrame = CGRect(x: -frame.origin.x, y: PROFILE_HEIGHT, width: frame.width - MENU_OFFSET, height: frame.height - PROFILE_HEIGHT);
        
        
        tableView = UITableView(frame: tableFrame);
        
        
        
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        tableView.register(menuCell.self, forCellReuseIdentifier: menuCellID);
        tableView.register(playerListCell.self, forCellReuseIdentifier: playerListID);
        tableView.separatorStyle = .none;
        
        tableView.isScrollEnabled = false;
        
        
        addSubview(tableView);
        addSubview(myProfileView);
        
        
        autolayout();
        
        
    }
   
    
    
    
    func autolayout() {
        myProfileView.translatesAutoresizingMaskIntoConstraints = false;
        myProfileView.widthAnchor.constraint(equalToConstant: self.frame.width - MENU_OFFSET).isActive = true;
        myProfileView.heightAnchor.constraint(equalToConstant: PROFILE_HEIGHT).isActive = true;
        myProfileView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true;
        
        tableView.widthAnchor.constraint(equalToConstant: self.frame.width - MENU_OFFSET).isActive = true;
        tableView.heightAnchor.constraint(equalToConstant: self.frame.height - PROFILE_HEIGHT).isActive = true;
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true;
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: PROFILE_HEIGHT).isActive = true;
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count + 1;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row != 5) {
            let cell = tableView.dequeueReusableCell(withIdentifier: menuCellID) as! menuCell;
            cell.menuLb.text = menu[indexPath.row];
            
            
            return cell;
        }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: playerListID) as! playerListCell;
        cell.height = frame.height - PROFILE_HEIGHT - (48 * 5) - HOME_INDICATOR;
        cell.width = tableView.frame.width;
        cell.createView();
        cell.playerList.delegate = self;
       
    
       
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.viewSelected(menuBar: self, selectedView: indexPath.row);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
//        if (indexPath.row == 4) {
//            return 48 * 2;
//        }
         if (indexPath.row == 5) {
            return frame.height - PROFILE_HEIGHT - (48 * 5) - HOME_INDICATOR;
        }
        
        
        return 48;
        
        
        
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func didSelectATeam(view: playerListView, teamName: String) {
        myProfileView.nameLb.text = teamName;
    }
   
}




class baseCell: UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
class profileView: UIView {
    var nameLb: MDLabel!;
    var pointLb: MDLabel!;
    var profileImage: UIImageView!;
    var bluetoothImageView: UIImageView!;
    var bluetoothSelection: RadioButton!;
    
    
    
    
    var add_playerBt: UIButton!;
    
    
    
     init(frame: CGRect, reuseableView: Bool) {
        super.init(frame: frame);
        if (!reuseableView) {
            createView();
            autoLayout();
       
        }
        else {
            reuseableCreateView();
            reuseableAutolayout();
     
        }
         backgroundColor = NAVIGATION_DRAWER_COLOR;
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
        autoLayout();
        backgroundColor = NAVIGATION_DRAWER_COLOR;
    }
    
     init(frame: CGRect, isCouch: Bool) {
            super.init(frame: frame);
            createView();
            autoLayout();
        if (isCouch) {
            pointLb.isHidden = true;
            
        }
         backgroundColor = NAVIGATION_DRAWER_COLOR;
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func createView() {
        nameLb = MDLabel(frame: .zero, title: "Trinh Ta");
        nameLb.text = "Trinh Ta";
        nameLb.font = UIFont(name: "Roboto-Medimum.ttf", size: FONT_SIZE)
        
        nameLb.textColor = UIColor.white;
        nameLb.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(nameLb);
        
        
        pointLb = MDLabel(frame: .zero, title: "Scores: 348");
        pointLb.text = "Scores: 348";
        pointLb.textColor = UIColor.white;
        pointLb.font = UIFont(name: "Roboto-Regular.ttf", size: FONT_SIZE);
        pointLb.translatesAutoresizingMaskIntoConstraints = false;
        
        add_playerBt = UIButton(frame: CGRect(x: 0, y: 0, width: ADD_PLAYER_ICON_SIZE.width, height: ADD_PLAYER_ICON_SIZE.height));
        add_playerBt.setImage(#imageLiteral(resourceName: "add_player"), for: .normal);
        
        
        add_playerBt.translatesAutoresizingMaskIntoConstraints = false;
        
        
        bluetoothImageView = UIImageView(image: #imageLiteral(resourceName: "bluetooth"));
        bluetoothImageView.frame = CGRect(x: 0, y: 0, width: 18, height: 18);
        bluetoothImageView.contentMode = .scaleAspectFit;
        bluetoothImageView.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(bluetoothImageView);
        
        
        addSubview(add_playerBt);
        
        
        addSubview(pointLb);
        
        
        
        let frameImage = CGRect(x: INDENT, y: INDENT + STATUS_BAR, width: 75, height: 75);
        let i = #imageLiteral(resourceName: "profile");
        
        profileImage = UIImageView();
        
        profileImage.contentMode = .scaleAspectFit ;
        profileImage.clipsToBounds = true;
        profileImage.frame = frameImage;
        profileImage.image = i;
        
        profileImage.layer.cornerRadius = frameImage.width / 2;
        profileImage.layer.masksToBounds = true;
        profileImage.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(profileImage);
        //
        
        bluetoothSelection = RadioButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24), color: DASO_RED_COLOR);
        bluetoothSelection.translatesAutoresizingMaskIntoConstraints = false;
        bluetoothSelection.color = DASO_RED_COLOR.cgColor;
        addSubview(bluetoothSelection);
        
        
        
    }
  
    
    
    func reuseableCreateView() {
        nameLb = MDLabel(frame: .zero, title: "Trinh Ta");
        nameLb.text = "Trinh Ta";
        nameLb.font = UIFont(name: "Roboto-Bold", size: FONT_SIZE)
    
        
        nameLb.textColor = UIColor.black;
        nameLb.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(nameLb);
        
        
        pointLb = MDLabel(frame: .zero, title: "Scores: 348");
        pointLb.text = "Scores: 348";
        pointLb.textColor = UIColor(white: 0, alpha: 0.5);
        pointLb.font = UIFont(name: "Roboto-Medium", size: FONT_SIZE);
        pointLb.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(pointLb);
        
        
        
        let frameImage = CGRect(x: INDENT, y: INDENT + STATUS_BAR, width: 75, height: 75);
        let i = #imageLiteral(resourceName: "profile");
        
        profileImage = UIImageView();
        
        profileImage.contentMode = .scaleAspectFit ;
        profileImage.clipsToBounds = true;
        profileImage.frame = frameImage;
        profileImage.image = i;
        
        profileImage.layer.cornerRadius = frameImage.width / 2;
        profileImage.layer.masksToBounds = true;
        profileImage.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(profileImage);
    }
    func autoLayout() {
        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT + STATUS_BAR).isActive = true;
//        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
//        profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        profileImage.widthAnchor.constraint(equalToConstant: 75).isActive = true;
        profileImage.heightAnchor.constraint(equalToConstant: 75).isActive = true;
        
        nameLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        nameLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
//        nameLb.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true;
        nameLb.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: INDENT).isActive = true;
        nameLb.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
        
        pointLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        pointLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
//        pointLb.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true;
        pointLb.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 8).isActive = true;
        pointLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        
        add_playerBt.widthAnchor.constraint(equalToConstant: ADD_PLAYER_ICON_SIZE.width).isActive = true;
        add_playerBt.heightAnchor.constraint(equalToConstant: ADD_PLAYER_ICON_SIZE.height).isActive = true;
        add_playerBt.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        add_playerBt.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT + STATUS_BAR).isActive = true;
        
        bluetoothImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true;
        bluetoothImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true;
        bluetoothImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        bluetoothImageView.topAnchor.constraint(equalTo: add_playerBt.bottomAnchor, constant: INDENT).isActive = true;
        
        bluetoothSelection.widthAnchor.constraint(equalToConstant: 24).isActive = true;
        bluetoothSelection.heightAnchor.constraint(equalToConstant: 24).isActive = true;
        bluetoothSelection.topAnchor.constraint(equalTo: bluetoothImageView.bottomAnchor, constant: 8).isActive = true;
        bluetoothSelection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -INDENT).isActive = true;
        
        
        
    }
    
    func reuseableAutolayout() {
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT ).isActive = true;
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        
        nameLb.textAlignment = .center;
        nameLb.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        nameLb.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: INDENT).isActive = true;
        nameLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        nameLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
       
        
        pointLb.textAlignment = .center;
        pointLb.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
        pointLb.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 8).isActive = true;
        pointLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        pointLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;

       
    }
    
}

class profileCell: baseCell {
    
    var nameLb: MDLabel!;
    var pointLb:MDLabel!;
    var profileImage: UIImageView!;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        createView();
        autoLayout();
        backgroundColor = UIColor.green;
        //disable selection highline
        //        selectionStyle = .none;
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createView() {
        nameLb = MDLabel(frame: .zero, title: "Trinh Ta");
        nameLb.text = "Trinh Ta";
        nameLb.font = UIFont(name: "Roboto-Medimum.ttf", size: FONT_SIZE)
        
        nameLb.textColor = UIColor.black;
        nameLb.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(nameLb);
        
        
        pointLb = MDLabel(frame: .zero, title: "Scores: 348");
        pointLb.text = "Scores: 348";
        pointLb.textColor = UIColor.lightGray;
        pointLb.font = UIFont(name: "Roboto-Regular.ttf", size: FONT_SIZE);
        pointLb.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(pointLb);
        
        
        
        let frameImage = CGRect(x: INDENT, y: INDENT, width: 100, height: 100);
        let i = #imageLiteral(resourceName: "profile");
        profileImage = UIImageView();
        
        profileImage.contentMode = .scaleAspectFit ;
        profileImage.clipsToBounds = true;
        profileImage.frame = frameImage;
        profileImage.image = i;
        
        profileImage.layer.cornerRadius = frameImage.width / 2;
        profileImage.layer.masksToBounds = true;
        //                profileImage.translatesAutoresizingMaskIntoConstraints = false;
        
        addSubview(profileImage);
        //
        
    }
    
    
    func autoLayout() {
        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT).isActive = true;
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        
        nameLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        nameLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        nameLb.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: INDENT).isActive = true;
        nameLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        
        
        pointLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        pointLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -INDENT).isActive = true;
        pointLb.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 8).isActive = true;
        pointLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        
        
        
        
        
    }
}

class playerListCell: UITableViewCell {
    var playerList: playerListView!;
    var height: CGFloat!;
    var width: CGFloat!;
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
     
   
    }
    func createView() {
        
        playerList = playerListView(frame: CGRect(x: 0, y: 0, width: width, height: height));
       
        playerList.collectionView.isScrollEnabled = true;
        playerList.collectionView.bounces = true;
        playerList.collectionView.alwaysBounceVertical = true;
        addSubview(playerList);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class menuCell: baseCell {
    var menuLb: MDLabel!;
    var menuImage: UIImageView!;
    let MENU_IMAGE_SIZE = CGFloat(24);
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        createVew();
        autoLayout();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func createVew() {
        
        menuImage = UIImageView();
        menuImage.image = #imageLiteral(resourceName: "Image");
        menuImage.contentMode = .scaleAspectFit;
        menuImage.clipsToBounds = true;
        let frame = CGRect(x: 0, y: 0 , width: MENU_IMAGE_SIZE , height: MENU_IMAGE_SIZE);
        menuImage.frame = frame;
        menuImage.translatesAutoresizingMaskIntoConstraints = false;
        
        self.addSubview(menuImage);
        
        menuLb = MDLabel(frame: .zero, title: "Perfomace");
        menuLb.text = "Performace";
        menuLb.font = UIFont(name: "Roboto-Medium", size: FONT_SIZE);
        menuLb.textColor = UIColor.black;
        menuLb.translatesAutoresizingMaskIntoConstraints = false;
     
        self.addSubview(menuLb);
        
    }
    
    
    func autoLayout() {
        //        self.translatesAutoresizingMaskIntoConstraints = false;
        
        menuImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        menuImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true;
        menuImage.widthAnchor.constraint(equalToConstant: MENU_IMAGE_SIZE).isActive = true;
        menuImage.heightAnchor.constraint(equalToConstant: MENU_IMAGE_SIZE).isActive = true;
        
        
        menuLb.translatesAutoresizingMaskIntoConstraints = false;
        menuLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 72).isActive = true;
        menuLb.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true;
        menuLb.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT - 72).isActive = true;
        menuLb.heightAnchor.constraint(equalToConstant: FONT_SIZE).isActive = true;
        
        
    }
    
    
}


