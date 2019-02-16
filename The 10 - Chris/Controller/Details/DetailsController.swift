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

        print(DataManager.shared.selectedMovie?.title)
        print(DataManager.shared.selectedMovie?.productionCompanies)
        print(DataManager.shared.selectedMovie?.directors)
        print(DataManager.shared.selectedMovie?.cast?[0].name)

    }
    

    

}
