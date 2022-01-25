//
//  Locked.swift
//  Reader
//
//  Created by 陳峻琦 on 24/1/2022.
//

import SwiftUI

struct Locked: View {
    let authorize: () -> ()
    
    var body: some View {
        Image(systemName: "lock.shield")
            .font(.system(.largeTitle, design: .rounded))
            .padding(.bottom, 50)
        Button {
            authorize()
            Vibration.light.vibrate()
        } label: {
            Text("轻点再次尝试解锁")
                .bold()
        }
    }
}
