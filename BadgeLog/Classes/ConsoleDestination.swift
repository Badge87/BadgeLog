//
//  ConsoleDestination.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation
import os.log

/**
  `LogDestination` that will print logs on the console.
 */
public class ConsoleDestination: LogDestination {
    static let logger: os.Logger = os.Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Main")
    
    public init() {
        super.init()
        self.format = "C L '['c'.'m':'l']' M e"
    }
    
    public override func send(level: Logger.LogLevel, msg: String, error: NSError?, file: String, function: String, line: Int) -> String {
        let result = super.send(level: level, msg: msg, error: error, file: file, function: function, line: line)
        if result.isEmpty{
            return ""
        }
        switch level {
            
        case .debug:
            ConsoleDestination.logger.debug("\(result)")
        case .warning:
            ConsoleDestination.logger.warning("\(result)")
        case .verbose:
            ConsoleDestination.logger.trace("\(result)")
        case .error:
            ConsoleDestination.logger.error("\(result)")
        case .info:
            ConsoleDestination.logger.info("\(result)")
        }
        
        return result
    }
}
