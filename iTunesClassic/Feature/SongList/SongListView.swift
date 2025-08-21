//
//  Song.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//

import SwiftUI

struct SongListView: View {
    @State private var tracks: [Track] = MockData.sampleTracks
    @State private var selectedTrack: Track.ID? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Header con estilo iTunes
            HStack(spacing: 0) {
                headerCell("Song", width: 400, alignment: .leading)
                headerCell("Artist", width: 300, alignment: .leading)
                headerCell("Album", width: 150, alignment: .leading)
                headerCell("Genre", width: 150, alignment: .leading)
                //headerCell("Time", width: 150, alignment: .center)

            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.gray.opacity(0.3))
            
            Divider()

            // Lista de canciones
            List(tracks, selection: $selectedTrack) { track in
                HStack(spacing: 0) {
                    
                    songCell(track.metadata.title, width: 400, alignment: .leading)
                    songCell(track.metadata.artist, width: 300, alignment: .leading)
                    songCell(track.metadata.album, width: 150, alignment: .leading)
                    songCell(track.metadata.genre, width: 150, alignment: .leading)
                }
                .contentShape(Rectangle())
                .listRowInsets(EdgeInsets(top: 2, leading: 16, bottom: 2, trailing: 16))
                .background(
                    selectedTrack == track.id
                        ? Color.accentColor.opacity(0.2)
                        : Color.clear
                )
                .onTapGesture {
                    selectedTrack = track.id
                    print("Selected: \(track.metadata.title)")
                }
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            
            // Footer con info total
            HStack {
                Text("\(tracks.count) songs")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("Total: ")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(NSColor.controlBackgroundColor))
        }
        .background(Color(NSColor.textBackgroundColor))
    }
    
    // MARK: - Helper Views
    @ViewBuilder
    private func headerCell(_ text: String, width: CGFloat, alignment: Alignment) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .semibold))
            .frame(maxWidth: width, alignment: alignment)
            .lineLimit(4)
            .foregroundColor(.primary)
    }
    
    @ViewBuilder
    private func songCell(_ text: String, width: CGFloat, alignment: Alignment, isTitle: Bool = false) -> some View {
        Text(text)
            .font(.system(size: 11))
            .lineLimit(1)
            .truncationMode(.tail)
            .frame(maxWidth: width, alignment: alignment)
            .foregroundColor(isTitle ? .primary : .secondary)
    }
    
   /* private var totalDuration: String {
        let totalSeconds = tracks.reduce(into: 0) { $0 + $1.durationInSeconds }
        let minutes = totalSeconds / 60
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        
        if hours > 0 {
            return String(format: "%d:%02d hours", hours, remainingMinutes)
        } else {
            return String(format: "%d minutes", minutes)
        }
    }*/
}
#Preview {
    SongListView()
}

