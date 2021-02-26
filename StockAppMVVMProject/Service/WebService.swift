//
//  WebService.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 25/02/21.
//

import Foundation

class WebService {
    func getStocks(completion: @escaping (([Stock]?)-> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil): completion(stocks)
        }.resume()
    }
}
