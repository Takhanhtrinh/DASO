//
//  playCountDownViewController.swift
//  DASO
//
//  Created by Trinh Ta on 1/3/18.
//  Copyright © 2018 Trinh Ta. All rights reserved.
//

import UIKit

class playCountDownViewController: UIViewController {

    var imageView: UIImageView!;
    var namelb: UILabel!;
    var timelb: UILabel!;
    var countdownLb: UILabel!;
    var scorelb: UILabel!;
    var numberOfScoresLb: UILabel!;
    var numberOfSeconds = 0;
    var selectedName: String!;
    var nextGame: UIButton!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        autolayout();
       
        
        
        
        
        

    }
    
    func createView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75));
        imageView.image = #imageLiteral(resourceName: "profile");
        imageView.layer.cornerRadius = imageView.frame.width / 2;
        imageView.layer.masksToBounds = true;
        imageView.contentMode = .scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(imageView);
        
        namelb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30));
        namelb.textAlignment = .center;
        namelb.text = selectedName;
        namelb.translatesAutoresizingMaskIntoConstraints = false;
        namelb.textAlignment = .center;
        namelb.font = UIFont(name: "Roboto-Medium", size: 14);
        view.addSubview(namelb);
        
        timelb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30));
        timelb.textAlignment = .center;
        timelb.text = "Time Remaining";
        timelb.textColor = UIColor(white: 0, alpha: 0.5);
        timelb.translatesAutoresizingMaskIntoConstraints = false;
        timelb.font = UIFont(name: "Roboto-Medium", size: 14);
        view.addSubview(timelb);
        
        countdownLb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30));
        countdownLb.textAlignment = .center;
        countdownLb.text = "\(self.numberOfSeconds)";
        countdownLb.translatesAutoresizingMaskIntoConstraints = false;
        countdownLb.font = UIFont(name: "Roboto-Medium", size: 14);
        view.addSubview(countdownLb);
        
        nextGame = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 36));
        nextGame.layer.cornerRadius = 4;
        nextGame.layer.masksToBounds = true;
        nextGame.translatesAutoresizingMaskIntoConstraints = false;
        nextGame.addTarget(self, action: #selector(nextGamePressed), for: .touchUpInside);
        nextGame.setTitle("Next Game", for: .normal);
        nextGame.backgroundColor = NAVIGATION_DRAWER_COLOR;
        view.addSubview(nextGame);
        nextGame.isHidden = true;
        
        var time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true);
    }
    
    func   autolayout() {
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: NAVIGATION_SIZE + STATUS_BAR + INDENT).isActive = true;
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0 ).isActive = true;
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true;
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true;
        
        namelb.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true;
        namelb.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0.0).isActive = true;
        namelb.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        namelb.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        let seperatorLine = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1));
        seperatorLine.backgroundColor = UIColor(white: 0, alpha: 0.5);
        seperatorLine.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(seperatorLine);
        seperatorLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: INDENT).isActive = true;
        seperatorLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -INDENT).isActive = true;
        seperatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        seperatorLine.topAnchor.constraint(equalTo: namelb.bottomAnchor, constant: INDENT).isActive = true;
        
        timelb.topAnchor.constraint(equalTo: seperatorLine.bottomAnchor, constant: INDENT).isActive = true;
        timelb.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true;
        timelb.widthAnchor.constraint(equalToConstant: view.frame.width - INDENT * 2).isActive = true;
        timelb.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        countdownLb.topAnchor.constraint(equalTo: timelb.bottomAnchor, constant: INDENT).isActive = true;
        countdownLb.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true;
        countdownLb.widthAnchor.constraint(equalToConstant: view.frame.width - INDENT * 2).isActive = true;
        countdownLb.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        
        nextGame.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -INDENT).isActive = true;
        nextGame.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true;
        nextGame.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        nextGame.heightAnchor.constraint(equalToConstant: 36).isActive = true;
        
        
        
    }
    func nextGamePressed() {
        navigationController?.popViewController(animated: true);
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func updateTime() {
        numberOfSeconds -= 1;
        if (numberOfSeconds <= 0) {
            numberOfSeconds = 0;
            timelb.text = "Scores";
             countdownLb.text = "3750";
            nextGame.isHidden = false;
            
        }
        else {
            countdownLb.text = "\(numberOfSeconds)"
        }
       
       
    }
    

 

}
