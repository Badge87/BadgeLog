//
//  LogDestination.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 07/02/22.
//

import Foundation
public protocol LogInterpreter{
    func send(level: Logger.LogLevel,
              msg: String,
              error: NSError?,
              file: String,
              function: String,
              line: Int) -> String
}

/**
  Data class for describing the various `Logger.LogLevel` inside this `LogDestination`.
*/
public struct LogLevelDescriptor{
    
    var verbose: String
    var debug: String
    var info: String
    var warning: String
    var error: String
    
    public init(verbose: String = "VERBOSE", debug: String = "DEBUG", info: String = "INFO", warning: String = "WARNING", error: String = "ERROR") {
        self.verbose = verbose
        self.debug = debug
        self.info = info
        self.warning = warning
        self.error = error
    }

    
    /**
         Return the description of the `Logger.LogLevel`.
         - Parameters:
           - level: The level you want the description for.
    */
    public func describe(level: Logger.LogLevel) -> String {
        switch level {
            
        case .debug:
            return debug
        case .warning:
            return warning
        case .verbose:
            return verbose
        case .error:
            return error
        case .info:
            return info
        }
    }
}

/**
 Base class for all LogDestination. Subclass it for create a custom Log Destination.
 
 */
public class LogDestination: LogInterpreter{
    
    
    /**
         Minimum `Logger.LogLevel` which this LogDestination will print the log row.
         All levels under the minimum level will not be generated
         (`LogDestination.send` will return an empty string).
         
          Default value is `Logger.LogLevel.verbose`.
     */
    public var minLevel: Logger.LogLevel
    /**
         String format for every single rows generated by this `LogDestination`.
         Check out the documentation to know how to customize it
    */
    public var format: String
    /**
        Date formatter for the log row.
    */
    public var dateFormat: ISO8601DateFormatter
    /**
          `LogLevelDescriptor` used inside this `LogDestination`
    */
    public var logDescriptor: LogLevelDescriptor
    
    /**
          `LogLevelDescriptor` for color icon used inside this `LogDestination`
    */
    public var logColorDescriptor: LogLevelDescriptor
    
    public init(minLevel: Logger.LogLevel = Logger.LogLevel.verbose, format: String = "T '-' L '-' '['c'.'m':'l']' M e", dateFormat: ISO8601DateFormatter = ISO8601DateFormatter(), logDescriptor: LogLevelDescriptor = LogLevelDescriptor(), logColorDescriptor: LogLevelDescriptor = LogLevelDescriptor(verbose: "????", debug: "????", info: "??????", warning: "??????", error: "??????")) {
        self.minLevel = minLevel
        self.format = format
        self.dateFormat = dateFormat
        self.logDescriptor = logDescriptor
        self.logColorDescriptor = logColorDescriptor
        
    }
    
    
    /**
    Generate a formatted log row string according to `LogDestination.format`.
    Overwrite this method to save the log row generated.
         
    If `LogDestination.minLevel` is greater than `level` than the log row generated will be an
    empty string.
         
     - Parameters:
        - level: the log level of this log row.
        - message: the message of this log row.
        - error: the throwable error (if present) of this log row.
        - tag: the tag of this log row.
        - file: the class name for this log row.
        - method: the method name of this log row.
        - line: the line number inside the [file] of this log row.
         
    - Returns: the generated formatted log row string.
      Empty if `LogDestination.minLevel` is greater than `level`
    */
    public func send(level: Logger.LogLevel, msg: String, error: NSError?, file: String, function: String, line: Int) -> String {
        
        if level.rawValue < minLevel.rawValue {
            return ""
        }
        
        
        return formatMessage(level: level, msg: msg, error: error, file: file, function: function, line: line)
        
    }
    
    func formatMessage(level: Logger.LogLevel, msg: String, error: NSError?, file: String, function: String, line: Int) -> String {
        let now = Date()
        var result = ""
        let elements = Array(format)
        var customString = false
        
        for element in elements {
            if element == "'" {
                customString = !customString
                continue
            }
            if customString == true {
                result += String(element)
                continue
            }
            
            switch element {
            case "M":
                result += msg
            case "l":
                result += "\(line)"
            case "m":
                result += function
            case "f":
                result += file
            case "c":
                let fileName = URL(fileURLWithPath: file).lastPathComponent
                let index = fileName.firstIndex(of: ".")
                result += index != nil ? String(fileName[..<index!]) : fileName
            case "e":
                result += error != nil ? "\n\(error!.debugDescription)" : ""
            case "C":
                result += logColorDescriptor.describe(level: level)
            case "L":
                result += logDescriptor.describe(level: level)
            case "T":
                result += dateFormat.string(from: now)
            case " ":
                result += " "
                
            default:
                continue
            }
        }
        
        return result
    }
    
}
