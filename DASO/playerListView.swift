//
//  playerListView.swift
//  DASO
//
//  Created by Trinh Ta on 12/24/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit




protocol playerListViewDelegate: class {
    func didSelectATeam(view: playerListView, teamName: String);
}

let name = ["Tommy Miller", "Richard Vinh", "David Linderman", "John Smith"];

class playerListView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView: UICollectionView!;
    var playersLabel: MDLabel!;
    var addBt: UIButton!;
    let cellID = "cellID";
    
    var delegate: playerListViewDelegate?;
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
        autoLayout();
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func createView() {
        playersLabel = MDLabel(frame: .zero, title: "Players");
        playersLabel.translatesAutoresizingMaskIntoConstraints = false;
        playersLabel.font = UIFont(name: "Roboto-Medium", size: 14);
        playersLabel.textColor = UIColor.black;
        self.addSubview(playersLabel);
        
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .vertical;
        layout.itemSize = CGSize(width: self.frame.size.width / 4  , height: self.frame.size.width / 4  + 16 + 8);
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        layout.minimumInteritemSpacing = 0.0;


        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout);
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.register(playerCell.self, forCellWithReuseIdentifier: cellID);
        collectionView.backgroundColor = UIColor.white;
        
        addSubview(collectionView);
        
    }
    func autoLayout() {
        
        playersLabel.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2).isActive = true;
        playersLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        playersLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        playersLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: INDENT).isActive = true;

       
        
        collectionView.widthAnchor.constraint(equalToConstant: self.frame.width - INDENT * 2 ).isActive = true;
        collectionView.heightAnchor.constraint(equalToConstant: self.frame.height - (INDENT + 20 + INDENT)).isActive = true;
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: INDENT).isActive = true;
        collectionView.topAnchor.constraint(equalTo: playersLabel.bottomAnchor, constant: INDENT).isActive = true;
//
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! playerCell;
        cell.nameLb.text = name[indexPath.row];
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectATeam(view: self, teamName: name[indexPath.row]);
    }
    

}

class playerCell: UICollectionViewCell {
    var nameLb: MDLabel!;
    var profileImage: UIImageView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        createView();
        autolayout();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createView() {
        profileImage = UIImageView();
        profileImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width);
       
        profileImage.image = #imageLiteral(resourceName: "profile");
        profileImage.layer.cornerRadius = profileImage.frame.width / 2;
        profileImage.layer.masksToBounds = true;
        profileImage.contentMode = .scaleAspectFit;
        profileImage.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(profileImage);
        
        nameLb = MDLabel(frame: .zero, title: "Trinh Ta");
        nameLb.font = UIFont(name: "Roboto-Regular", size: 12);
        nameLb.textColor = UIColor.black;
        nameLb.textAlignment = .center;
        nameLb.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(nameLb);
        
        
        
        
        
        
    }
    func autolayout(){
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0).isActive = true;
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true;
        profileImage.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        profileImage.heightAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        
        nameLb.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor, constant: 0.0).isActive = true;
        nameLb.topAnchor.constraint(equalTo: self.profileImage.bottomAnchor, constant: 8.0).isActive = true;
        nameLb.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true;
        nameLb.heightAnchor.constraint(equalToConstant: 16).isActive = true;
        
    }
    
    
}


