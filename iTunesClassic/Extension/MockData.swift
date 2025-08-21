//
//  MockData.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//

import SwiftUI
import Foundation

// MARK: - 🧩 MockData Service
class MockData {
    static let shared = MockData()
    private init() {}
    
    // MARK: - Sample Albums
    static var sampleAlbums: [Album] {
        return [
            createDarkSideOfTheMoonAlbum(),
            createAbbeyRoadAlbum(),
            createThrillerAlbum(),
            createBackInBlackAlbum(),
            createHotelCaliforniaAlbum()
        ]
    }
    
    // MARK: - Individual Album Creators
    
    static func createDarkSideOfTheMoonAlbum() -> Album {
        let tracks = [
            Track(fileURL: createMockURL(filename: "01 Speak to Me.mp3"),
                  metadata: Metadata(title: "Speak to Me", artist: "Pink Floyd", album: "The Dark Side of the Moon", genre: "Progressive Rock")),
            Track(fileURL: createMockURL(filename: "02 Breathe (In the Air).mp3"),
                  metadata: Metadata(title: "Breathe (In the Air)", artist: "Pink Floyd", album: "The Dark Side of the Moon", genre: "Progressive Rock")),
            Track(fileURL: createMockURL(filename: "03 On the Run.mp3"),
                  metadata: Metadata(title: "On the Run", artist: "Pink Floyd", album: "The Dark Side of the Moon", genre: "Progressive Rock")),
            Track(fileURL: createMockURL(filename: "04 Time.mp3"),
                  metadata: Metadata(title: "Time", artist: "Pink Floyd", album: "The Dark Side of the Moon", genre: "Progressive Rock")),
            Track(fileURL: createMockURL(filename: "05 Money.mp3"),
                  metadata: Metadata(title: "Money", artist: "Pink Floyd", album: "The Dark Side of the Moon", genre: "Progressive Rock"))
        ]
        
        return Album(name: "The Dark Side of the Moon", tracks: tracks, artwork: createMockArtwork(color: .purple))
    }
    
    static func createAbbeyRoadAlbum() -> Album {
        let tracks = [
            Track(fileURL: createMockURL(filename: "01 Come Together.mp3"),
                  metadata: Metadata(title: "Come Together", artist: "The Beatles", album: "Abbey Road", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "02 Something.mp3"),
                  metadata: Metadata(title: "Something", artist: "The Beatles", album: "Abbey Road", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "03 Maxwell's Silver Hammer.mp3"),
                  metadata: Metadata(title: "Maxwell's Silver Hammer", artist: "The Beatles", album: "Abbey Road", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "04 Oh! Darling.mp3"),
                  metadata: Metadata(title: "Oh! Darling", artist: "The Beatles", album: "Abbey Road", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "05 Here Comes the Sun.mp3"),
                  metadata: Metadata(title: "Here Comes the Sun", artist: "The Beatles", album: "Abbey Road", genre: "Rock"))
        ]
        
        return Album(name: "Abbey Road", tracks: tracks, artwork: createMockArtwork(color: .orange))
    }
    
    static func createThrillerAlbum() -> Album {
        let tracks = [
            Track(fileURL: createMockURL(filename: "01 Wanna Be Startin' Somethin'.m4a"),
                  metadata: Metadata(title: "Wanna Be Startin' Somethin'", artist: "Michael Jackson", album: "Thriller", genre: "Pop")),
            Track(fileURL: createMockURL(filename: "02 Baby Be Mine.m4a"),
                  metadata: Metadata(title: "Baby Be Mine", artist: "Michael Jackson", album: "Thriller", genre: "Pop")),
            Track(fileURL: createMockURL(filename: "03 The Girl Is Mine.m4a"),
                  metadata: Metadata(title: "The Girl Is Mine", artist: "Michael Jackson", album: "Thriller", genre: "Pop")),
            Track(fileURL: createMockURL(filename: "04 Thriller.m4a"),
                  metadata: Metadata(title: "Thriller", artist: "Michael Jackson", album: "Thriller", genre: "Pop")),
            Track(fileURL: createMockURL(filename: "05 Beat It.m4a"),
                  metadata: Metadata(title: "Beat It", artist: "Michael Jackson", album: "Thriller", genre: "Pop"))
        ]
        
        return Album(name: "Thriller", tracks: tracks, artwork: createMockArtwork(color: .red))
    }
    
