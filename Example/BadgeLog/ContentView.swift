//
//  ContentView.swift
//  BadgeLog_Example
//
//  Created by Daniele Bachicchi on 01/02/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import BadgeLog

struct ContentView: View {
    @State var exportFile: Bool = false
    var body: some View {
        Form {
            Section(header: Text("Logs")) {
                HStack { Text("📣 Verbose") }
                .onTapGesture { log.verbose("I'm a verbose log!")
                }
                HStack { Text("📝 Debug") }
                .onTapGesture { log.debug("I'm a debug log!")
                }
                HStack { Text("ℹ️ Info") }
                .onTapGesture { log.info("I'm a info log!")
                }
                HStack { Text("⚠️ Warning") }
                .onTapGesture { log.warning("I'm a warning log!")
                }
                HStack { Text("☠️ Error") }
                .onTapGesture { log.error("I'm an error log!")
                }
                HStack { Text("☠️ Error with exception") }
                .onTapGesture { log.error("I'm an error log!", error: NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Fake Exception"]))
                }
                
            }
            Section(header: Text("File")) {
                NavigationLink("📖 See file log", destination: LogView())
                HStack {Text("⬆️ Export log") }
                .onTapGesture {
                    exportFile = true
                }
                
                
            }
        
        }
        .navigationTitle("BadgeLog")
        .fileExporter(isPresented: $exportFile, document: log.generateLogDocument(), contentType: .plainText) {result in
            print(result)
                
            
        }
        }
    
    func shareFile(window: UIWindow) {
            guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        
            window.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
