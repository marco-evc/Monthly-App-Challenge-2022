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
    self.viewModel.onInit()
  }

  var body: some View {
    cardView
    .navigationBarTitleDisplayMode(.inline)
  }

  private var cardView: some View {
    ZStack {
      VStack(spacing: 20) {
        HStack(spacing: 8) {
          characterImage
            .frame(width: 120, height: 120)
            .padding()
          infoStack
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity)

//        itemsView
//          .background(Color.white)
//          .cornerRadius(10)
//          .shadow(radius: 10)
//          .frame(maxWidth: .infinity)
        ScrollView {
          ForEach(viewModel.films) { film in
            Text(film.title ?? "")
          }

          ForEach(viewModel.vehicles) { vehicle in
            Text(vehicle.name ?? "")
          }
        }
      }
    }
  }

  private var itemsView: some View {
    VStack {
      ScrollView {
        VStack {
        Text("Related Films")
          .font(.title)
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
        }.padding()

        VStack {
          Text("Related Vehicles")
            .font(.title)
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
        }.padding()

        VStack {
          Text("Related Starships")
            .font(.title)
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
        }.padding()
      }
    }.padding()
  }

  private var infoStack: some View {
    VStack(alignment: .leading, spacing: 3) {
      Text(viewModel.character.name ?? "")
        .font(.title)
      Text("Birth Year: \(viewModel.character.birth_year ?? "")")
        .font(.system(.footnote, design: .rounded))
      Text("Height: \(viewModel.character.height ?? "")")
        .font(.system(.footnote, design: .rounded))
      Text("Mass: \(viewModel.character.mass ?? "")")
        .font(.system(.footnote, design: .rounded))
      Text("Gender: \(viewModel.character.gender ?? "")")
        .font(.system(.footnote, design: .rounded))
      Text("Hair color: \(viewModel.character.hair_color ?? "")")
        .font(.system(.footnote, design: .rounded))
      Text("Skin color: \(viewModel.character.skin_color ?? "")")
        .font(.system(.footnote, design: .rounded))
    }
    .padding()
  }

  private var characterImage: some View {
    AsyncImage(
      url: URL(string: viewModel.character.imageUrl),
      transaction: Transaction(animation: .none)
    ) { phase in
      switch phase {
      case .empty:
        ProgressView()
      case .success(let image):
        image.resizable()
          .aspectRatio(contentMode: .fill)
          .clipShape(Circle())
          .shadow(radius: 10)
          .overlay(Circle().stroke(Color.black, lineWidth: 5))
      case .failure:
        Image(systemName: "photo")
          .renderingMode(.template)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .foregroundColor(.gray)
      @unknown default:
        EmptyView()
      }
    }
  }
}

struct CharacterDetailView_Previews: PreviewProvider {
  static let character: StarWarsCharacter = Bundle.main.decode("StarWarsCharacter.json")

  static var previews: some View {
    CharacterDetailView(viewModel: CharacterDetailViewModel(character: character, router: CharacterDetailRouter()))
  }
}
