//
//  HomeView.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 6.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State var currentLocation = "Earth (C-137)"

    var body: some View {
        NavigationView {
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
                            NavigationLink(destination: DetailsView(name: character.name, specy: character.species, image: character.image, status: character.status, gender: character.gender, origin: character.origin.name, location: character.location.name, episodes: character.episode, created: character.created)) {
                                CellView(url: character.image, name: character.name, gender: character.gender)
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
