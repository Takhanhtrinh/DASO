//
//  PlayViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/22/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
 
    var modeButton: MDButtonWithLabel!;
    var targetButton: MDButtonWithLabel!
    var timeButton: MDButtonWithLabel!;
    
    
    var syncNetworklb:UILabel!;
    var handicapSwitch: UISwitch!;
    var syncNetworkSwitch: UISwitch!;
    var scrollView: UIScrollView!;
    var containerView: UIView!;
    
    
    
    
    
    let GAME_MODE = ["Total", "Lightning", "Precision Lightning", "Power"];
    let TIME_MODE = ["15 seconds","30 seconds", "1 minute" ];
    let TARGET_MODE = ["All Targets", "Top", "Bottom", "Only Verticals"];
    
    var modeSelection: [UInt8] = [0,0,0];
    
    
    var playbt: UIButton!;
    var playerImageView: UIImageView!;
    var choosePlayersButton: MDButtonWithLabel!;
    var secondsSelected = [15,30,60];
    var selectedName: String = name[0];
    
    var handicapModeImageView: UIImageView!;
    var handicapModeSelection: RadioButton!;
    var dataTrackingRadioButton: RadioButton!;
    var handicapTimeLb: UILabel!;
    var timeForHandicap: UILabel!;
    var changeTimeStepper: UIStepper!;
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Play";
        let logo = #imageLiteral(resourceName: "DASO-BUTTON");
        let button = UIBarButtonItem(image: logo, landscapeImagePhone: UIImage(), style: .plain, target: self, action: #selector(logoPressed));
        navigationItem.rightBarButtonItem = button;

        createView();
        autolayout();
        
    }
    
    
    
    func logoPressed() {
        let webview = WebViewViewController();
        navigationController?.pushViewController(webview, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createView() {
        
        containerView = UIView(frame: self.view.frame);
       
        scrollView = UIScrollView(frame: self.view.frame);
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        handicapModeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24));
        handicapModeImageView.image = #imageLiteral(resourceName: "clock");
        handicapModeImageView.contentMode = .scaleAspectFit;
        handicapModeImageView.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(handicapModeImageView);
        
        handicapModeSelection = RadioButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24));
        handicapModeSelection.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(handicapModeSelection);
        
        playerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75));
        playerImageView.image = #imageLiteral(resourceName: "profile");
        playerImageView.layer.cornerRadius = playerImageView.frame.width / 2;
        playerImageView.layer.masksToBounds = true;
        playerImageView.contentMode = .scaleAspectFit;
        playerImageView.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(playerImageView);
        
        choosePlayersButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 68));
        choosePlayersButton.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(choosePlayersButton);
        
       
        
        handicapTimeLb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 31));
        handicapTimeLb.translatesAutoresizingMaskIntoConstraints = false;
        handicapTimeLb.text = "Handicap Time";
        handicapTimeLb.font = UIFont(name: "Roboto-Medium", size: 14);
        handicapTimeLb.textColor = UIColor(white: 0, alpha: 0.54);
        
        timeForHandicap  = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 31));
        timeForHandicap.translatesAutoresizingMaskIntoConstraints = false;
        timeForHandicap.font = UIFont(name: "Roboto-Medium", size: 14);
     
        
        changeTimeStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: STEPPER_SIZE.width, height: STEPPER_SIZE.height));
        changeTimeStepper.wraps = true;
        changeTimeStepper.maximumValue = MAXIMUM_HANDICAP_TIME;
        changeTimeStepper.minimumValue = MINIMUM_HANDICAP_TIME;
        changeTimeStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged);
        changeTimeStepper.translatesAutoresizingMaskIntoConstraints = false;
        
        timeForHandicap.text = String(changeTimeStepper.value) + "s";
        timeForHandicap.textAlignment = .center;
        
        
        handicapSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: SWITCH_SIZE.width, height: SWITCH_SIZE.height));
        handicapSwitch.isOn = true;
        handicapSwitch.addTarget(self, action: #selector(handicapSwitchChanged), for: .valueChanged);
        handicapSwitch.onTintColor = NAVIGATION_DRAWER_COLOR;
        
        syncNetworklb = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 31));
        syncNetworklb.translatesAutoresizingMaskIntoConstraints = false;
        syncNetworklb.text = "Data Tracking";
        syncNetworklb.font = UIFont(name: "Roboto-Medium", size: 14);
        syncNetworklb.textColor = UIColor(white: 0, alpha: 0.54);
        containerView.addSubview(syncNetworklb);
        
        dataTrackingRadioButton = RadioButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24));
        dataTrackingRadioButton.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(dataTrackingRadioButton);
        
        
        modeButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width:  self.view.frame.width - INDENT * 2, height: 68));
        modeButton.label.text = "MODE";
        modeButton.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(modeButton);
        
        
        targetButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width:  self.view.frame.width - INDENT * 2, height: 68));
        targetButton.label.text = "TARGETS";
        targetButton.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(targetButton);
        
        timeButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width:  self.view.frame.width - INDENT * 2, height: 68));
        timeButton.label.text = "TIME";
        timeButton.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(timeButton);
        
        playbt = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        playbt.addTarget(self, action: #selector(playBtpressed), for: .touchUpInside);
        playbt.setImage(#imageLiteral(resourceName: "playBt"), for: .normal);
        let imageView = playbt.imageView;
        imageView?.contentMode = .scaleAspectFit;
        playbt.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(playbt);
        
    }
    
    func autolayout() {
        
         view.addSubview(scrollView);
        scrollView.addSubview(containerView);
        
        
        scrollView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true;
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: STATUS_BAR + NAVIGATION_SIZE).isActive = true;
        scrollView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0.0).isActive = true;
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true;
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true;
        
