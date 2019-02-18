//
//  DetailsControlelr.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
 
    var movie: Movie!
    var detailsView: DetailsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupxBtnActions()
    }

    // MARK - free up selected movie
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.clearSelectedMovie()
    }
    
    private func configure() {
        
        if let movie = DataManager.shared.selectedMovie {
            self.movie = movie
        }
        
        detailsView = DetailsView(frame: view.bounds)
        view.addSubview(detailsView)
        
        detailsView.backdrop.downloadImage(imageType: ImageType.backdrop, path: movie.backdropPath ?? "")
        detailsView.setViewData(for: movie)
    }
}

// MARK - close - x button action
extension DetailsController {
    private func setupxBtnActions() {
         detailsView.xBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.pop()
        }
    }
}

extension DetailsController {
    private func pop() {
        navigationController?.popViewController(animated: false)
    }
}
