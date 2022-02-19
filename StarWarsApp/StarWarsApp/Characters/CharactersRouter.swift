//
//  CharactersRouter.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI

final class CharactersRouter {
  static func view() -> CharactersView {
    let router = CharactersRouter()
    let viewModel = CharactersViewModel(router: router)
    let view = CharactersView(viewModel: viewModel)
    return view
  }

  func characterDetailView(forCharacter character: StarWarsCharacter) -> CharacterDetailView {
    CharacterDetailRouter.view(withCharacter: character)
  }
}
