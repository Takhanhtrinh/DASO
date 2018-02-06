//
//  Circle.swift
//  testCircle
//
//  Created by Trinh Ta on 1/13/18.
//  Copyright © 2018 Trinh Ta. All rights reserved.
//

import UIKit

class RadioButton: UIView, CAAnimationDelegate {
    var radius: Double!;
    var outterCircle: CAShapeLayer!;
    var innerCirlce: CAShapeLayer!;
    var color = NAVIGATION_DRAWER_COLOR.cgColor;
    var isOn = true {
        didSet {
            if (isOn == true) {
                onAnimation();
            }
            else {
                offAnimation();
            }
        }
    };
    
    let CIRCLE_OFFSET = Double(5);
    override init(frame: CGRect) {
        super.init(frame: frame);
        radius = Double(frame.width / 2);
        createTapGesture();
        createOuterCircle();
        createInnerCircle();
    }
    
    init(frame:CGRect, color: UIColor) {
        super.init(frame: frame);
        self.color = color.cgColor;
        radius = Double(frame.width / 2);
        createTapGesture();
        createOuterCircle();
        createInnerCircle();
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createOuterCircle() {
        let center = CGPoint(x: bounds.origin.x + frame.width / 2, y: bounds.origin.y + frame.height / 2);
        let path = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: 0, endAngle: 360, clockwise: true);
      
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.path = path.cgPath;
        shapeLayer.lineWidth = 2;
        shapeLayer.strokeColor = color;
        shapeLayer.fillColor = UIColor.clear.cgColor;
        outterCircle = shapeLayer;
        layer.addSublayer(shapeLayer);
        
    }
    func createInnerCircle() {
        //on draw
        let center = CGPoint(x: bounds.origin.x + frame.width / 2, y: bounds.origin.y + frame.height / 2);
        let path = UIBezierPath(arcCenter: center, radius: CGFloat(radius - 2.0 - CIRCLE_OFFSET), startAngle: 0, endAngle: 360, clockwise: true);
        let shapeLayer = CAShapeLayer();
        shapeLayer.path = path.cgPath;
        shapeLayer.lineWidth = CGFloat(radius - 2.0 - CIRCLE_OFFSET);
        shapeLayer.strokeColor = color;
        shapeLayer.fillColor = color;
        innerCirlce = shapeLayer;
        layer.addSublayer(shapeLayer);
    }
    
    func createTapGesture() {
        let tapGesture = UITapGestureRecognizer();
        tapGesture.addTarget(self, action: #selector(tapped));
        self.addGestureRecognizer(tapGesture);
        self.isUserInteractionEnabled = true;
      
    }
    
    @objc func tapped() {
        isOn = !isOn;
        print(isOn);
    }
    
    private func onAnimation() {
        let animation = CABasicAnimation(keyPath: "lineWidth");
        animation.fromValue = CGFloat(0);
        animation.toValue = CGFloat(radius - 2.0 - CIRCLE_OFFSET);
        animation.duration = 0.2;
        animation.isRemovedOnCompletion = true;
        animation.fillMode = kCAFillModeForwards;
        animation.delegate = self;
        innerCirlce.add(animation, forKey: "on");
        
    }
    
    private func offAnimation() {
        let animation = CABasicAnimation(keyPath: "lineWidth");
        animation.fromValue = CGFloat(radius - 2.0 - CIRCLE_OFFSET);
        animation.toValue = 0;
        animation.duration = 0.2;
        animation.isRemovedOnCompletion = true;
        animation.fillMode = kCAFillModeForwards;
        animation.delegate = self;
        innerCirlce.add(animation, forKey: "off");
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if (isOn == false) {
            innerCirlce.strokeColor =  UIColor.clear.cgColor;
            innerCirlce.fillColor = UIColor.clear.cgColor;
            outterCircle.strokeColor = UIColor.darkGray.cgColor;
        }
    }
    func animationDidStart(_ anim: CAAnimation) {
        if (isOn) {
            innerCirlce.strokeColor = color;
            innerCirlce.fillColor = color;
            outterCircle.strokeColor = color;
        }
    }
    
    
}





