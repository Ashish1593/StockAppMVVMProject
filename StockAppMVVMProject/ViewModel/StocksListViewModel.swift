//
//  StocksListViewModel.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 25/02/21.
//

import Foundation
import SwiftUI

class StocksListViewModel : ObservableObject {
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 650)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    
    func load() {
        fetchStocks()
        fetchNews()
    }
    
    private func fetchNews() {
        WebService().getArticles { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.articles = news.map(ArticleViewModel.init)
                }
            }
        }
    }
    
    private func fetchStocks() {
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
