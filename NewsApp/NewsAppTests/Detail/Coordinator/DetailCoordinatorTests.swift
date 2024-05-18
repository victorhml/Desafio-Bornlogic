//
//  DetailCoordinatorTests.swift
//  NewsAppTests
//
//  Created by Victor Hugo Martins Lisboa on 16/05/24.
//

import XCTest
@testable import NewsApp

final class DetailCoordinatorTests: XCTestCase {
    
    var navigationMock = UINavigationControllerMock()
    
    var coord: DetailCoordinator?
    
    func test_start_coordinator() {
        coord = DetailCoordinator(navigationController: navigationMock)
        coord?.start()
        XCTAssertNotNil(navigationMock.pushedViewController)
    }
}
