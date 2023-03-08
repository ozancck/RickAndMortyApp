//
//  DetailsView.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 6.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var name: String
    var specy: String
    var image: String
    var status: String
    var gender: String
    var origin: String
    var location: String
    var episodes: [String]
    var created: String
    
    func getEpisodes() -> String {
        var episodesStrings: [String] = []
        for episode in episodes {
            episodesStrings.append(episode.components(separatedBy: "/").last ?? "")
        }
        return episodesStrings.joined(separator: ", ")
    }

    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
                .bold()

            AsyncImage(url: URL(string: image)) { image in
                switch image {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)

                default: Color.clear
                }
            }

            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    Text("Status:")
                        .padding(.bottom, 1.0)
                    Text("Specy:")
                        .padding(.bottom, 1.0)
                    Text("Gender:")
                        .padding(.bottom, 1.0)
                    Text("Origin:")
                        .padding(.bottom, 1.0)
                    Text("Loaction:")
                        .padding(.bottom, 1.0)
                    Text("Episodes:")
                        .padding(.bottom, 1.0)
                    Text("Created at")
                    Text("(in API):")
                }
                .font(.title3)
                .bold()
                .padding(.leading, 44)

                Spacer()
                VStack(alignment: .leading) {
                    Text(status)
                        .padding(.bottom, 1.0)
                    Text(specy)
                        .padding(.bottom, 1.0)
                    Text(gender)
                        .padding(.bottom, 1.0)
                    Text(origin)
                        .padding(.bottom, 1.0)
                    Text(location)
                        .padding(.bottom, 1.0)
                    Text(getEpisodes()) //THIS PLACEEEE
                        .padding(.bottom, 1.0)
                    Text(created)
                }

                .font(.title3)

                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Spacer()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        DetailsView(name: "OZAN", specy: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", status: "Alive", gender: "Male", origin: "Earth", location: "Earth", episodes: ["asdas", "asdasd"], created: "33.343.")
    }
}
