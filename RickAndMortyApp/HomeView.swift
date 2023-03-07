//
//  HomeView.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 6.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State var currentLocation = "Abadango"
    @State var gender = ""

    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.4)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.locations, id: \.self) { location in

                        Button {
                            self.currentLocation = location.name
                        } label: {
                            Text(location.name)
                                .foregroundColor(.black)
                                .padding(9)
                                .background(self.currentLocation != location.name ? Color(.gray).opacity(0.6) : Color(.white))

                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(lineWidth: 2)
                                        .fill(Color(.black))

                                }.padding(.horizontal, 3)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()

            List {
                ForEach(viewModel.characters, id: \.self) { character in
                    if character.location.name == currentLocation {
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                switch image {
                                case let .success(image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width * 0.35)

                                default: Color.clear
                                }
                            }
                            Spacer()

                            Text(character.name)
                                .font(.title2)
                                .multilineTextAlignment(.trailing)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }

        .onAppear {
            viewModel.fetchCharacter()
            viewModel.fetchLocation()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
