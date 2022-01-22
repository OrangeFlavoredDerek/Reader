//
//  Data.swift
//  Reader
//
//  Created by 陳峻琦 on 21/1/2022.
//

import Foundation
import SwiftUI

//MARK: Model
struct Article: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}

//MARK: ViewModel
class Data: ObservableObject {
    @Published var articles: [Article] = [Article]()
    
    init() {
        let url = URL(string: "https://www.legolas.me/s/articles.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }
        .resume()
    }
}
