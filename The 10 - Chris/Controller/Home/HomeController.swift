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
        
        // setup up paging
        
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController.willMove(toParent: self)
        self.addChild(self.pageController)
        self.pageController.dataSource = self
        self.view.addSubview(self.pageController.view)
        
        self.pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            pageController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pageController.view.topAnchor.constraint(equalTo: home.header.bottomAnchor)
            ])
        
        
        self.pageController.didMove(toParent: self)
        
        self.upcomingController = MovieCollectionViewController(dataSource:  ComingSoonDataSource())
        self.nowPlayingController = MovieCollectionViewController(dataSource: NowPlayingDataSource())
        
        self.pageController.setViewControllers([self.nowPlayingController], direction: .forward, animated: false, completion: nil)
        APIManager.shared.fetch(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        DataManager.shared.setComingSoonList(with: list.results)
                        print("got data")
                        self.upcomingController.reloadData()
                        self.nowPlayingController.reloadData()
                    }
                }
            }
        }
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
