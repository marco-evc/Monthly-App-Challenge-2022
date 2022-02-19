//
//  CharacterCardView.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI

struct CharacterCardView: View {
  let url: URL
  let name: String

  var body: some View {
    ZStack(alignment: .top) {
//      RoundedRectangle(cornerRadius: 25, style: .continuous)
//        .fill(Color(.systemGray3))
        AsyncImage(url: url) {
          ProgressView()
        } image: {
          Image(uiImage: $0)
            .resizable()
        }.aspectRatio(contentMode: .fit)
          .cornerRadius(8)

        Text(name)
          .font(.system(size: 14, weight: .semibold, design: .rounded))
          .foregroundColor(.white)
      }
      .multilineTextAlignment(.center)
  }
}
