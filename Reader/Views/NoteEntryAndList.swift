//
//  NoteEntryAndList.swift
//  Reader
//
//  Created by 陳峻琦 on 25/1/2022.
//

import SwiftUI
import ImagePickerView

struct NoteEntryAndList: View {
    @State var titleInput: String = ""
    @State var contentInput: String = ""
    @State var image: UIImage?
    @State var showImagePicker: Bool = false
    @StateObject var noteData = TabNoteData()
    
    //储存笔记
    fileprivate func save() {
        let id = UUID()
        if let data = image?.pngData() {
            noteData.saveImage(id: id, data: data)
        }
        let newNote = Note(id: id, title: titleInput, content: contentInput, imageURLAppendix: image == nil ? nil : "\(id).png")
        noteData.notes.append(newNote)
        noteData.saveNotes()
        titleInput = ""
        contentInput = ""
        image = nil
    }
    
    var body: some View {
        VStack {
            //储存笔记
            VStack {
                HStack {
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 115, alignment: .center)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    }
                    
                    VStack {
                        TextField("Title", text: $titleInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Content", text: $contentInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        TextEditor(text: $contentInput)
//                            .cornerRadius(8)
                        
                        HStack {
                            Button {
                                showImagePicker.toggle()
                            } label: {
                                RoundButton(text: "图片", image: "photo")
                            }
                            .sheet(isPresented: $showImagePicker) {
                                ImagePickerView(sourceType: .photoLibrary) { image in
                                    self.image = image
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                save()
                            } label: {
                                RoundButton(text: "储存笔记", image: "note.text.badge.plus")
                            }
                        }
                    }
                }
                .padding()
                .background(Color.init(.sRGB, white: 0.9, opacity: 0.2))
                .cornerRadius(10)
                .shadow(radius: 1)
                .padding()
            }
            
            //读取笔记
            List {
                ForEach(noteData.notes) { note in
                    HStack {
                        if note.imageURLAppendix != nil {
                            Image(uiImage: noteData.getImage(note.imageURLAppendix!))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                        }
                    }
                    
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
