//
//  DetailsControlelr.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK - free up selected movie
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.clearSelectedMovie()
    }

    

}
