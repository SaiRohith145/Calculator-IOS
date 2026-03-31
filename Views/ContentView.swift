//
//  ContentView.swift
//  Calculator
//
//  Created by Sai Rohith on 25/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.3),.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                KeyView()
            }
    }
}

#Preview {
    ContentView()
}
