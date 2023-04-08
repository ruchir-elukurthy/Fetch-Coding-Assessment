//
//  Fetch_TakeHomeTests.swift
//  Fetch-TakeHomeTests
//
//  Created by Ruchir on 4/5/23.
//

import XCTest
@testable import Fetch_TakeHome

class MealViewModelTests: XCTestCase {
    var mealViewModel: MealViewModel!
    var mockAPIService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        mealViewModel = MealViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        mockAPIService = nil
        mealViewModel = nil
        super.tearDown()
    }
    
    func testFetchData() {
        let expectation = self.expectation(description: "Fetch meals")
        
        mealViewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssert(self.mealViewModel.meals.count == 2)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
