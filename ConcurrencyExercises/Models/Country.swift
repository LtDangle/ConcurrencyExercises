//
//  Country.swift
//  ConcurrencyExercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct Country: Codable {
    let alpha2Code: String
    let flag: String
    let name: String
    let capital: String
    let population: Int
    let currencies: [CurrenciesWrapper]
}

struct CurrenciesWrapper: Codable {
    let code: String
}
