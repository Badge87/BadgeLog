//
//  Logger.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 28/01/22.
//

import Foundation
import SwiftyBeaver
public final class Logger {
    public enum LogLevel: String {
            case debug
            case warning
            case verbose
            case error
            case info
        }
    
    public static let shared: Logger = Logger()
    
    public var enableFileLogging = true
    public var enableConsoleLogging = true
    public var enableOSLogging = true
    public var minLevel: LogLevel = .verbose
    
    
    private let format = "$Dyyyy-MM-dd HH:mm:ss.SSS$d $T $C$L$c: $M"
    
    let internalLogger = SwiftyBeaver.self
    var fileLogger: FileDestination!
    var consoleLogger: ConsoleDestination!

    
    
    
    public func setup(){
        
        internalLogger.removeAllDestinations()
        consoleLogger = ConsoleDestination()
        fileLogger = FileDestination()
        
        if enableConsoleLogging {
            
            consoleLogger.format = format
            consoleLogger.minLevel = Logger.logLevelToLevel(level: minLevel)
            internalLogger.addDestination(consoleLogger)
        }
        
        if enableFileLogging {
            
            fileLogger.format = format
            fileLogger.logFileAmount = 5
            fileLogger.minLevel = Logger.logLevelToLevel(level: minLevel)
            internalLogger.addDestination(fileLogger)
        }
        
        
    }
    
}


extension Logger: Logging {
    public func info(_ message: String, error: NSError?) {
        log(.info, message, error: error)
    }
    
    public func debug(_ message: String, error: NSError?) {
        log(.debug, message, error: error)
    }
    public func warning(_ message: String, error: NSError?) {
        log(.warning, message, error: error)
    }
    public func verbose(_ message: String, error: NSError?) {
        log(.verbose, message, error: error)
    }
    public func error(_ message: String, error: NSError?) {
        log(.error, message, error: error)
    }
    
    internal func log(_ level: LogLevel, _ message: String, error: NSError?) {
         
        let msg = generateLogMessage(message: message, error: error)
        switch level {
        case .debug:
            internalLogger.debug(msg)
        case .warning:
            internalLogger.warning(msg)
        case .verbose:
            internalLogger.verbose(msg)
        case .error:
            internalLogger.error(msg)
        case .info:
            internalLogger.info(msg)
        }
        
        if internalLogger.destinations.isEmpty {
            print(msg)
        }
         
     }
}

extension Logger {
    func generateLogMessage(message: String, error: NSError?) -> String {
        var result = message
        if error != nil {
            result += " : \(error!)"
        }
        
        return message
    }
    
    static func logLevelToLevel(level: LogLevel) -> SwiftyBeaver.Level {
        switch level {
        case .debug:
            return SwiftyBeaver.Level.debug
        case .warning:
            return SwiftyBeaver.Level.warning
        case .verbose:
            return SwiftyBeaver.Level.verbose
        case .error:
            return SwiftyBeaver.Level.error
        case .info:
            return SwiftyBeaver.Level.info
        }
    }
}
