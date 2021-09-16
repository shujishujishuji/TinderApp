//
//  UIButton-Extension.swift
//  MatchingApp
//
//  Created by taniguchi shuji on 2021/09/16.
//

import UIKit

extension UIButton {
    
    func createCardButton() -> UIButton {
        setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        tintColor = .white
        imageView?.contentMode = .scaleAspectFit
        return self
    }
    
    func createAboutAccountButton(text: String) -> UIButton {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14)
        return self
    }
}
