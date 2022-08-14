//
//  ContentView.swift
//  RLocker
//
//  Created by Guangyu Yang on 2022/8/14.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("Lock", action: {
                lock()
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
