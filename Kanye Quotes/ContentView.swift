//
//    ContentView.swift
//    Kanye Quotes
//
//    Created by Harry Kearney on 21/11/2022.
//

import SwiftUI
import Foundation

struct QuoteView: View {
    @State private var quote: String = "press reload quote to start"
    
    var body: some View {
        VStack {
            Text("Kanye Quotes")
                .fontWeight(.bold)
                .font(.largeTitle)
                .offset(y: -100)
            
            Text("\"\(quote)\" - Ye")
                    .font(.title2)
                    .padding()
            
            Button(action: loadQuote) {
                Text("🔁 reload quote")
            }
            
            ShareLink(item: "\"\(quote)\" - Ye")
                .offset(y: 100)
        }
    }
    
    func loadQuote() {
        let url = URL(string: "https://e9b6-176-78-198-190.eu.ngrok.io")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                self.quote = "Error loading quote."
                return
            }
                
            let responseJSON = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            let quote = responseJSON["quote"] as! String
            
            DispatchQueue.main.async {
                self.quote = quote
            }
        }
        task.resume()
    }
}


struct QuoteView_Previews: PreviewProvider {
        static var previews: some View {
                QuoteView().previewDisplayName("iPhone 14")
        }
}
