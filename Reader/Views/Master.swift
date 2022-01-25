//
//  ContentView.swift
//  Reader
//
//  Created by 陳峻琦 on 21/1/2022.
//

import SwiftUI

struct Master: View {
    @StateObject var data: TabReadingData = TabReadingData()
    @AppStorage("darkMode") var darkMode: Bool = false
    
    var body: some View {
        NavigationView {
            List(data.articles) { article in
                VStack(alignment: .leading) {
                    NavigationLink(destination: Detail(article: article)) {
                        Row(article: article)
                    }
                }
            }
            .navigationTitle("编辑推荐")
            .toolbar {
                Setting(darkMode: $darkMode)
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Master()
    }
}
