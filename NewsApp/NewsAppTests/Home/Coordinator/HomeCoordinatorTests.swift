//
//  HomeCoordinatorTests.swift
//  NewsAppTests
//
//  Created by Victor Hugo Martins Lisboa on 16/05/24.
//

import XCTest
@testable import NewsApp

final class HomeCoordinatorTests: XCTestCase {

    var navigationMock = UINavigationControllerMock()
    
    var coord: HomeCoordinator?
    
    func test_start_coordinator() {
        coord = HomeCoordinator(navigationController: navigationMock)
        coord?.start()
        XCTAssertNotNil(navigationMock.pushedViewController)
    }
    
    func test_go_to_details() {
        coord = HomeCoordinator(navigationController: self.navigationMock)
        coord?.goToDetails()
        XCTAssertNotNil(navigationMock.pushedViewController)
    }

}

class UINavigationControllerMock: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
