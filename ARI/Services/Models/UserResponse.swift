//
//  UserResponse.swift
//  ARI
//
//  Created by Maxim Spiridonov on 19/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation


struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
    let bdate: String?
    let sex: Int?
    let firstName: String
    let lastName: String
    let city: City?
}

struct City: Decodable {
    let id: Int?
    let title: String?
}
