//
//  ContentView.swift
//  iOS_Demo
//
//  Created by Lalana on 9/3/20.
//  Copyright © 2020 Lalana. All rights reserved.
//

import SwiftUI
import WebKit

//navigation view

struct ContentView: View {
    
    @State private var selectedSegment = 1
    @State private var websites = ["developer.apple.com","web.dev/"]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .lastTextBaseline){
                    Picker("",selection: $selectedSegment){
                        ForEach(0 ..< websites.count){
                            Text(self.websites[$0]).tag($0)
                        }
                    }.frame(width: 300,height: 160,alignment: .top)
                }
                WebView(request: URLRequest(url: URL(string: "https://\(websites[selectedSegment])")!)).frame(width: 420, height: 700, alignment: .bottom)
            }
        }
    }
}


struct WebView :UIViewRepresentable {
    
    let request : URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
