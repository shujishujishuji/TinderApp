//
//  ProfileImageView.swift
//  MatchingApp
//
//  Created by taniguchi shuji on 2021/09/16.
//

import UIKit

class ProfileImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        
        self.image = UIImage(named: "ol")
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 90
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
