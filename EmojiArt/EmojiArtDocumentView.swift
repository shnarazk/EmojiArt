//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by 楢崎修二 on 2020/10/07.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            .padding(.horizontal)
            Color.white.overlay(Image(uiImage: self.document.backgroundImage))
                .edgesIgnoringSafeArea([.horizontal, .bottom])
                .onDrop(of: ["public.Image"], isTargeted: nil) {
                    providers, location in return self.drop(providers: providers)
                }
        }
    }

    func drop(providers: [NSItemProvider]) -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("drop \(url)")
            self.document.setBackgroundURL(url)
        }
        return found
    }
    
    private let defaultEmojiSize: CGFloat = 40
    
}


struct EmojiArtDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
