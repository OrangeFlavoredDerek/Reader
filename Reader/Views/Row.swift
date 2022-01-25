//
//  Row.swift
//  Reader
//
//  Created by 陳峻琦 on 22/1/2022.
//

import SwiftUI

struct Row: View {
    @EnvironmentObject var motion: MotionManager
    var article: Article
    
    var body: some View {
        VStack {
            Text(article.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 3)
                //.scaleEffect(max(1, 0.7 + -motion.y*0.45))
            Text(article.body)
                .lineLimit(3)
                //.scaleEffect(max(1, 0.7 + -motion.y*0.37))
        }
        .padding(.vertical)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(article: Article(id: 1, title: "标题", body: "正文"))
    }
}
