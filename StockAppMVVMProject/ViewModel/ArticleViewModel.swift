//
//  ArticleViewModel.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 26/02/21.
//

import Foundation

struct ArticleViewModel {
    
    let article: Article
    
    var imageURL:String {
        return article.imageURL
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
    
    var title: String {
        return article.imageURL
    }
}
