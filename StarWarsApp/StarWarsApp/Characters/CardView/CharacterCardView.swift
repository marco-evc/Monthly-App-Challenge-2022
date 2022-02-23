//
//  CharacterCardView.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI
import Kingfisher

struct CharacterCardView: View {
  let character: StarWarsCharacter

  var body: some View {
    ZStack(alignment: .bottom) {
      self.imageView
      self.blurredView
    }
    .background(Color.black)
    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    .shadow(color: .black, radius: 10, x: 0, y: 0)
  }

  private var blurredView: some View {
    ZStack(alignment: .bottom) {
      Color(.systemGray)
        .opacity(0.7)
      Text(character.name ?? "Missing name")
        .font(.system(size: 18, weight: .semibold, design: .rounded))
        .foregroundColor(.white)
        .padding(.vertical, 8)
    }.frame(height: 30)
  }

  private var imageView: some View {
    KFImage(URL(string: character.imageUrl))
      .resizable()
      .scaledToFill()
  }
}
