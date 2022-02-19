//
//  CharacterDetailViewModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI

final class CharacterDetailViewModel: ObservableObject {
  let character: StarWarsCharacter
  private let router: CharacterDetailRouter

    // MARK: - Initializer
  init(character: StarWarsCharacter, router: CharacterDetailRouter) {
    self.character = character
    self.router = router
  }
}
