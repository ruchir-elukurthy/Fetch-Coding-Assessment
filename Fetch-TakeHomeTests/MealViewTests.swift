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
    var mockAPIService: MealAPIServiceProtocol!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockMealAPIService()
        mealViewModel = MealViewModel(apiService: mockAPIService)
    }
    
    func testFetchData() {
        let expectation = self.expectation(description: "Fetch meals and count them")
        //Given data form mock
        
        //When API fetch is called
        mealViewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //Then
            XCTAssertEqual(self.mealViewModel.meals.count, 4)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testSortedData() {
        let expectation = self.expectation(description: "Fetch meals and sort them")
        //Given data form mock
        
        //When API fetch is called
        mealViewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //Then
            XCTAssertEqual(self.mealViewModel.meals[0].strMeal, Optional("Apple Frangipan Tart"))
            XCTAssertEqual(self.mealViewModel.meals[1].strMeal, Optional("Carrot Cake"))
            XCTAssertEqual(self.mealViewModel.meals[2].strMeal, Optional("Pumpkin Pie"))
            XCTAssertEqual(self.mealViewModel.meals[3].strMeal, Optional("Timbits"))
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
