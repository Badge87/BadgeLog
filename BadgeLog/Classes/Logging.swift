//
//  Logging.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation

public protocol Logging {
    
    /// Dispatch a verbose log to all destinations enabled
    ///  - parameters:
    ///     - message: message of your log.
    ///     - error: error of your log, if present.
    ///     - file: the class caller of the log request.
    ///     - function: the function name where this method is called.
    ///     - line: the line number of the class file where this function is called.
    ///
    func verbose(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    /// Dispatch a debug log to all destinations enabled
    ///  - parameters:
    ///     - message: message of your log.
    ///     - error: error of your log, if present.
    ///     - file: the class caller of the log request.
    ///     - function: the function name where this method is called.
    ///     - line: the line number of the class file where this function is called.
    ///
    func debug(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    /// Dispatch a info log to all destinations enabled
    ///  - parameters:
    ///     - message: message of your log.
    ///     - error: error of your log, if present.
    ///     - file: the class caller of the log request.
    ///     - function: the function name where this method is called.
    ///     - line: the line number of the class file where this function is called.
    ///
    func info(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    /// Dispatch a warning log to all destinations enabled
    ///  - parameters:
    ///     - message: message of your log.
    ///     - error: error of your log, if present.
    ///     - file: the class caller of the log request.
    ///     - function: the function name where this method is called.
    ///     - line: the line number of the class file where this function is called.
    ///
    func warning(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    /// Dispatch an error log to all destinations enabled
    ///  - parameters:
    ///     - message: message of your log.
    ///     - error: error of your log, if present.
    ///     - file: the class caller of the log request.
    ///     - function: the function name where this method is called.
    ///     - line: the line number of the class file where this function is called.
    ///
    func error(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
}

extension Logging {
    
    public func verbose(_ message: String, error: NSError? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        verbose(message, error: error, file: file, function: function, line: line)
    }
    
    public func debug(_ message: String, error: NSError? = nil, file:String = #file, function: String = #function, line: Int = #line) {
        debug(message, error: error, file: file, function: function, line: line)
    }
    
    public func info(_ message: String, error: NSError? = nil, file:String = #file, function: String = #function, line: Int = #line) {
        info(message, error: error, file: file, function: function, line: line)
    }
    
    public func warning(_ message: String, error: NSError? = nil, file:String = #file, function: String = #function, line: Int = #line) {
        warning(message, error: error, file: file, function: function, line: line)
    }
    
    public func error(_ message: String, error: NSError? = nil, file:String = #file, function: String = #function, line: Int = #line) {
        self.error(message, error: error, file: file, function: function, line: line)
    }
    
    
}
