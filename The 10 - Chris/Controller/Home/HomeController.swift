//
//  ViewController.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var mainView: HomeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.fetch(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            }
        }
    }
}

extension HomeController {

    

}
