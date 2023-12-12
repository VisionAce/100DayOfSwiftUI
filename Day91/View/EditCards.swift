//
//  EditCards.swift
//  Flashzilla
//
//  Created by 褚宣德 on 2023/12/9.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    @State private var showResetCardAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button {
                    showResetCardAlert = true
                } label: {
                    Image(systemName: "trash.circle.fill")
                }
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear {
                cards = CardManager.load()
            }
            .alert("重置", isPresented: $showResetCardAlert) {
                Button("確定") {
                    CardManager.reset()
                    cards = [Card]()
                }
                Button("取消", role: .cancel) { }
            } message: {
                Text("確定要刪除所有Card的內容嗎？")
            }
        }
  
    }
    
    func done() {
        dismiss()
    }
    
    /*func loadData() {
     if let data = UserDefaults.standard.data(forKey: "Cards") {
     if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
     cards = decoded
     }
     }
     }
     
     func saveData() {
     if let data = try? JSONEncoder().encode(cards) {
     UserDefaults.standard.set(data, forKey: "Cards")
     }
     }*/
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimedAnswer)
        cards.insert(card, at: 0)
        //        saveData()
        CardManager.save(cards: cards)
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        //        saveData()
        CardManager.save(cards: cards)
    }
}
#Preview {
    EditCards()
}
