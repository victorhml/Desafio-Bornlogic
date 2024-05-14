//
//  HomeCoordinator.swift
//  NewsApp
//
//  Created by Victor Hugo Martins Lisboa on 11/05/24.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var article: ArticleModel?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToDetails() {
        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.article = article
        coordinator.start()
    }
}
