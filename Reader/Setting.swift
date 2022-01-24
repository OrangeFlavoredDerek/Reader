//
//  Setting.swift
//  Reader
//
//  Created by 陳峻琦 on 22/1/2022.
//

import SwiftUI

struct Setting: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        Button {
            Vibration.success.vibrate()
            darkMode.toggle()
        } label: {
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
                .font(.system(.headline, design: .rounded))
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting(darkMode: .constant(false))
    }
}
