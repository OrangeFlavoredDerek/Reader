//
//  RoundButton.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import SwiftUI

struct RoundButton: View {
    let text: String
    let image: String
    
    var body: some View {
        HStack {
            Text(text)
            Image(systemName: image)
        }
        .font(.headline)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(text: "text", image: "image")
    }
}
