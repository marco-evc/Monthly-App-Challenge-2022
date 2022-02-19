//
//  CharacterDetailView.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 18/02/22.
//

import SwiftUI

struct CharacterDetailView: View {
  @ObservedObject var viewModel: CharacterDetailViewModel

  init(viewModel: CharacterDetailViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    Text(viewModel.character.name ?? "")
  }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    CharacterDetailView(viewModel: CharacterDetailViewModel(character: <#T##StarWarsCharacter#>, router: <#T##CharacterDetailRouter#>))
//  }
//}
