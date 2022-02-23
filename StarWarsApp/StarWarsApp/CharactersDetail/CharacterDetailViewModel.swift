//
//  CharacterDetailViewModel.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import Combine
import SwiftUI

final class CharacterDetailViewModel: ObservableObject {
    // MARK: - Private Properties
  private let router: CharacterDetailRouter
  private let filmService = FilmService()
  private let vehicleService = VehicleService()
  private var cancellables = Set<AnyCancellable>()

    // MARK: - Public Properties
  let character: StarWarsCharacter
  @Published var films: [FilmItem] = []
  @Published var vehicles: [VehicleItem] = []

    // MARK: - Initializer
  init(character: StarWarsCharacter, router: CharacterDetailRouter) {
    self.character = character
    self.router = router
    self.addSuscribers()
  }

  func onInit() {
    self.loadFilms()
    self.loadVehicles()
  }

  private func loadFilms() {
    character.films?.forEach {
      self.filmService.fetchFilm(withUrl: $0)
    }
  }

  private func loadVehicles() {
    character.vehicles?.forEach {
      self.vehicleService.fetchVehicle(withUrl: $0)
    }
  }
}

extension CharacterDetailViewModel {
  private func addSuscribers() {
    filmService.$film.sink {[weak self] filmItem in
      guard let film = filmItem else { return }
      print("Films contiene: \(film) ")
      self?.films.append(film)
    }
    .store(in: &cancellables)

    vehicleService.$vehicleItem.sink {[weak self] vehicle in
      guard let vehicle = vehicle else { return }
      self?.vehicles.append(vehicle)
    }
    .store(in: &cancellables)
  }
}
