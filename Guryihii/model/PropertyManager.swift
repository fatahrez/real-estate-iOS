//
//  PropertyManager.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 17/01/2023.
//

import Foundation

protocol PropertyManagerDelegate {
    func didUpdateProperties(_ propertiesManager: PropertyManager, _ property: [PropertyModel])
    func didFailWith(error: Error)
}

struct PropertyManager {
    let propertyEndpoint = K.baseURL + "properties/all/"
    
    var delegate: PropertyManagerDelegate?
    
    func fetchProperties() {
        if let url = URL(string: propertyEndpoint) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWith(error: error!)
                }
                if let safeData = data {
                    if let properties = self.parseJson(safeData) {
                        self.delegate?.didUpdateProperties(self, properties)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ propertyData: Data) -> [PropertyModel]? {
        let decorder = JSONDecoder()
        do {
            let decodedData = try decorder.decode([PropertyModel].self, from: propertyData)
            return decodedData
        } catch {
            delegate?.didFailWith(error: error)
                return nil
        }
    }
}
