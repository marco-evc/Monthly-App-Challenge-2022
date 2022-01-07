//
//  Models.swift
//  Connect4Game
//
//  Created by Marco Vazquez on 06/01/22.
//

import SwiftUI

protocol Connect4ConfigProtocol {
  var numberOfRows: Int { get }
  var numberOfColumns: Int { get }
}

struct DefaultConfiguration: Connect4ConfigProtocol {
  let numberOfRows: Int = 6
  let numberOfColumns: Int = 7
}
