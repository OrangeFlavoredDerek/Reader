//
//  TabNoteData.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import Foundation

struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
}

class TabNoteData: ObservableObject {
    @Published var notes: [Note] = []
    static let sandBoxURL: URL = FileManager().urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandBoxURL.appendingPathComponent("notes.json")
    
    init() {
        notes = getNotes()
    }
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        if FileManager.default.fileExists(atPath: notesURL.path) {
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        
        return result
    }
    
    func saveNotes() {
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
}
