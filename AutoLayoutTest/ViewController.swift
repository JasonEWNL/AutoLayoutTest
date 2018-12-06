//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by JasonEWNL on 2018/12/3.
//  Copyright © 2018年 TWT Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let orangeView = UIView()
    let yellowView = UIView()
    
    let margin: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        orangeView.backgroundColor = .orange
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orangeView)
        
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowView)
        
        addRedViewConstraint()
        addOrangeViewConstraint()
        addYellowViewConstraint()
        
        // addGroupConstraint()
    }
    
    // MARK: - Constraints Test
    // NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutAttribute#>, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
    // NSLayoutConstraint(item: Any, attribute: NSLayoutAttribute, relatedBy: NSLayoutRelation, toItem: Any?, attribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat)
    
    func addRedViewConstraint() {
        let redViewLeft = NSLayoutConstraint(item: redView,
                                             attribute: .left,
                                             relatedBy: .equal,
                                             toItem: view,
                                             attribute: .left,
                                             multiplier: 1.0,
                                             constant: margin)
        let redViewBottom = NSLayoutConstraint(item: redView,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: -margin)
        let redViewWidth = NSLayoutConstraint(item: redView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 64)
        let redViewHeight = NSLayoutConstraint(item: redView,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 64)
        
        view.addConstraints([redViewLeft, redViewBottom, redViewWidth, redViewHeight])
    }
    
    func addOrangeViewConstraint() {
        let orangeViewLeft = NSLayoutConstraint(item: orangeView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: redView,
                                                attribute: .right,
                                                multiplier: 1.0,
                                                constant: margin)
        let orangeViewTop = NSLayoutConstraint(item: orangeView,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: redView,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 0)
        let orangeViewWidth = NSLayoutConstraint(item: orangeView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: redView,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 0)
        let orangeViewHeight = NSLayoutConstraint(item: orangeView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: redView,
                                                  attribute: .height,
                                                  multiplier: 1.0,
                                                  constant: 0)
        
        view.addConstraints([orangeViewLeft, orangeViewTop, orangeViewWidth, orangeViewHeight])
    }
    
    func addYellowViewConstraint() {
        let yellowViewLeft = NSLayoutConstraint(item: yellowView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: orangeView,
                                                attribute: .right,
                                                multiplier: 1.0,
                                                constant: margin)
        let yellowViewTop = NSLayoutConstraint(item: yellowView,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: redView,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 0)
        let yellowViewWidth = NSLayoutConstraint(item: yellowView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: redView,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 0)
        let yellowViewHeight = NSLayoutConstraint(item: yellowView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: redView,
                                                  attribute: .height,
                                                  multiplier: 1.0,
                                                  constant: 0)
        
        view.addConstraints([yellowViewLeft, yellowViewTop, yellowViewWidth, yellowViewHeight])
    }
    
    func addGroupConstraint() {
        let views = ["redView": redView, "orangeView": orangeView, "yellowView": yellowView]
        
        let yellowViewCenterX = NSLayoutConstraint(item: yellowView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        view.addConstraint(yellowViewCenterX)
        
        let redViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(margin)-[redView]-\(margin)-|", options: .alignAllCenterX, metrics: nil, views: views)
        view.addConstraints(redViewHorizontal)
        
        let orangeViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(margin)-[orangeView]-\(margin)-|", options: .alignAllCenterX, metrics: nil, views: views)
        view.addConstraints(orangeViewHorizontal)
        
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(margin)-[redView]-\(margin)-[orangeView]-\(margin)-[yellowView]-\(margin)-|", options: .alignAllCenterX, metrics: nil, views: views)
        view.addConstraints(vertical)
    }
    
    // MARK: - Interesting Animation
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        orangeView.removeFromSuperview()
        UIView.animate(withDuration: 0.5) {
            let yellowViewLeft = NSLayoutConstraint(item: self.yellowView,
                                                    attribute: .left,
                                                    relatedBy: .equal,
                                                    toItem: self.redView,
                                                    attribute: .right,
                                                    multiplier: 1.0,
                                                    constant: self.margin)
            self.view.addConstraint(yellowViewLeft)
            self.view.layoutIfNeeded()
        }
    }

}

