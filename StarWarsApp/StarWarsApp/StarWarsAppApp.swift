//
//  StarWarsAppApp.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import SwiftUI

@main
struct StarWarsAppApp: App {

//  init() {
//    let navBarAppearance = UINavigationBar.appearance()
//    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//  }

  var body: some Scene {
    WindowGroup {
      CharactersRouter.view()
    }
  }
}
