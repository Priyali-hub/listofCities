//
//  CityService.swift
//  listCities
//
//  Created by priyali.srivastava on 27/02/25.
//

import Foundation

protocol CityServiceProtocol {
    func fetchCities() -> [CitiesModel]?
}
class CityService: CityServiceProtocol {
    func fetchCities() -> [CitiesModel]? {
        if let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") ,
            let data = try? Data(contentsOf: url),
           let cities = try? JSONDecoder().decode([CitiesModel].self, from: data) {
            return cities
        }
            return nil
        
    }
    
}
