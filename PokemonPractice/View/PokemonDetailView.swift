//
//  PokemonDetailView.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/16.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // 上方圖片下載
            AsyncImage(url: viewModel.pokemon?.imageUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.grayColor, lineWidth: 6)
                        )
                case .failure(let error):
                    // 失敗無圖可顯示錯誤UI
                    Text("下載失敗: \(error.localizedDescription)")
                @unknown default:
                    Color.white
                }
            }
            .frame(height: 365)
            .frame(maxWidth: .infinity)
            .padding(12)
            
            // 下方詳細資料
            if let pokemon = viewModel.pokemon {
                HStack(alignment: .top, spacing: 12) {
                    // 左邊詳細資料
                    VStack(alignment: .leading, spacing: 4) {
                        Group {
                            DetailText(title: "Name:", detail: pokemon.capitalizedName, detailFontSize: 14)
                                .padding(.top, 12)
                            DetailText(title: "Height:", detail: "\(pokemon.heightString)")
                            DetailText(title: "Weight:", detail: pokemon.weightString)
                            DetailText(title: "ID:", detail: pokemon.idWithHashtag)
                        }
                        .padding(.leading, 12)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.grayColor)
                    .cornerRadius(10)
                    .padding([.leading], 12)
                    
                    // 右邊屬性資料
                    VStack(alignment: .leading, spacing: 4) {
                        DetailText(title: "特性")
                        ForEach(pokemon.pokemonTypes, id: \.self) { type in
                            DetailText(title: type)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.grayColor)
                                .cornerRadius(18)
                        }
                    }
                    .padding([.top, .leading, .trailing] ,12)
                }
                .padding(.bottom, 12)
            }
        }
        .background(.white)
    }
}

#Preview {
    PokemonDetailView()
}
