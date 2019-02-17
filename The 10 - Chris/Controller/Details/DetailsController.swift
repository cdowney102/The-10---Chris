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

        let movie = DataManager.shared.selectedMovie!
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    // MARK - free up selected movie
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.clearSelectedMovie()
    }
}
