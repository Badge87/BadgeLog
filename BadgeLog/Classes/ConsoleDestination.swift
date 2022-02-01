//
//  ConsoleDestination.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation
import SwiftyBeaver

class ConsoleDestination: BaseDestination {
    
    public override init() {
        super.init()
        
        levelColor.verbose = "📣 "
        levelColor.debug = "📝 "
        levelColor.info = "ℹ️ "
        levelColor.warning = "⚠️ "
        levelColor.error = "☠️ "
    }
    
    override func send(_ level: SwiftyBeaver.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any? = nil) -> String? {
        let message = super.send(level, msg: msg, thread: thread, file: file, function: function, line: line, context: context)
        
        if message != nil {
            print(message!)
        }
        
        return message
        
    }
}
