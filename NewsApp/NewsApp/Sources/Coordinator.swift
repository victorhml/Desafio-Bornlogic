//
//  Coordinator.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

public protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
