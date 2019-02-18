//
//  DetailsView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// detailed movie info view -- tableview for actors and directors

import UIKit

class DetailsView: UIView {
    
    var xBtnAction: (() -> Void)?

    let synopsisView = SynopsisView(frame: .zero)
    
    var movie: Movie!
    var profilePaths: [CastMember]!
    
    // track index of array to grab
    var endIndex = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
   
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backdrop: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "no poster")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.detailsRed
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DirectorCell.self, forCellReuseIdentifier: DirectorCell.identifier)
        tableView.register(CastCell.self, forCellReuseIdentifier: CastCell.identifier)
        tableView.register(CastSectionHeader.self, forHeaderFooterViewReuseIdentifier: CastSectionHeader.identifier)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    var xButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "xwhite"), for: .normal)
        button.addTarget(self, action: #selector(xTapped), for: .touchUpInside)
        return button
    }()
        
    private func configure() {
        backgroundColor = UIColor.detailsRed
        movie = DataManager.shared.selectedMovie
        profilePaths = movie.cast
        setupBackdrop()
        setupButton()
        setupSynopsis()
        setupTableView()
    }
}

// MARK - autolayout code
extension DetailsView {
    private func setupButton() {
        addSubview(xButton)
        NSLayoutConstraint.activate([
            xButton.widthAnchor.constraint(equalToConstant: 20),
            xButton.heightAnchor.constraint(equalToConstant: 20),
            xButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            xButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22)
            ])
    }
    
    private func setupBackdrop() {
        addSubview(backdrop)
        NSLayoutConstraint.activate([
            backdrop.topAnchor.constraint(equalTo: self.topAnchor),
            backdrop.leftAnchor.constraint(equalTo: self.leftAnchor),
            backdrop.rightAnchor.constraint(equalTo: self.rightAnchor),
            backdrop.heightAnchor.constraint(equalToConstant: self.frame.height / 3)
            ])
    }
    
    private func setupSynopsis() {
        addSubview(synopsisView)
        bringSubviewToFront(synopsisView)
        synopsisView.layer.zPosition = 99
        let width = self.frame.width * 0.9
        NSLayoutConstraint.activate([
            synopsisView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -65),
            synopsisView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            synopsisView.heightAnchor.constraint(equalToConstant: width - 50),
            synopsisView.widthAnchor.constraint(equalToConstant: width),
            ])
    }
    
    private func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: synopsisView.bottomAnchor, constant: 15),
            tableView.leftAnchor.constraint(equalTo: synopsisView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: synopsisView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}

// MARK - set details data w selected movie
extension DetailsView {
    func setViewData(for movie: Movie) {
        synopsisView.setViewData(for: movie)
    }
}

// MARK - tableview delegate methods
extension DetailsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CastSectionHeader.identifier) as? CastSectionHeader else {
                return nil
            }
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // director/ company cell
            let cell = tableView.dequeueReusableCell(withIdentifier: DirectorCell.identifier, for: indexPath) as! DirectorCell
            cell.setCellData(for: movie)
            return cell
            
        } else {
            // cast cell
            let cell = tableView.dequeueReusableCell(withIdentifier: CastCell.identifier, for: indexPath) as! CastCell
            
            if let profiles = self.profilePaths {
                let startIndex = indexPath.row * 3
                let endIndex = min(profiles.count, startIndex + 3)
                let castArray = Array(profiles[startIndex..<endIndex])

    //            let castArray = Array(profilePaths?[startIndex...endIndex] ?? [])
    //            print(castArray)
                cell.setupCell(with: castArray)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            let castCount = DataManager.shared.selectedMovie?.cast?.count ?? 0
            return castCount / 3 + (castCount % 3 > 0 ? 1 : 0)
        }
    }
}

// MARK - xbutton close action
extension DetailsView {
    @objc private func xTapped() {
        xBtnAction?()
    }
}
