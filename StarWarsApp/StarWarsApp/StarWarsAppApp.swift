//
//  StarWarsAppApp.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import SwiftUI

@main
struct StarWarsAppApp: App {

  var body: some Scene {
    WindowGroup {
      NavigationView {
        CharactersRouter.view()
      }
    }
  }
}
