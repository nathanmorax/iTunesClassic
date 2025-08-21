//
//  AppleScriptService.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//

import Foundation
import SwiftUI

class AppleScriptService {
    static let shared = AppleScriptService()
    private init() {}
    
    func generateAppleScript(for track: Track) -> String {
        let metadata = track.metadata
        var script = """
        tell application "Music"
            set newTrack to add POSIX file "\(track.fileURL.path)" to playlist "Library"
            tell newTrack
                set artist to "\(metadata.artist)"
                set album to "\(metadata.album)"
                set genre to "\(metadata.genre)"
                set name to "\(metadata.title)"
        """

        if let artwork = metadata.artwork {
            let tempPath = "/tmp/\(UUID().uuidString).jpg"
            NSImage.saveImage(artwork, to: tempPath)
            script += """
            
                set artworkData to (read (POSIX file "\(tempPath)") as picture)
                make new artwork with properties {data:artworkData}
            """
        }

        script += """
            end tell
        end tell
        """
        return script
    }
    
    func runAppleScript(_ script: String) {
        let task = Process()
        task.launchPath = "/usr/bin/osascript"
        task.arguments = ["-e", script]
        try? task.run()
    }
}
