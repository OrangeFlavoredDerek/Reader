//
//  ReaderApp.swift
//  Reader
//
//  Created by 陳峻琦 on 21/1/2022.
//

import SwiftUI
import LocalAuthentication

@main
struct ReaderApp: App {
    @State var locked: Bool = false
    let motionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if locked {
                    Locked(authorize: authorize)
                } else {
                    TabView {
                        Master()
                            .environmentObject(motionManager)
                            .tabItem {
                                Label("阅读列表", systemImage: "books.vertical")
                            }
                        ReadingNote()
                            .tabItem {
                                Label("笔记", systemImage: "note.text")
                            }
                    }
                }
            }
            .onAppear {
                authorize()
            }
        }
    }
    
    func authorize() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "解锁App") { result, _ in
                
            }
        }
    }
}
