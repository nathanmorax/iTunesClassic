//
//  ContentView.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: MusicTab = .tracks
    
    var body: some View {
        
        HStack {
            
            LibraryView()
            
            VStack(spacing: 0) {
                MusicTabBar(selectedTab: $selectedTab)
                    .padding(.top, 8)
                
                Divider()
                Spacer()
                switch selectedTab {
                case .tracks:
                    SongListView()
                case .albums:
                    AlbumListView()
                case .artists:
                    EmptyView()
                case .genres:
                    EmptyView()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}


struct LibraryView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("LibraryView")
                
                List {
                    Text("Item 1")
                }
                .foregroundStyle(.white)
                Text("PlayList")
                
                List {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .foregroundStyle(.white)
                
            }
            .padding()
            .background(.blue.opacity(0.2))
            .frame(maxWidth: 180)
        }
    }
    
}
