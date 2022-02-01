//
//  Logging.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 31/01/22.
//

import Foundation

public protocol Logging {
    
    func verbose(_ message: String, error: NSError?)
    
    func debug(_ message: String, error: NSError?)
    
    func info(_ message: String, error: NSError?)
    
    func warning(_ message: String, error: NSError?)
    
    func error(_ message: String, error: NSError?)
    
}

extension Logging {
    public func verbose(_ message: String, error: NSError? = nil) {
        verbose(message, error: error)
    }
    
    public func debug(_ message: String, error: NSError? = nil) {
        debug(message, error: error)
    }
    
    public func info(_ message: String, error: NSError? = nil) {
        info(message, error: error)
    }
    
    public func warning(_ message: String, error: NSError? = nil) {
        warning(message, error: error)
    }
    
    public func error(_ message: String, error: NSError? = nil) {
        self.error(message, error: error)
    }
    
    
}
