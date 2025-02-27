//
//  CacheManager.swift
//  listCities
//
//  Created by priyali.srivastava on 27/02/25.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    private let cacheKey = "cachedKey"
    
    func saveToCache(cities: [CitiesModel]) {
        if let encoded = try? JSONEncoder().encode(cities){
            UserDefaults.standard.set(encoded , forKey: cacheKey)
        }
    }
    
    func loadFromCache() -> [CitiesModel]? {
        if let savedData = UserDefaults.standard.data(forKey: cacheKey) ,
           let decodedCities = try? JSONDecoder().decode([CitiesModel].self, from: savedData) {
            return decodedCities
        }
        return nil
    }
}