    static func createBackInBlackAlbum() -> Album {
        let tracks = [
            Track(fileURL: createMockURL(filename: "01 Hells Bells.mp3"),
                  metadata: Metadata(title: "Hells Bells", artist: "AC/DC", album: "Back in Black", genre: "Hard Rock")),
            Track(fileURL: createMockURL(filename: "02 Shoot to Thrill.mp3"),
                  metadata: Metadata(title: "Shoot to Thrill", artist: "AC/DC", album: "Back in Black", genre: "Hard Rock")),
            Track(fileURL: createMockURL(filename: "03 What Do You Do for Money Honey.mp3"),
                  metadata: Metadata(title: "What Do You Do for Money Honey", artist: "AC/DC", album: "Back in Black", genre: "Hard Rock")),
            Track(fileURL: createMockURL(filename: "04 Back in Black.mp3"),
                  metadata: Metadata(title: "Back in Black", artist: "AC/DC", album: "Back in Black", genre: "Hard Rock"))
        ]
        
        return Album(name: "Back in Black", tracks: tracks, artwork: createMockArtwork(color: .black))
    }
    
    static func createHotelCaliforniaAlbum() -> Album {
        let tracks = [
            Track(fileURL: createMockURL(filename: "01 Hotel California.mp3"),
                  metadata: Metadata(title: "Hotel California", artist: "Eagles", album: "Hotel California", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "02 New Kid in Town.mp3"),
                  metadata: Metadata(title: "New Kid in Town", artist: "Eagles", album: "Hotel California", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "03 Life in the Fast Lane.mp3"),
                  metadata: Metadata(title: "Life in the Fast Lane", artist: "Eagles", album: "Hotel California", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "04 Wasted Time.mp3"),
                  metadata: Metadata(title: "Wasted Time", artist: "Eagles", album: "Hotel California", genre: "Rock"))
        ]
        
        return Album(name: "Hotel California", tracks: tracks, artwork: createMockArtwork(color: .brown))
    }
    
    // MARK: - Helper Methods
    
    static func createMockURL(filename: String) -> URL {
        // Crea URLs ficticias para testing
        return URL(fileURLWithPath: "/Users/mockuser/Music/\(filename)")
    }
    
    static func createMockArtwork(color: NSColor) -> NSImage {
        // Crea artwork mock con colores sólidos
        let size = NSSize(width: 300, height: 300)
        let image = NSImage(size: size)
        
        image.lockFocus()
        color.setFill()
        NSRect(origin: .zero, size: size).fill()
        
        // Agregar texto con el color del álbum
        let textColor: NSColor = color == .black ? .white : .black
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: NSFont.systemFont(ofSize: 24, weight: .bold)
        ]
        
        let text = "🎵"
        let textSize = text.size(withAttributes: attributes)
        let textRect = NSRect(
            x: (size.width - textSize.width) / 2,
            y: (size.height - textSize.height) / 2,
            width: textSize.width,
            height: textSize.height
        )
        
        text.draw(in: textRect, withAttributes: attributes)
        image.unlockFocus()
        
