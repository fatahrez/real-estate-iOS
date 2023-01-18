//
//  PropertyDetailManager.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 18/01/2023.
//

import Foundation

protocol PropertyDetailManagerDelegate {
    func didGetPropertyDetails(_ propertyDetailManager: PropertyDetailManager, _ property: PropertyModel)
    func didFailWith(error: Error)
}

struct PropertyDetailManager {
    let propertyDetailsEndpoint = K.baseURL + "properties/details/"
    
    var delegate: PropertyDetailManagerDelegate?
    
    func fetchPropertyDetails(with slug: String){
        let urlString = propertyDetailsEndpoint + slug
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWith(error: error!)
                }
                if let safeData = data {
                    if let property = self.parseJson(safeData) {
                        self.delegate?.didGetPropertyDetails(self, property)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ propertyData: Data) -> PropertyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PropertyModel.self, from: propertyData)

            return decodedData
        } catch {
            delegate?.didFailWith(error: error)
            return nil
        }
    }
}
