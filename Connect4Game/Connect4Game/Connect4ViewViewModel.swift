//
//  Connect4ViewViewModel.swift
//  Connect4Game
//
//  Created by Marco Vazquez on 06/01/22.
//

import SwiftUI

final class Connect4ViewViewModel: ObservableObject {
  @Published var rowItems: [GridItem] = [
    GridItem(.adaptive(minimum: 10, maximum: 50)),
    GridItem(.adaptive(minimum: 10, maximum: 50)),
    GridItem(.adaptive(minimum: 10, maximum: 50))
  ]
}

