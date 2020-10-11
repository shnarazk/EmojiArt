//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by 楢崎修二 on 2020/10/09.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

struct OptionalImage_Previews: PreviewProvider {
    static var previews: some View {
        OptionalImage(uiImage: nil)
    }
}
