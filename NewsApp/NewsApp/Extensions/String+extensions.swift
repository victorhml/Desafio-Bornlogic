//
//  String+extensions.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 17/05/24.
//

import UIKit

extension String {
    func changeDateFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let resultString = dateFormatter.string(from: date!)
        return resultString
    }
}
