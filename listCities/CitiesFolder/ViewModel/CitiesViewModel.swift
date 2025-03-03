//
//  CitiesViewModel.swift
//  listCities
//
//  Created by priyali.srivastava on 26/02/25.
//

import Foundation

class CitiesViewModel: ObservableObject {
    @Published var citiesByState: [String: [CitiesModel]] = [:]
    @Published var reversed = false
    private let cityService: CityServiceProtocol
    
    init(cityService: CityServiceProtocol = CityService()) {
        self.cityService = cityService
        loadCities()
    }
    func loadCities() {
        if let cachedCities = CacheManager.shared.loadFromCache() {
            updateCities(cities: cachedCities)
        }
        else if let cities = cityService.fetchCities() {
            CacheManager.shared.saveToCache(cities: cities)
            updateCities(cities: cities)
        }
    }
    func updateCities(cities: [CitiesModel]){
        let grouped = Dictionary(grouping: cities, by: { $0.admin_name})
        DispatchQueue.main.async {
            self.citiesByState = grouped
        }
    }
    func refreshData() {
        if let cities = cityService.fetchCities() {
            CacheManager.shared.saveToCache(cities: cities)
            updateCities(cities: cities)
        }
    }
    func toggleReverseOrder() {
        reversed.toggle()
    }
}

