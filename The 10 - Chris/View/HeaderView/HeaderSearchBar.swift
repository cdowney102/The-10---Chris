//
//  HeaderSearchBar.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class HeaderSearchBar: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bottomLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.searchLabel
        return view
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        clearButtonMode = .whileEditing
        textAlignment = .left
        textColor = UIColor.searchLabel
        font = UIFont.regularText
        self.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        attributedPlaceholder = NSAttributedString(string: "MOVIES", attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholder, NSAttributedString.Key.font: UIFont.searchBarPlaceholder!])
        addBottomBorder()
    }
    
    weak var updateTimer: Timer?
    @objc func textChanged() {
        self.updateTimer?.invalidate()
        
        self.updateTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            (self.viewController as? HomeController)?.search(for: self.text)
        })
    }
    
}

// MARK - styling for just having a single line on bottom of text field
extension HeaderSearchBar {
    private func addBottomBorder() {
        addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            bottomLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
