//
//  UIImageView+Extensions.swift
//  Crypto Challenge
//
//  Created by Victor Morei on 17.01.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        let options: KingfisherOptionsInfo = [
            .scaleFactor(UIScreen.main.scale),
            .downloadPriority(1),
            .transition(.fade(0.2)),
            .cacheOriginalImage
        ]
        kf.setImage(with: url, placeholder: nil, options: options, completionHandler: nil)
    }
}
