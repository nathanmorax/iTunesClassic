//
//  Album.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//
import SwiftUI

// MARK: -  🧩 3. Modelo Album
@Observable
class Album: Identifiable {
    var name: String
    var tracks: [Track]
    var artwork: NSImage?

    init(name: String, tracks: [Track], artwork: NSImage? = nil) {
        self.name = name
        self.tracks = tracks
        self.artwork = artwork
    }
}
