//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Yuri Kasperovich on 6/10/16.
//  Copyright © 2016 Yuri Kasperovich. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: FoodTracker Tests
    
    func testMealInitialization() {
        // Success case
        let potentialItem = Meal(name: "Soup", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure case
        let noName = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Soup", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
}
