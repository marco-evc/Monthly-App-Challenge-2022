//
//  VehicleService.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 23/02/22.
//

import Combine
import SwiftUI

final class VehicleService: ObservableObject {
    // MARK: - Public Properties
  @Published var vehicleItem: VehicleItem?

    // MARK: - Private Properties
  private var vehicleSubscription: AnyCancellable?

  func fetchVehicle(withUrl url: String) {
    self.fetchVehicles(urlString: url)
  }

    // MARK: - Private methods
  private func fetchVehicles(urlString: String) {
    guard let url = URL(string: urlString) else { return }

    vehicleSubscription = NetworkingManager.download(url: url)
      .decode(type: VehicleItem.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] vehicleItem in
        self?.vehicleItem = vehicleItem
        self?.vehicleSubscription?.cancel()
      })
  }
}
