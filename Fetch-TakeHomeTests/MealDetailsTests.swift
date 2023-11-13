//
//  MealDetailsTests.swift
//  Fetch-TakeHomeTests
//
//  Created by Ruchir on 4/9/23.
//

import XCTest
@testable import Fetch_TakeHome

class MealDetailsViewModelTests: XCTestCase {
    
    var viewModel: MealDetailsViewModel!
    var mockService: MockMealDetailsAPIService!
    
    override func setUp() {
        super.setUp()
        mockService = MockMealDetailsAPIService()
        viewModel = MealDetailsViewModel(apiService: mockService)
    }
    
    func testFetchMealDetails() {
        let expectation = self.expectation(description: "Fetch meals for ID")
        // Given mealID
        let mealID = "52855"
        
        // When API fetch is called
        viewModel.fetchMealDetails(mealID: mealID)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //Then
            XCTAssertEqual(self.viewModel.mealDetails.count, 1)
            XCTAssertEqual(self.viewModel.mealDetails[0].id, "52855")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