//        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0.0).isActive = true;
//        containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0.0).isActive = true;
//        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true;
//        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true;
//        containerView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true;
//        
        
        
        playerImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true;
        playerImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true;
        playerImageView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor, constant: 0).isActive = true;
        playerImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: INDENT).isActive = true;
        
        choosePlayersButton.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true;
        choosePlayersButton.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        choosePlayersButton.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant:  0.0).isActive = true;
        choosePlayersButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0).isActive = true;
        //        choosePlayersButton.createDropDownIcon();
        choosePlayersButton.textField.textColor = UIColor.blue;
        choosePlayersButton.textField.textAlignment = .center;
        choosePlayersButton.addPicker();
        choosePlayersButton.pickerView?.delegate = self;
        choosePlayersButton.textField.text = name[0] + " ▼";
        
        handicapModeImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -INDENT).isActive = true;
        handicapModeImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true;
        handicapModeImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true;
        handicapModeImageView.topAnchor.constraint(equalTo: choosePlayersButton.bottomAnchor, constant: INDENT).isActive = true;
        
        handicapModeSelection.centerXAnchor.constraint(equalTo: handicapModeImageView.centerXAnchor, constant: 0).isActive = true;
        handicapModeSelection.topAnchor.constraint(equalTo: handicapModeImageView.bottomAnchor, constant: 8).isActive = true;
        handicapModeSelection.widthAnchor.constraint(equalToConstant: 24).isActive = true;
        handicapModeSelection.heightAnchor.constraint(equalToConstant: 24).isActive = true;
    

        
        handicapTimeLb.widthAnchor.constraint(equalToConstant: (self.view.frame.width - INDENT * 2 - STEPPER_SIZE.width - 8) / 2).isActive = true;
        handicapTimeLb.heightAnchor.constraint(equalToConstant: STEPPER_SIZE.height).isActive = true;
        
        timeForHandicap.widthAnchor.constraint(equalToConstant: (self.view.frame.width - INDENT * 2 - STEPPER_SIZE.width - 8) / 2).isActive = true;
        timeForHandicap.heightAnchor.constraint(equalToConstant: STEPPER_SIZE.height).isActive = true;
        
        changeTimeStepper.widthAnchor.constraint(equalToConstant: STEPPER_SIZE.width).isActive = true;
        changeTimeStepper.heightAnchor.constraint(equalToConstant: STEPPER_SIZE.height).isActive = true;
        
          let handicapTimeLbStackView = UIStackView(arrangedSubviews: [handicapTimeLb, timeForHandicap, changeTimeStepper]);
        handicapTimeLbStackView.distribution = .equalSpacing;
        handicapTimeLbStackView.axis = .horizontal;
        handicapTimeLbStackView.spacing = 8.0;
        handicapTimeLbStackView.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(handicapTimeLbStackView);
        
        handicapTimeLbStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: INDENT).isActive = true;
        handicapTimeLbStackView.topAnchor.constraint(equalTo: handicapModeSelection.bottomAnchor, constant: INDENT).isActive = true;
        
        syncNetworklb.topAnchor.constraint(equalTo: handicapTimeLbStackView.bottomAnchor, constant: INDENT).isActive = true;
        syncNetworklb.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: INDENT).isActive = true;
        syncNetworklb.widthAnchor.constraint(equalToConstant:  self.view.frame.width - INDENT * 2 - 24 - 8).isActive = true;
        syncNetworklb.heightAnchor.constraint(equalToConstant: 20).isActive = true;
        
        dataTrackingRadioButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -INDENT).isActive = true;
        dataTrackingRadioButton.topAnchor.constraint(equalTo: handicapTimeLbStackView.bottomAnchor, constant: INDENT).isActive = true;
        dataTrackingRadioButton.widthAnchor.constraint(equalToConstant: 24).isActive = true;
        dataTrackingRadioButton.heightAnchor.constraint(equalToConstant: 24).isActive = true;
        
        
        
      
        
        modeButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        modeButton.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        modeButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: INDENT).isActive = true;
        modeButton.topAnchor.constraint(equalTo: dataTrackingRadioButton.bottomAnchor, constant: INDENT).isActive = true;
        modeButton.layoutIfNeeded();
        modeButton.createDropDownIcon();
        modeButton.addPicker();
        modeButton.pickerView?.delegate = self;
        modeButton.textField.text = GAME_MODE[0];
        
        targetButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        targetButton.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        targetButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: INDENT).isActive = true;
        targetButton.topAnchor.constraint(equalTo: modeButton.bottomAnchor, constant: INDENT).isActive = true;
        targetButton.layoutIfNeeded();
        targetButton.createDropDownIcon();
        targetButton.addPicker();
        targetButton.pickerView?.delegate = self;
        targetButton.textField.text = TARGET_MODE[0];
        
        timeButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - INDENT * 2).isActive = true;
        timeButton.heightAnchor.constraint(equalToConstant: 68).isActive = true;
        timeButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: INDENT).isActive = true;
        timeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -INDENT).isActive = true;
        timeButton.topAnchor.constraint(equalTo: targetButton.bottomAnchor, constant: INDENT).isActive = true;
        timeButton.layoutIfNeeded();
        timeButton.createDropDownIcon();
        timeButton.addPicker();
        timeButton.pickerView?.delegate = self;
        timeButton.textField.text = TIME_MODE[0];
        
        playbt.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        playbt.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        playbt.topAnchor.constraint(equalTo: timeButton.bottomAnchor, constant: INDENT).isActive = true;
        playbt.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor, constant: 0.0).isActive = true;
        
       
       
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: playbt.frame.maxY + INDENT);
        
    }
    
    func handicapSwitchChanged(sender: UISwitch!) {
        if (sender.isOn == true) {
            changeTimeStepper.isEnabled = true;
            changeTimeStepper.tintColor = NAVIGATION_DRAWER_COLOR;
            timeForHandicap.textColor = UIColor.black;
        }
        else {
              changeTimeStepper.isEnabled = false;
              changeTimeStepper.tintColor = UIColor.darkGray;
            timeForHandicap.textColor = UIColor(white: 0, alpha: 0.54);
            
        }
    }
    
   
    func modeButtonPressed() {
        
    }
    func stepperValueChanged() {
        timeForHandicap.text = String(changeTimeStepper.value) + "s";
    }
    
    func playBtpressed() {
        let playCountDownView = playCountDownViewController();
        playCountDownView.selectedName = selectedName;
        playCountDownView.numberOfSeconds = secondsSelected[Int(modeSelection[2])];
        navigationController?.pushViewController(playCountDownView, animated: true);
    }
    
    //delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == modeButton.pickerView) {
            return GAME_MODE.count;
        }
        else if (pickerView == targetButton.pickerView) {
            return TARGET_MODE.count;
        }
        else if (pickerView == timeButton.pickerView) {
            return TIME_MODE.count;
        }
        else {
            return name.count;
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == modeButton.pickerView) {
            return GAME_MODE[row];
        }
        else if (pickerView == targetButton.pickerView) {
            return TARGET_MODE[row];
        }
        else if (pickerView == timeButton.pickerView) {
            return TIME_MODE[row];
        }
        else {
            return name[row];
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == modeButton.pickerView) {
            modeButton.textField.text = GAME_MODE[row];
            modeSelection[0] = UInt8(row);
        }
        else if (pickerView == targetButton.pickerView) {
            targetButton.textField.text = TARGET_MODE[row];
            modeSelection[1] = UInt8(row);
        }
        else if (pickerView == timeButton.pickerView) {
            timeButton.textField.text = TIME_MODE[row];
            modeSelection[2] = UInt8(row);
        }
        else {
            choosePlayersButton.textField.text = name[row] + " ▼" ;
            selectedName = name[row];
            
        }
    }
}
