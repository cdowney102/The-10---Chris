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
        
        while responder != nil {
            if let controller = responder as? UIViewController { return controller }
            responder = responder!.next
        }
        return nil
    }
    
}
