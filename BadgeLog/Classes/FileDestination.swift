//
//  FileDestination.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation
import SwiftyBeaver
class FleDestination: FileDestination {
    
    override init(logFileURL: URL? = nil) {
        super.init(logFileURL: logFileURL)
        levelColor.verbose = "📣 "
        levelColor.debug = "📝 "
        levelColor.info = "ℹ️ "
        levelColor.warning = "⚠️ "
        levelColor.error = "☠️ "
    }
 
    
    
}
