//
//  MusicSyncService.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//


import Foundation

class MusicSyncService {
    static let shared = MusicSyncService()
    private init() {}
    
    func syncAlbums(_ albums: [Album]) {
        let autoAddFolder = FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("Music/Music/Media.localized/Automatically Add to Music.localized")

        for album in albums {
            for track in album.tracks {
                let destination = autoAddFolder.appendingPathComponent(track.fileURL.lastPathComponent)
                try? FileManager.default.copyItem(at: track.fileURL, to: destination)

                let script = AppleScriptService.shared.generateAppleScript(for: track)
                AppleScriptService.shared.runAppleScript(script)
            }
        }
    }
}