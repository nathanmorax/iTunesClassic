//
//  NSImage.swift
//  iTunesClassic
//
//  Created by Jesus Mora on 20/08/25.
//

import SwiftUI

extension NSImage {
    static func saveImage(_ image: NSImage, to path: String) {
        guard let tiffData = image.tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffData),
              let jpgData = bitmap.representation(using: .jpeg, properties: [:]) else { return }

        try? jpgData.write(to: URL(fileURLWithPath: path))
    }
}
