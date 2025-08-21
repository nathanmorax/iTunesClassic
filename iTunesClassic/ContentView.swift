//
//  ContentView.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 19/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: MusicTab = .artists
    
    var body: some View {
        
        HStack {
            
            LibraryView()
            
            VStack(spacing: 0) {
                MusicTabBar(selectedTab: $selectedTab)
                    .padding(.top, 8)
                
                Divider()
                
                switch selectedTab {
                case .tracks:
                    SongListView()
                case .albums:
                    EmptyView()
                case .artists:
                    EmptyView()
                case .genres:
                    EmptyView()
                }
            }
            //.frame(minWidth: 600, minHeight: 400)
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
