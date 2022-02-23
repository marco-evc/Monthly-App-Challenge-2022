//
//  CharacterDetailService.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 23/02/22.
//

import Combine
import SwiftUI

final class FilmService: ObservableObject {
  // MARK: - Public Properties
  @Published var film: FilmItem?

  // MARK: - Private Properties
  private var filmSubscription: AnyCancellable?

  func fetchFilm(withUrl url: String) {
    self.fetchFilms(urlString: url)
  }

    // MARK: - Private methods
  private func fetchFilms(urlString: String) {
    guard let url = URL(string: urlString) else { return }

    filmSubscription = NetworkingManager.download(url: url)
      .decode(type: FilmItem.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] filmItem in
        self?.film = filmItem
        self?.filmSubscription?.cancel()
      })
  }
}
