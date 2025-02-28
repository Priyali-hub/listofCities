//
//  MockData.swift
//  listCitiesTests
//
//  Created by priyali.srivastava on 28/02/25.
//

import Foundation

@testable import listCities

class MockCityService: CityServiceProtocol {
    func fetchCities() -> [listCities.CitiesModel]? {
        return [CitiesModel(id: UUID(), city: "Tathra", lat: "-36.7317", lng: "149.9844", country: "Australia", iso2: "AU", admin_name: "New South Wales", capital: "", population: "1675", population_proper: "1527")]
    }
    
    
    
}
