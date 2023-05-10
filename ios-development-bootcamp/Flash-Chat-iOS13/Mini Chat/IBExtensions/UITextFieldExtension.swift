//
//  UITextFieldExtension.swift
//  Flash Chat iOS13
//
//  Created by Nico Niebergall on 11.07.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//
import UIKit

// Extends UIView by adding border color, width and radius options.
extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
