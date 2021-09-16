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
}
