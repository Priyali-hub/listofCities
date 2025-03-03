//
//  listCitiesTests.swift
//  listCitiesTests
//
//  Created by priyali.srivastava on 26/02/25.
//

import XCTest
@testable import listCities

final class listCitiesTests: XCTestCase {
    var viewModel: CitiesViewModel!
    var mockService: MockCityService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       // super.setUpWithError()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
       let mockService = MockCityService()
       let viewModel = CitiesViewModel(cityService: mockService)
        
        let exp = XCTestExpectation(description: "cities")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertFalse(viewModel.citiesByState.isEmpty, "Cities Should be loaded")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2.0)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


