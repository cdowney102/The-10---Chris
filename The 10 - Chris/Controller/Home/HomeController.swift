//
//  ViewController.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit
// contains page view controller
class HomeController: UIViewController {
    var pageController: UIPageViewController!
    
    var nowPlayingController: MovieCollectionViewController!
    var upcomingController: MovieCollectionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let home = HomeView(frame: view.frame)
        view.addSubview(home)
        view.bringSubviewToFront(home)

        // setup up paging
        
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController.willMove(toParent: self)
        self.addChild(self.pageController)
        self.pageController.dataSource = self
        self.pageController.view.frame = CGRect(x: 0, y: 150, width: 0, height: 0)
        self.pageController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.pageController.view)
        self.pageController.didMove(toParent: self)
        
//        APIManager.shared.fetch(ListType.upcoming) { (list: MovieList?, error: Error?) in
//            if let error = error {
//                print(error)
//            }
//        }
    }
}

extension HomeController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == self.nowPlayingController { return self.upcomingController }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == self.upcomingController { return self.nowPlayingController }
        return nil
    }

}
