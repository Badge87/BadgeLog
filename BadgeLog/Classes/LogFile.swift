//
//  LogFile.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 01/02/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers
public struct LogFile: FileDocument {
    public static var readableContentTypes = [UTType.plainText]
    // by default our document is empty
    var text = ""
    var name = ""
    
    public init( ) {
        self.text = ""
        
    }
    public init(url: URL, exportName: String? = nil ) throws {
        self.text = try String(contentsOf: url, encoding: .utf8)
        self.name = exportName ?? url.lastPathComponent
        
    }
    
    public init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
                   text = String(decoding: data, as: UTF8.self)
        }
    }
    
    public func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let result = FileWrapper(regularFileWithContents: Data(text.utf8))
        result.filename = name
        return result
    }
    
    
}
