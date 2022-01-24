//
//  ReaderApp.swift
//  Reader
//
//  Created by 陳峻琦 on 21/1/2022.
//

import SwiftUI

@main
struct ReaderApp: App {
    let motionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            Master()
                .environmentObject(motionManager)
        }
    }
}
