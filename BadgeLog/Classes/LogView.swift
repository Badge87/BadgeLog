//
//  LogView.swift
//  BadgeLog
//
//  Created by Daniele Bachicchi on 01/02/22.
//

import SwiftUI

public struct LogView: View {
    @State var data: String = ""
    private var auto: Bool = true
    
    public init() {
    }
    
    init(data: String) {
        self.data = data
        self.auto = false
    }
    
    public var body: some View {
        ScrollView{
         
        Text(data)
                .font(Font.system(size: 12))
            
        }
        .padding(5)
        .navigationTitle("Logs")
        .toolbar(){
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {refresh()}){
                    Image(systemName: "goforward")
                }
            }
        }
        .onAppear {
            if auto {
                refresh()
            }
            
        }
    }
    
    private func  refresh(){
        //TODO
        data = Logger.shared.getLogFiles()[0].text.replacingOccurrences(of: "\n", with: "\n\n")
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        
        LogView(data: "Here will be all the log file under filelogger. it wil be veeeeeeeery loooooong")
    }
}
