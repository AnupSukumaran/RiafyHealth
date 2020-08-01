//
//  UIButtonCustom.swift
//  EV Quiz
//
//  Created by Anup Sukumaran on 03/10/18.
//  Copyright © 2018 WIS. All rights reserved.
//

import UIKit

@IBDesignable
public class UIButtonCustom: UIButton {
    
    @IBInspectable public var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornurRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornurRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0.0 {
        
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
   
        }
    }
 
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        
        didSet {
            layer.shadowRadius = shadowRadius
            
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize = CGSize.zero{
        
        didSet {
            layer.shadowOffset = shadowOffset
            
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
            
        }
    }
    
    @IBInspectable public var maskToBounds: Bool = false {
        
        didSet {
            layer.masksToBounds = maskToBounds
            
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 1.0
    }
    
    func configure() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornurRadius
    }
}
