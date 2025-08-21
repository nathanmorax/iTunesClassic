//
//  MusicTab.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 21/08/25.
//
import SwiftUI

enum MusicTab: String, CaseIterable, Identifiable {
    case tracks = "Tracks"
    case artists = "Artists"
    case albums = "Album"
    case genres = "Genre"
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .tracks: return "Tracks"
        case .artists: return "Artists"
        case .albums: return "Albums"
        case .genres: return "Genres"
        }
    }
}

struct MusicTabBar: View {
    @Binding var selectedTab: MusicTab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(MusicTab.allCases) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    Text(tab.rawValue)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(selectedTab == tab ? .white : .primary)
                        .padding(.vertical, 6)
                        .frame(maxWidth: .infinity)
                        .background(selectedTab == tab ? Color.black : Color.clear)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 8)
        .background(Color(NSColor.controlBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
