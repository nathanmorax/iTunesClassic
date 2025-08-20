//
//  MetadataEditorView.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//
import SwiftUI

struct MetadataEditorView: View {
    @Bindable var metadata: Metadata
        @State private var showingImagePicker = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Título", text: $metadata.title)
            TextField("Artista", text: $metadata.artist)
            TextField("Álbum", text: $metadata.album)
            TextField("Género", text: $metadata.genre)

            HStack {
                if let image = metadata.artwork {
                    Image(nsImage: image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(6)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 80, height: 80)
                        .overlay(Text("Sin carátula").font(.caption))
                }

                Button("Seleccionar Carátula") {
                    showingImagePicker = true
                }
            }
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            ImagePickerView { selectedImage in
                metadata.artwork = selectedImage
            }
        }
    }
}

#Preview {
    MetadataEditorView(metadata: Metadata())
}
