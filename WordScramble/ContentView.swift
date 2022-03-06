//
//  ContentView.swift
//  WordScramble
//
//  Created by Debashish Mondal on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var rootWord = ""
    @State private var usedWord = [String]()
    @State private var newWord = ""
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    TextField("Your word", text: $newWord)
                }
                
                Section{
                    ForEach(usedWord, id: \.self) { word in
                        Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
        }
    }
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
