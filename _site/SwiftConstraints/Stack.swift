//
//  Stack.swift
//  SwiftConstraints
//
//  Created by Seimith on 2/5/17.
//  Copyright © 2017 Seimith. All rights reserved.
//

import UIKit

class Stack {
    static func setupConstraints (views: [UIView], axis: UILayoutConstraintAxis, distribution: UIStackViewDistribution, alignment: UIStackViewAlignment, spacing: Int?=0, selfView: UIViewController, parentContainer: UIView?=nil) {
        
        var parentViewController: UIView! {
            return selfView.view
        }
        
        var pContainer = UIView()
        if (parentContainer != nil) {
            pContainer = parentContainer!
        } else {
            pContainer = parentViewController
        }
        
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.spacing = CGFloat(spacing!)
        
        for view in views {
            var height = Int()
            var width = Int()
            
            if (view.frame.size.height != 0.0 && view.frame.size.width != 0.0) {
                height = Int(view.frame.size.height)
                width = Int(view.frame.size.width)
            } else {
                height = 100
                width = 100
            }
            stackView.addArrangedSubview(view)
            view.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
            view.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        parentViewController.addSubview(stackView)
        
        // Constraints FOR NESTING LOCATION
        let l = stackView.leadingAnchor.constraint(equalTo: pContainer.leadingAnchor)
        let t = stackView.topAnchor.constraint(equalTo: pContainer.topAnchor)
        parentViewController.addConstraints([l, t])
    }
}
