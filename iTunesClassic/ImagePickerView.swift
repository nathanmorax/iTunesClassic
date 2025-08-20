//
//  ImagePickerView.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//
import SwiftUI
import AppKit

struct ImagePickerView: View {
    var onImagePicked: (NSImage) -> Void

    var body: some View {
        VStack {
            Text("Selecciona una imagen")
                .font(.headline)
                .padding()

            Button("Abrir Finder") {
                openImagePicker()
            }
            .padding()
        }
        .frame(width: 300, height: 150)
    }

    private func openImagePicker() {
        let panel = NSOpenPanel()
        panel.allowedFileTypes = ["png", "jpg", "jpeg", "heic", "tiff"]
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false

        if panel.runModal() == .OK, let url = panel.url, let image = NSImage(contentsOf: url) {
            onImagePicked(image)
        }
    }
}

#Preview {
    ImagePickerView { image in
        print("Imagen seleccionada en preview: \(image)")
    }
}
