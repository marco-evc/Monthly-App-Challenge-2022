//
//  HomeViewModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import Combine
import SwiftUI

final class CharactersViewModel: ObservableObject {
  @Published var characters = [StarWarsCharacter]()
  @Published var isLoadingPage = false
  @Published var searchText = ""

  // MARK: - Private Properties
  private let dataService: CharactersService
  private let router: CharactersRouter
  private var cancellables = Set<AnyCancellable>()
  private var url = "https://swapi.py4e.com/api/people/"

  // MARK: - Initializer
  init(router: CharactersRouter) {
    self.router = router
    self.dataService = CharactersService(urlString: url)
    self.addSuscribers()
  }

  // MARK: - Public methods
  func loadMoreContentIfNeeded(currentItem item: StarWarsCharacter?) {
    guard let item = item else {
      self.dataService.loadMoreCharacters()
      return
    }
    if item == characters.last {
      self.dataService.loadMoreCharacters()
    }
  }

  func characterDetail(forCharacter character: StarWarsCharacter) -> CharacterDetailView {
    self.router.characterDetailView(forCharacter: character)
  }

  // MARK: - Private methods
  private func addSuscribers() {
    // Updates all characters
    dataService.$isLoadingPage
      .sink { isLoading in
        self.isLoadingPage = isLoading
      }
      .store(in: &cancellables)

    $searchText
      .combineLatest(dataService.$characters)
      .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
      .map { (text, startingCharacters) -> [StarWarsCharacter] in
        guard !text.isEmpty else {
          return startingCharacters
        }
        let lowerCasedText = text.lowercased()
        return startingCharacters.filter { (character) -> Bool in
          return character.name?.lowercased().contains(lowerCasedText) ?? false
        }
      }
      .sink {[weak self] returnedCharacters in
        self?.characters = returnedCharacters
      }
      .store(in: &cancellables)
  }
}
