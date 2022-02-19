//
//  HomeView.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import SwiftUI

struct CharactersView: View {
  @ObservedObject var viewModel: CharactersViewModel

  private var columns = [
    GridItem(.flexible(), spacing: 8, alignment: nil),
    GridItem(.flexible(), spacing: 8, alignment: nil),
    GridItem(.flexible(), spacing: 8, alignment: nil)
  ]

  public init(viewModel: CharactersViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationView {
      ZStack {
        Color(.systemGray4).ignoresSafeArea()
        ScrollView {
          LazyVGrid(columns: columns, alignment: .center, spacing: 8, pinnedViews: []) {
            ForEach(viewModel.characters) { item in
              NavigationLink(destination: viewModel.characterDetail(forCharacter: item)) {
                CharacterCardView(url: viewModel.imageUrlFor(item: item), name: item.name ?? "Missing")
                  //.frame(height: 150)
                  .onAppear {
                    viewModel.loadMoreContentIfNeeded(currentItem: item)
                  }
              }
            }.navigationBarTitle("Characters")
          }.padding(.horizontal, 16)
          if viewModel.isLoadingPage {
            ProgressView()
              .frame(width: 40, height: 40, alignment: .center)
              .foregroundColor(.white)
              .progressViewStyle(.circular)
          }
        }
      }
    }
  }
}

struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersView(viewModel: CharactersViewModel(router: CharactersRouter()))
  }
}
