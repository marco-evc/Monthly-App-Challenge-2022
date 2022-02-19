//
//  HomeViewModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import Combine
import SwiftUI

enum NetworkErrors:Error {
  case BadContent
}

final class CharactersViewModel: ObservableObject {
  @Published var characters = [StarWarsCharacter]()
  @Published var isLoadingPage = false

  // MARK: - Private Properties
  private let router: CharactersRouter
  private var currentPage = 1
  private var canLoadMorePages = true
  private var cancellables = Set<AnyCancellable>()
  private var nextPage: String? = nil
  private var url = URL(string: "https://swapi.dev/api/people/")!

  // MARK: - Initializer
  init(router: CharactersRouter) {
    self.router = router
    self.loadContent()
  }

  // MARK: - Public methods
  func loadMoreContentIfNeeded(currentItem item: StarWarsCharacter?) {
    guard let item = item else {
      self.loadContent()
      return
    }
    if item == characters.last {
      self.loadContent()
    }
  }

  func imageUrlFor(item: StarWarsCharacter?) -> URL {
    var currentIndex = ""
    if let index =  item?.url?.replacingOccurrences(of: "https://swapi.dev/api/people/", with: "") {
      currentIndex = index.replacingOccurrences(of: "/", with: "")
    }
    return URL(string: "https://starwars-visualguide.com/assets/img/characters/\(currentIndex).jpg")!
  }

  func characterDetail(forCharacter character: StarWarsCharacter) -> CharacterDetailView {
    self.router.characterDetailView(forCharacter: character)
  }

  // MARK: - Private methods
  private func loadContent() {
    guard !isLoadingPage && canLoadMorePages else {
      return
    }

    self.isLoadingPage = true
    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: StarWarsItem.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .handleEvents(receiveOutput:  { [weak self] response in
        guard let self = self,
              let charactersCount = response.count else { return }
        self.canLoadMorePages = charactersCount != self.characters.count
        self.isLoadingPage = false
        self.currentPage += 1
        self.url = URL(string: response.next ?? "")!
      })
      .map({ response in
        guard let characters = response.results else { return [StarWarsCharacter]() }
        return self.characters + characters
      })
      .catch({ _ in Just(self.characters) })
      .assign(to: &$characters)
  }
}
