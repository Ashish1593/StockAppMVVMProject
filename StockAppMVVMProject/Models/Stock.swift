//
//  Stock.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 25/02/21.
//

import Foundation

struct Stock:Codable {
    let symbol:String
    let description: String
    let price: Double
    let change: String
}


