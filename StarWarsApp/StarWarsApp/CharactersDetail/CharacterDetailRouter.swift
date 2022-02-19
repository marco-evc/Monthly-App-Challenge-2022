//
//  CharacterDetailRouter.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI

final class CharacterDetailRouter {
  static func view(withCharacter character: StarWarsCharacter) -> CharacterDetailView {
    let router = CharacterDetailRouter()
    let viewModel = CharacterDetailViewModel(character: character, router: router)
    let view = CharacterDetailView(viewModel: viewModel)
    return view
  }
}

