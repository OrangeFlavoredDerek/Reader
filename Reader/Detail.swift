//
//  Detail.swift
//  Reader
//
//  Created by 陳峻琦 on 22/1/2022.
//

import SwiftUI

struct Detail: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.body)
            }
            .padding()
        }
        .navigationTitle(article.title)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(article: Article(id: 1, title: "Title", body: "Body"))
    }
}
