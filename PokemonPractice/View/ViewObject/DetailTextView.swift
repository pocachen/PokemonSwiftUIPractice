//
//  DetailTextView.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/17.
//

import SwiftUI

/// 提供標題和內容的一行文字，可設定兩者字體大小
struct DetailText: View {
    let title: String
    var detail: String = ""
    var titleFontSize: CGFloat = 16
    var detailFontSize: CGFloat = 16
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
                .font(.system(size: titleFontSize))
            if detail != "" {
                Text(detail)
                    .font(.system(size: detailFontSize))
            }
        }
        .blackBoldStyle()
    }
}

#Preview {
    DetailText(title: "Title", detail: "Detail")
}
