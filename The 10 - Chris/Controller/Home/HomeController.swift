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
        
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Home Background"))
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let header = Header(frame: .zero)
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        // setup up paging
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.willMove(toParent: self)
        addChild(self.pageController)
        pageController.dataSource = self
        view.addSubview(self.pageController.view)
        
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            pageController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pageController.view.topAnchor.constraint(equalTo: header.bottomAnchor)
            ])
        
        
        pageController.didMove(toParent: self)
        
        upcomingController = MovieCollectionViewController(dataSource:  MoviesDataSource())
        nowPlayingController = MovieCollectionViewController(dataSource: MoviesDataSource())
        
        pageController.setViewControllers([self.nowPlayingController], direction: .forward, animated: false, completion: nil)
        
        APIManager.shared.fetch(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        DataManager.shared.setNowPlayingList(with: list.results)
                        print("got data")
                        self.nowPlayingController.dataSource.movies = list.results
                    }
                }
            }
        }
        #warning("gracefully handle delay while images load")
        APIManager.shared.fetch(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        DataManager.shared.setComingSoonList(with: list.results)
                        self.upcomingController.dataSource.movies = list.results
                        print("got data")
                    }
                }
            }
        }
        
    }

    func search(for searchString: String?) {
        nowPlayingController.search(for: searchString)
        upcomingController.search(for: searchString)
    }
    
}

extension HomeController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == nowPlayingController { return upcomingController }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == upcomingController { return nowPlayingController }
        return nil
    }

}
