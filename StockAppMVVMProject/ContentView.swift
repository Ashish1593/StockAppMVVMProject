//
//  ContentView.swift
//  StockAppMVVMProject
//
//  Created by Ashish Yadav on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
//        stockListVM.load()
    }
    
    @State private var searchText: String = ""
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial",size:32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
                
                SearchView(searchTerm: $searchText)
                    .offset(y: -350)
            }
            
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
