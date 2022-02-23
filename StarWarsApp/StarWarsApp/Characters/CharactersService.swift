//
//  CharactersService.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 19/02/22.
//

import Combine
import Foundation
import SwiftUI

final class CharactersService {
  // MARK: - Public Properties
  @Published var characters = [StarWarsCharacter]()
  @Published var isLoadingPage = false

  // MARK: - Private Properties
  private var canLoadMorePages = true
  private var nextItemUrl: String = ""
  private var charactersSubscription: AnyCancellable?

  // MARK: - Initializer
  init(urlString: String) {
    self.fetchCharacters(urlString: urlString)
  }

  // MARK: - Public methods
  func loadMoreCharacters() {
    self.fetchCharacters(urlString: self.nextItemUrl)
  }

  // MARK: - Private methods
  private func fetchCharacters(urlString: String) {
    guard let url = URL(string: urlString),
          !isLoadingPage && canLoadMorePages else { return }
    self.isLoadingPage = true

    charactersSubscription = NetworkingManager.download(url: url)
      .decode(type: StarWarsItem.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] starWarsItem in
        guard let characters = starWarsItem.results else { return }
        self?.setLoadingRules(forItem: starWarsItem)
        self?.characters += characters
        self?.charactersSubscription?.cancel()
      })
  }

  private func setLoadingRules(forItem item: StarWarsItem) {
    self.isLoadingPage = false
    self.canLoadMorePages = item.next != nil
    self.nextItemUrl = item.next ?? ""
  }
}
