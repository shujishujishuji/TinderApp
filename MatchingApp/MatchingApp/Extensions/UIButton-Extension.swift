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
    
    func createProfileTopButton(title: String) -> UIButton {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15)
        return self
    }
    
    func createProfileEditButton() -> UIButton {
        let image = UIImage(systemName: "square.and.pencil")
        self.setImage(image, for: .normal)
        
        self.layer.cornerRadius = 30
        self.tintColor = .darkGray
        self.imageView?.contentMode = .scaleToFill
        self.backgroundColor = .white
        return self
    }
}
