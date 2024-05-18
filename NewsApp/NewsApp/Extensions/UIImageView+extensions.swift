//
//  UIImageView+extension.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 17/05/24.
//

import UIKit

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.image = UIImage(named: "newspaper_background.jpg")
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
