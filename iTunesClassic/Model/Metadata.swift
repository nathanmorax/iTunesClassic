//
//  Metadata.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//
import SwiftUI

// MARK: - 🧩 2. Modelo MetaData
@Observable
class Metadata {
    var title: String
    var artist: String
    var album: String
    var genre: String
    var artwork: NSImage?
    
    init(title: String = "", artist: String = "", album: String = "", genre: String = "", artwork: NSImage? = nil) {
        self.title = title
        self.artist = artist
        self.album = album
        self.genre = genre
        self.artwork = artwork
    }
}
