//
//  Prospect.swift
//  HotProspects
//
//  Created by 褚宣德 on 2023/11/28.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    
    var id = UUID()
    var name = "Anonymous"
    var emailAdress = ""
    var date = Date.now
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    //    let saveKey = "SavedData"
    let filePath: URL
    let locationFileName = "contacte.json"
    
    init() {
        /*if let data = UserDefaults.standard.data(forKey: saveKey) {
         if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
         people = decoded
         return
         }
         }*/
        self.filePath = FileManager.documentsDirectory.appendingPathComponent(locationFileName)
        do {
            
            let data = try Data(contentsOf: self.filePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
            
        } catch {
            print("Unable to load data. \(error.localizedDescription)")
            // no saved data!
            people = []
        }
    }
    
    private func save() {
        /*if let encode = try? JSONEncoder().encode(people) {
         UserDefaults.standard.set(encode, forKey: saveKey)
         }*/
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: self.filePath, options: [.atomic, .completeFileProtection])
            
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func delete() {
        people.removeAll()
        save()
    }
    
    
    func addExample(for amount: Int) {
        for i in 0...amount {
            let prospect = Prospect()
            prospect.name = "Paul_\(i) Hudson"
            prospect.emailAdress = "Paul@hackingwithswift.com"
            prospect.date = Date.now
            people.append(prospect)
        }
        people = people.shuffled()
        
        save()
    }
    
    
    func nameSort() {
        people = people.sorted(by: { (lhs: Prospect, rhs: Prospect) -> Bool in
            lhs.name < rhs.name
        })
        
        save()
    }
    
    func mostRecentSort() {
        people = people.sorted(by: { (lhs: Prospect, rhs: Prospect) -> Bool in
            lhs.date > rhs.date
        })
        save()
    }
}
