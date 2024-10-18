//
//  View+.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/17.
//

import Foundation
import SwiftUI

extension View {
    func blackBoldStyle() -> some View {
        self.bold()
            .foregroundStyle(.black)
            .frame(height: 26)
    }
    
}
