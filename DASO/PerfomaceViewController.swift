//
//  PerfomaceViewController.swift
//  DASO
//
//  Created by Trinh Ta on 12/21/17.
//  Copyright © 2017 Trinh Ta. All rights reserved.
//

import UIKit

class PerfomaceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var profileImageView: UIImageView!;
    var choosePlayersButton: MDButtonWithLabel!;
    
    var scrollView: UIScrollView!;
    
    var segmentView: UISegmentedControl!;
    
    var scoreView: UIView!;
    var accurateView: UIView!;
    var reflexView: UIView!;
    var velocityView: UIView!;
    var distanceView: UIView!;
    
    var visibleView: UIView!;
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Perfomace";
        
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
    
    func logoPressed() {
        let webview = WebViewViewController();
        navigationController?.pushViewController(webview, animated: true);
    }
    
    func createView() {
        profileImageView = UIImageView(image: #imageLiteral(resourceName: "profile"));
        profileImageView.frame = CGRect(x: 0, y: 0, width: 75, height: 75);
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2;
        profileImageView.layer.masksToBounds = true;
        profileImageView.contentMode = .scaleAspectFit;
        profileImageView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(profileImageView);
        
        choosePlayersButton = MDButtonWithLabel(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 68));
        choosePlayersButton.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(choosePlayersButton);
        let segmentFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 29);
      
        let items = ["Score" , "Accurate", "Reflex", "Velocity", "Distance"];
        segmentView = UISegmentedControl(items: items);
        segmentView.frame = segmentFrame;
        segmentView.translatesAutoresizingMaskIntoConstraints = false;
        segmentView.layer.cornerRadius = 5;
        segmentView.addTarget(self, action: #selector(segmentViewChanged), for: .valueChanged);
        segmentView.selectedSegmentIndex = 0;
        view.addSubview(segmentView);
        
        scrollView = UIScrollView();
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(scrollView);
        
        
    }
    
    func autolayout() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 75),
            profileImageView.heightAnchor.constraint(equalToConstant: 75),
            profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0),
            profileImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: STATUS_BAR + NAVIGATION_SIZE + INDENT),
            
            choosePlayersButton.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            choosePlayersButton.heightAnchor.constraint(equalToConstant: 68),
            choosePlayersButton.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor, constant: 0.0),
            choosePlayersButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0.0),
            
            segmentView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 8 * 2),
            segmentView.heightAnchor.constraint(equalToConstant: 29),
            segmentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8.0),
            segmentView.topAnchor.constraint(equalTo: choosePlayersButton.bottomAnchor, constant: -8)
            ])
        
        choosePlayersButton.textField.textColor = UIColor.blue;
        choosePlayersButton.textField.textAlignment = .center;
        choosePlayersButton.addPicker();
        choosePlayersButton.pickerView?.delegate = self;
        choosePlayersButton.textField.text = name[0] + " ▼";
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 0.0),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
            scrollView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0.0)
            
            ])
        
        
    }
    
    func segmentViewChanged() {
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == choosePlayersButton.pickerView) {
            return 1;
        }
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == choosePlayersButton.pickerView) {
            return name.count;
        }
        
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == choosePlayersButton.pickerView) {
            return name[row]
            
            
        }
        
        return String();
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == choosePlayersButton.pickerView) {
            choosePlayersButton.textField.text = name[row] +  " ▼";
        }
    }
    
    



}
