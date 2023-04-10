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
        //Given data form mock
        
        //When API fetch is called
        mealViewModel.fetchMeals()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //Then
            XCTAssertEqual(self.mealViewModel.meals.count, 2)
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
