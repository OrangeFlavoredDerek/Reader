//
//  ReadingNote.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import SwiftUI
import BetterSafariView

struct ReadingNote: View {
    @State var presentingSafariView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Link(destination: URL(string: "https://apple.com.cn")!) {
                        RoundButton(text: "在Safari中打开", image: "safari")
                    }
                    
                    Button {
                        presentingSafariView = true
                    } label: {
                        RoundButton(text: "在App中打开", image: "arrow.up.forward.app")
                    }
                    .safariView(isPresented: $presentingSafariView) {
                        SafariView (url: URL(string: "https://apple.com.cn")!,
                                    configuration: SafariView.Configuration(entersReaderIfAvailable: true,
                                                                            barCollapsingEnabled: true))
                            .preferredBarAccentColor(.clear)
                            .preferredControlAccentColor(.orange)
                            .dismissButtonStyle(.close)
                    }
                }
                Spacer()
                
            }
            .navigationTitle("笔记")
        }
    }
}

struct ReadingNote_Previews: PreviewProvider {
    static var previews: some View {
        ReadingNote()
    }
}
