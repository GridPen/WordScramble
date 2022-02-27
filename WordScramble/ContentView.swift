//
//  ContentView.swift
//  WordScramble
//
//  Created by Debashish Mondal on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            ForEach(0...10, id: \.self) {
                Text("Dynamic text \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