        return image
    }
    
    // MARK: - Random Data Generators
    
    static func randomAlbum() -> Album {
        return sampleAlbums.randomElement() ?? sampleAlbums[0]
    }
    
    static func randomTrack() -> Track {
        let randomAlbum = randomAlbum()
        return randomAlbum.tracks.randomElement() ?? randomAlbum.tracks[0]
    }
    
    // MARK: - Single Track Samples
    
    static var sampleTracks: [Track] {
        return [
            Track(fileURL: createMockURL(filename: "Bohemian Rhapsody.mp3"),
                  metadata: Metadata(title: "Bohemian Rhapsody", artist: "Queen", album: "A Night at the Opera", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "Stairway to Heaven.mp3"),
                  metadata: Metadata(title: "Stairway to Heaven", artist: "Led Zeppelin", album: "Led Zeppelin IV", genre: "Hard Rock")),
            Track(fileURL: createMockURL(filename: "Imagine.mp3"),
                  metadata: Metadata(title: "Imagine", artist: "John Lennon", album: "Imagine", genre: "Rock")),
            Track(fileURL: createMockURL(filename: "Billie Jean.m4a"),
                  metadata: Metadata(title: "Billie Jean", artist: "Michael Jackson", album: "Thriller", genre: "Pop"))
        ]
    }
    
    // MARK: - Empty/Test Cases
    
    static var emptyAlbum: Album {
        return Album(name: "Álbum Vacío", tracks: [])
    }
    
    static var albumWithOneTrack: Album {
        let track = Track(fileURL: createMockURL(filename: "Single Track.mp3"),
                         metadata: Metadata(title: "Única Canción", artist: "Artista Solo", album: "Single", genre: "Pop"))
        return Album(name: "Single", tracks: [track])
    }
    
    // MARK: - Genre-specific Albums
    
    static var rockAlbums: [Album] {
        return [createDarkSideOfTheMoonAlbum(), createAbbeyRoadAlbum(), createBackInBlackAlbum()]
    }
    
    static var popAlbums: [Album] {
        return [createThrillerAlbum()]
    }
    
    // MARK: - Search/Filter Helpers
    
    static func albums(containing searchTerm: String) -> [Album] {
        return sampleAlbums.filter { album in
            album.name.localizedCaseInsensitiveContains(searchTerm) ||
            album.tracks.contains { track in
                track.metadata.title.localizedCaseInsensitiveContains(searchTerm) ||
                track.metadata.artist.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    static func albums(byArtist artist: String) -> [Album] {
        return sampleAlbums.filter { album in
            album.tracks.contains { track in
                track.metadata.artist.localizedCaseInsensitiveContains(artist)
            }
        }
    }
    
    static func albums(byGenre genre: String) -> [Album] {
        return sampleAlbums.filter { album in
            album.tracks.contains { track in
                track.metadata.genre.localizedCaseInsensitiveContains(genre)
            }
        }
    }
}

// MARK: - SwiftUI Preview Helpers

extension MockData {
    /// Para usar en SwiftUI Previews
    static var previewAlbum: Album {
        return createAbbeyRoadAlbum()
    }
    
    static var previewTrack: Track {
        return previewAlbum.tracks[0]
    }
    
    static var previewMetadata: Metadata {
        return previewTrack.metadata
    }
}

// MARK: - Extensions for Testing

extension Album {
    /// Crea un álbum de prueba rápido
    static func mock(name: String = "Test Album", trackCount: Int = 3) -> Album {
        let tracks = (1...trackCount).map { index in
            Track(fileURL: MockData.createMockURL(filename: "Track \(index).mp3"),
                  metadata: Metadata(title: "Track \(index)", artist: "Test Artist", album: name, genre: "Test"))
        }
        return Album(name: name, tracks: tracks)
    }
}

extension Track {
    /// Crea un track de prueba rápido
    static func mock(title: String = "Test Track") -> Track {
        return Track(fileURL: MockData.createMockURL(filename: "\(title).mp3"),
                    metadata: Metadata(title: title, artist: "Test Artist", album: "Test Album", genre: "Test"))
    }
}

extension Metadata {
    /// Crea metadata de prueba rápido
    static func mock(title: String = "Test Song") -> Metadata {
        return Metadata(title: title, artist: "Test Artist", album: "Test Album", genre: "Test")
    }
}
