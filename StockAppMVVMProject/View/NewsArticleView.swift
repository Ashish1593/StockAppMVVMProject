//
//  NewsArticleView.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 26/02/21.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [ArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    
                    Text("From News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                
                Spacer()
            }.padding().contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged(self.onDragBegin)
                        .onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial",size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .font(.custom("Arial", size: 22))
                                    .foregroundColor(Color.white)
                            }
                            
                            Spacer()
                            
                            URLImage(url: URL(string: article.imageURL)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
            }
            
            
            
            
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
        
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", publication: "The WallStreet Journal", imageURL: "https://prod.static9.net.au/_/media/2019/09/02/10/36/nine_news_melbourne_1600x900_fullstory_nightly6pm.jpg")
        
        return NewsArticleView(newsArticles: [ArticleViewModel(article: article)], onDragBegin: { _ in }, onDragEnd: { _ in })
    }
}
