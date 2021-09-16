//
//  ProfileLabel.swift
//  MatchingApp
//
//  Created by taniguchi shuji on 2021/09/16.
//

import UIKit

class ProfileLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        self.font = .systemFont(ofSize: 45, weight: .bold)
        self.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
