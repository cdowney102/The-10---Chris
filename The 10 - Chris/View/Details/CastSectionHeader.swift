//
//  CastSectionHeader.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// custom header for second section [ CAST ]

import UIKit

class CastSectionHeader: UITableViewHeaderFooterView {
    
    static let identifier = "CastHeaderID"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.synopsisLabel
        label.textColor = UIColor.detailsPageText
        label.text = "CAST"
        return label
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = .clear
        // workaround to set BG color
        backgroundView = UIView(frame: .zero)
        backgroundView?.backgroundColor = .clear
        addTitle()
    }
    
    private func addTitle() {
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10)
            ])
    }
}
