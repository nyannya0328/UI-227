//
//  Home.swift
//  UI-227
//
//  Created by にゃんにゃん丸 on 2021/06/06.
//

import SwiftUI

struct Home: View {
    @Binding var selected : String
    
    init(selected : Binding<String>) {
        self._selected = selected
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection:$selected){
            
            
            Color.red
                .tag("Home")
                .ignoresSafeArea()
            
            Color.primary
                .tag("Settings")
                .ignoresSafeArea()
            
            Color.orange
                .tag("PC")
                .ignoresSafeArea()
            
            Color.green
                .tag("Write Down")
                .ignoresSafeArea()
            
            Color.purple
                .tag("Apple")
                .ignoresSafeArea()
            
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
