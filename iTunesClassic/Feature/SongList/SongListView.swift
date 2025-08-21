//
//  Song.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//

import SwiftUI

struct SongListView: View {
    
    //@State private var tracks: [Track] = []

    @State private var tracks = MockData.sampleTracks
    init(initialTracks: [Track] = []) {
        self._tracks = State(initialValue: initialTracks)
    }
    var body: some View {
        
        
        VStack {
            List {
                ForEach(tracks) { track in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(track.metadata.title)
                                .font(.headline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(track.metadata.artist)
                                .font(.headline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(track.metadata.album)
                                .font(.headline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(track.metadata.genre)
                                .font(.headline)
                        }
                    }
                }
            }
        }
        
        .padding()
        
    }
}


#Preview {
    SongListView()
}
