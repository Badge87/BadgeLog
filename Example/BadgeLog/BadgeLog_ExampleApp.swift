//
//  BadgeLog_ExampleApp.swift
//  BadgeLog_Example
//
//  Created by Daniele Bachicchi on 01/02/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import BadgeLog

let log = Logger.shared

@main
struct BadgeLog_ExampleApp: App {
    
    init() {
        log.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
        }
    }
}


