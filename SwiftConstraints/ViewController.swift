//
//  ViewController.swift
//  SwiftConstraints
//
//  Created by Seimith on 2/5/17.
//  Copyright © 2017 Seimith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myCyanUIView = UIView()
        myCyanUIView.backgroundColor = UIColor.cyan
        self.view.addSubview(myCyanUIView)
        // Add layout constraint after adding my subview
        Layout.setupConstraint(forView: myCyanUIView,
                               top: 50,
                               bottom: -50,
                               left: 50,
                               right: -50,
                               //height: 0, // I don't want a fixed height, so I can give this an arbitrary number or remove this paramater
                               fixedHeight: false, // <===
                               //width: 0, // I don't want a fixed width, so I can give this an arbitrary number or remove this paramater
                               fixedWidth: false, // <===
                               selfView: self)
        
        let myRedUIView = UIView()
        myRedUIView.backgroundColor = UIColor.red
        self.view.addSubview(myRedUIView)
        // Add layout constraint after adding my subview
        Layout.setupConstraint(forView: myRedUIView,
                               top: 75,
                               bottom: -75,
                               left: 75,
                               right: nil, // <=== I want my UIView to be fixed on the left side
                               //height: 0,
                               fixedHeight: false, // <=== With no fixed height
                               width: 100, // <=== With a fixed width
                               fixedWidth: true, // <=== So, I set this to true
                               selfView: self)
        
        
        let myGreenUIView = UIView()
        myGreenUIView.backgroundColor = UIColor.green
        self.view.addSubview(myGreenUIView)
        // Add layout constraint after adding my subview
        Layout.setupConstraint(forView: myGreenUIView,
                               top: nil, // <===
                               bottom: -100,
                               left: 100,
                               right: -100,
                               height: 100, // <===
                               fixedHeight: true,
                               width: 100,
                               fixedWidth: true,
                               selfView: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

