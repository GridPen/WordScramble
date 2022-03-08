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
                    TextField("Your word here", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section{
                    ForEach(usedWord, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        //extra validation came to make here
        withAnimation{
                usedWord.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}










