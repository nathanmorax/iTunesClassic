//
//  AlbumListView.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//
import SwiftUI

struct AlbumListView: View {
    @State private var albums: [Album] = []
    
    private let albumService = AlbumService.shared
    private let syncService = MusicSyncService.shared

    var body: some View {
        VStack {
            Text("Álbumes agregados hoy 🎶")
                .font(.title2)
                .padding()

            List {
                ForEach(albums) { album in
                    Section(header: Text(album.name)) {
                        ForEach(album.tracks) { track in
                            VStack(alignment: .leading) {
                                Text(track.fileURL.lastPathComponent)
                                    .font(.headline)
                                MetadataEditorView(metadata: track.metadata)
                            }
                        }
                    }
                }
            }

            Button("Sincronizar con Music.app") {
                syncService.syncAlbums(albums)
            }
            .padding()
        }
        .onDrop(of: ["public.folder"], isTargeted: nil) { providers in
            handleDrop(providers)
            return true
        }
    }

    func handleDrop(_ providers: [NSItemProvider]) {
        for provider in providers {
            provider.loadItem(forTypeIdentifier: "public.folder", options: nil) { item, _ in
                if let urlData = item as? Data,
                   let url = URL(dataRepresentation: urlData, relativeTo: nil) {
                    DispatchQueue.main.async {
                        let album = albumService.loadAlbum(from: url)
                        albums.append(album)
                    }
                }
            }
        }
    }
}
