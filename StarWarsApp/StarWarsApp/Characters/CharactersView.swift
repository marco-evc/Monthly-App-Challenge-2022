//
//  HomeView.swift
//  StarWarsApp
//
//  Created by Marco Vazquez on 16/02/22.
//

import SwiftUI
import Kingfisher

struct CharactersView: View {
  // MARK: - Properties
  @ObservedObject var viewModel: CharactersViewModel
  private var items: [GridItem] {
    [GridItem(.flexible(minimum: 50, maximum: 200), spacing: 8, alignment: .top),
     GridItem(.flexible(minimum: 50, maximum: 200), spacing: 8, alignment: .top)]
  }

  // MARK: - Initializer
  public init(viewModel: CharactersViewModel) {
    self.viewModel = viewModel
  }

//  var body: some View {
//      ScrollView {
//        LazyVGrid(columns: self.items, alignment: .leading, spacing: 16) {
//          ForEach(viewModel.characters) { character in
//            VStack {
//              KFImage(URL(string: character.imageUrl))
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(22)
//
//              Text(character.name ?? "")
//                .font(.title)
//                .padding(.top, 4)
//
//              Spacer()
//            }.padding()
//        }
//      }
//    }
//  }






  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea()
      ScrollView {
        LazyVGrid(columns: items, spacing: 5) {
          ForEach(viewModel.characters) { item in
            NavigationLink(destination: viewModel.characterDetail(forCharacter: item)) {
              CharacterCardView(character: item)
                .onAppear {
                  viewModel.loadMoreContentIfNeeded(currentItem: item)
                }
            }
          }
          .padding(.all, 10)

          if viewModel.isLoadingPage {
            loaderView
          }
        }
      }
    }
    .navigationTitle("Characters")
    .searchable(text: $viewModel.searchText)
  }
}

// MARK: - SubViews
extension CharactersView {
  private var loaderView: some View {
       ProgressView()
      .tint(Color.black)
        .frame(width: 80, height: 80, alignment: .center)
        .progressViewStyle(.circular)
  }
}

// MARK: - Preview
struct CharactersView_Previews: PreviewProvider {
  static var previews: some View {
    CharactersView(viewModel: CharactersViewModel(router: CharactersRouter()))
  }
}
