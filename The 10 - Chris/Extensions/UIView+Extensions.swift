//
//  UIView+Extensions.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/15/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

// MARK - quick way to find out a views view controller - alternative to delegates/protocol
extension UIView {
    public var viewController: UIViewController? {
        var responder = self.next
        // loop through hierarchy to find VC
        while responder != nil {
            if let controller = responder as? UIViewController { return controller }
            responder = responder!.next
        }
        return nil
    }
    
    func addShadow(cornerRadius: CGFloat?) {
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 8.0
        
        let shadowRect: CGRect = self.bounds.insetBy(dx: 1, dy: 4)
        self.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
//        self.layer.shadowColor = UIColor.viewShadowColor
//        self.layer.shadowOffset = CGSize(width: 2, height: 8)
//        self.layer.shadowOpacity = 1
//        self.layer.masksToBounds = false
        if let radius = cornerRadius { self.layer.cornerRadius = radius }
    }
}
