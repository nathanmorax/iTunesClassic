//
//  AlbumService.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//


import Foundation

class AlbumService {
    static let shared = AlbumService()
    private init() {}
    
    func loadAlbum(from folderURL: URL) -> Album {
        let fileManager = FileManager.default
        let files = (try? fileManager.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)) ?? []
        let tracks = files.filter { $0.pathExtension.lowercased() == "mp3" || $0.pathExtension.lowercased() == "m4a" }
            .map { file in
                let metadata = Metadata(title: file.deletingPathExtension().lastPathComponent)
                return Track(fileURL: file, metadata: metadata)
            }

        return Album(name: folderURL.lastPathComponent, tracks: tracks)
    }
}
