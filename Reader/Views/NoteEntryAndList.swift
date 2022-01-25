//
//  NoteEntryAndList.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import SwiftUI

struct NoteEntryAndList: View {
    @State var titleInput: String = ""
    @State var contentInput: String = ""
    @StateObject var noteData = TabNoteData()
    
    var body: some View {
        VStack {
            //储存笔记
            VStack {
                TextField("Title", text: $titleInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Content", text: $contentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Spacer()
                    Button {
                        let id = UUID()
                        let newNote = Note(id: id, title: titleInput, content: contentInput)
                        noteData.notes.append(newNote)
                        noteData.saveNotes()
                        titleInput = ""
                        contentInput = ""
                    } label: {
                        RoundButton(text: "储存笔记", image: "note.text.badge.plus")
                    }
                }
            }
            .padding()
            .background(Color.init(.sRGB, white: 0.9, opacity: 0.2))
            .cornerRadius(10)
            .shadow(radius: 1)
            .padding()
            
            //读取笔记
            List {
                ForEach(noteData.notes) { note in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(note.title)
                            .font(.title3)
                            .bold()
                        Text(note.content)
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    func delete(at offsets: IndexSet) -> Void {
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
}

struct NoteEntryAndList_Previews: PreviewProvider {
    static var previews: some View {
        NoteEntryAndList()
    }
}
