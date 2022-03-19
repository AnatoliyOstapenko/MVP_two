//
//  UserModel.swift
//  MVP_two
//
//  Created by AnatoliiOstapenko on 19.03.2022.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let latitude: String
    let longitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct Company: Decodable {
    let name: String
    let phrase: String
    let bs: String
    
    enum CodingKeys: String, CodingKey {
        case name, bs
        case phrase = "catchPhrase"
    }
}



