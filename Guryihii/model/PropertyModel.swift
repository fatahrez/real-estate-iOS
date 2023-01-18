//
//  PropertiesModel.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 16/01/2023.
//

import Foundation

struct PropertyModel: Codable {
    let title: String
    let cover_photo: String
    let city: String
    let bedrooms: Int
    let street_address: String
    let property_type: String
    let price: String
}
