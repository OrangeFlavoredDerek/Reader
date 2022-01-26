//
//  TabNoteData.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import Foundation
import SwiftUI

struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
    var imageURLAppendix: String?
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
    
    func getImage(_ imageURLAppendix: String) -> UIImage {
        let url = TabNoteData.sandBoxURL.appendingPathComponent(imageURLAppendix)
        let imageData = try! Data(contentsOf: url)
        return UIImage(data: imageData, scale: 0.5)!
    }
    
    func saveImage(id: UUID, data: Data) {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = TabNoteData.sandBoxURL.appendingPathComponent("\(id).png")
            try? data.write(to: url)
        }
    }
}
