//
//  Layout.swift
//  SwiftConstraints
//
//  Created by Seimith on 2/5/17.
//  Copyright © 2017 Seimith. All rights reserved.
//

import UIKit

class Layout {
    static func setupConstraint (forView: UIView, top: Int?=nil, bottom: Int?=nil, left: Int?=nil, right: Int?=nil, height: Int?=nil, fixedHeight: Bool = false, width: Int?=nil, fixedWidth: Bool = false, selfView: UIViewController) {
        
        var parentViewController: UIView? {
            return selfView.view
        }
        
        forView.translatesAutoresizingMaskIntoConstraints = false //USING AUTOLAYOUT NOT FRAMES
        
        var l = NSLayoutConstraint() // LEFT
        var r = NSLayoutConstraint() // RIGHT
        var t = NSLayoutConstraint() // TOP
        var b = NSLayoutConstraint() // BOTTOM
        
        if (left != nil) {
            l = forView.leadingAnchor.constraint(equalTo: (parentViewController?.leadingAnchor)!, constant: CGFloat(left!)) // LEFT
        }
        
        if (right != nil) {
            r = forView.trailingAnchor.constraint(equalTo: (parentViewController?.trailingAnchor)!, constant: CGFloat(right!)) // RIGHT
        }
        
        if (top != nil) {
            t = forView.topAnchor.constraint(equalTo: (parentViewController?.topAnchor)!, constant: CGFloat(top!)) // TOP
        }
        
        if (bottom != nil) {
            b = forView.bottomAnchor.constraint(equalTo: (parentViewController?.bottomAnchor)!, constant: CGFloat(bottom!)) // BOTTOM
        }
        
        if (fixedHeight) {
            // FIXED HEIGHT
            let h = forView.heightAnchor.constraint(equalToConstant: CGFloat(height!))
            parentViewController?.addConstraints([t, b, l, r, h])
        } else if (fixedWidth) {
            // FIXED WIDTH
            let w = forView.widthAnchor.constraint(equalToConstant: CGFloat(width!))
            parentViewController?.addConstraints([t, b, l, r, w])
        } else if (fixedHeight == false && fixedWidth == false) {
            // VARIABLE HEIGHT & WIDTH
            parentViewController?.addConstraints([t, b, l, r])
        }
    }
}
