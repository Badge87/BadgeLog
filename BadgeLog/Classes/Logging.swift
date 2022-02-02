//
//  Logging.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation

public protocol Logging {
    
    func verbose(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    func debug(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    func info(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
    func warning(_ message: String, error: NSError?, file: String, function: String, line: Int)
    
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
