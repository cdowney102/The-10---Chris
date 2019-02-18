//
//  ViewController.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.

import UIKit
// contains page view controller
class HomeController: UIViewController {
    var pageController: UIPageViewController!
    
    var nowPlayingController: MovieCollectionViewController!
    var comingSoonController: MovieCollectionViewController!
    var header: Header!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkNetworkConnection()
        setupViews()
        setupPaging()
        setupHeaderBtnActions()
        fetchData { (error) in
            if let error = error {
                self.showAlert(title: APIError.title, msg: error.localizedDescription)
            }
        }
    }

    func search(for searchString: String?) {
        nowPlayingController.search(for: searchString)
        comingSoonController.search(for: searchString)
    }
}

// MARK - page controller delegate methods
extension HomeController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == nowPlayingController { return comingSoonController }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == comingSoonController { return nowPlayingController }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //prevent half-swipes/ cancelled swipes
        if !completed || !finished { return }
        let prev = previousViewControllers[0]
        if prev == nowPlayingController {
            header.highlightComingSoon()
        } else {
            header.highlightNowPlaying()
        }
    }
}

// MARK - setup views and paging
extension HomeController {
    private func setupViews() {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Home Background"))
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        header = Header(frame: .zero)
        
        view.addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 150)
            ])
    }
    
    private func setupPaging() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.willMove(toParent: self)
        addChild(self.pageController)
        pageController.dataSource = self
        pageController.delegate = self
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
    }
}

// MARK - header button actions
extension HomeController {
    private func setupHeaderBtnActions() {
        header.comingSoonAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.toComingSoon()
        }
        header.nowPlayingAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.toNowPlaying()
        }
    }
}

// MARK - segue stuff
extension HomeController {
    private func toComingSoon() {
        pageController.setViewControllers([self.comingSoonController], direction: .forward, animated: false) { (_) in
            self.header.highlightComingSoon()
        }
    }
    
    private func toNowPlaying() {
        pageController.setViewControllers([self.nowPlayingController], direction: .forward, animated: false) { (_) in
            self.header.highlightNowPlaying()
        }
    }
}

// MARK - check network connection
extension HomeController {
    private func checkNetworkConnection() {
        if !ConnectionManager.shared.isReachable(reachability: ConnectionManager.reachable!) {
            self.showAlert(title: NetworkConnectionError.title, msg: NetworkConnectionError.networkConnection.rawValue)
        }
    }
}

// MARK - network calls
extension HomeController {
    private func fetchData(completionHandler: @escaping (Error?) -> ()) {
        APIManager.shared.fetchList(ListType.genres) { (list: GenreList?, error: Error?) in
            if let error = error {
                completionHandler(error)
                return
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        GenreList.shared = list.genres
                    }
                }
            }
        }
        
        APIManager.shared.fetchList(ListType.nowPlaying) { (list: MovieList?, error: Error?) in
            if let error = error {
                completionHandler(error)
                return
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
                        self.nowPlayingController.dataSource.movies = reducedList
                    }
                }
            }
        }
        
        APIManager.shared.fetchList(ListType.upcoming) { (list: MovieList?, error: Error?) in
            if let error = error {
                completionHandler(error)
                return
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
                        self.comingSoonController.dataSource.movies = reducedList
                    }
                }
            }
        }
    }
}
