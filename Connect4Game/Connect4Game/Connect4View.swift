  //
  //  Connect4View.swift
  //  Connect4Game
  //
  //  Created by Marco Vazquez on 06/01/22.
  //

import SwiftUI

enum CircleState {
  case empty
  case fill
}

struct CircleColumn {
  var number: Int
  var items: [CircleItem]
}

struct CircleItem {
  var state: CircleState = .empty
}

struct Connect4View: View {
    // MARK: - Properties
  @State var configuration: Connect4ConfigProtocol?
  @StateObject var viewModel = Connect4ViewViewModel()

  let data = (1...42).map { "Item \($0)" }

  private var columns: [GridItem] = Array(repeating: GridItem(.adaptive(minimum: 30), spacing: 5), count: 6)

    // MARK: - Initializer
  init(configuration: Connect4ConfigProtocol = DefaultConfiguration()) {
    self.configuration = configuration
  }

  var body: some View {
    VStack {
      Spacer()
      LazyHGrid(rows: columns, spacing: 20) {
        ForEach(data, id: \.self) { item in
          Circle()
            .stroke(lineWidth: 2)
            .frame(width: 35, height: 35)
            .onTapGesture {
              print("Column tapped: \(item)")
            }
        }
      }
      .padding()
      PlayersView()
        .padding()
      Spacer()
    }
    .background(Color.blue)
  }
}

struct PlayersView: View {
  var body: some View {
    HStack {
      Text("Player one: 0")
      Spacer()
      Text("Player two: 0")
    }
    .font(.headline)
    .foregroundColor(.white)
  }
}

struct Connect4View_Previews: PreviewProvider {
  static var previews: some View {
    Connect4View()
  }
}
