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
    var comingSoonController: MovieCollectionViewController!
    
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
        
        comingSoonController = MovieCollectionViewController(dataSource:  MoviesDataSource())
        nowPlayingController = MovieCollectionViewController(dataSource: MoviesDataSource())
        
        pageController.setViewControllers([self.nowPlayingController], direction: .forward, animated: false, completion: nil)
        
        APIManager.shared.fetchList(ListType.genres) { (list: GenreList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        print(list.genres.first?.name)
                        GenreList.shared = list.genres
                        // MARK - limit results to 10 per requirements
                        //                        DataManager.shared.setNowPlayingList(with: reducedList)
//                        print("got genre: \(list.results.first?.title ?? "--")")
//                        self.nowPlayingController.dataSource.movies = reducedList
                    }
                }
            }
        }
        
        APIManager.shared.fetchList(ListType.nowPlaying) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        print(list.results.first?.genres)
                        // MARK - limit results to 10 per requirements
                        var reducedList = [Movie]()
                        if list.results.count > 10 {
                            reducedList = Array(list.results[0..<10])
                        } else {
                            reducedList = list.results
                        }
//                        DataManager.shared.setNowPlayingList(with: reducedList)
                        print("got np: \(list.results.first?.title ?? "--")")
                        self.nowPlayingController.dataSource.movies = reducedList
                    }
                }
            }
        }

        APIManager.shared.fetchList(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        // MARK - limit results to 10 per requirements
                        var reducedList = [Movie]()
                        if list.results.count > 10 {
                            reducedList = Array(list.results[0..<10])
                        } else {
                            reducedList = list.results
                        }
//                        DataManager.shared.setComingSoonList(with: reducedList)
                        self.comingSoonController.dataSource.movies = reducedList
                        print("got upcoming: \(list.results.first?.title ?? "--")")
                        
                    }
                }
            }
        }
    }

    func search(for searchString: String?) {
        nowPlayingController.search(for: searchString)
        comingSoonController.search(for: searchString)
    }
}

extension HomeController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == nowPlayingController { return comingSoonController }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == comingSoonController { return nowPlayingController }
        return nil
    }

}
