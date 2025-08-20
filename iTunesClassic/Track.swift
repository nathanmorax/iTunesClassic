//
//  Track.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//
import SwiftUI

// MARK: -  🧩 2. Modelo Track
@Observable
class Track: Identifiable {
    let fileURL: URL
    var metadata: Metadata

    init(fileURL: URL, metadata: Metadata) {
        self.fileURL = fileURL
        self.metadata = metadata
    }
}
