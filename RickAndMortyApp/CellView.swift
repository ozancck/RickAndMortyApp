//
//  CellView.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 8.03.2023.
//

import SwiftUI

struct CellView: View {
    @State var url: String
    @State var name: String
    @State var gender: String

    var body: some View {
        if gender == "Female" {
            ZStack {
                Image("Female")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.30)

                HStack {
                    AsyncImage(url: URL(string: url)) { image in
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

                    Text(name)
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
        if gender == "Male" {
            ZStack {
                Image("Male")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.30)

                HStack {
                    Text(name)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.horizontal)

                    Spacer()

                    AsyncImage(url: URL(string: url)) { image in
                        switch image {
                        case let .success(image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.35)

                        default: Color.clear
                        }
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(lineWidth: 1)
                }
            }
        }
        if gender == "genderless"{
            ZStack {
                Image("Genderless")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.30)

                HStack {
                    AsyncImage(url: URL(string: url)) { image in
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

                    Text(name)
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
        if gender == "unknown"{
            ZStack {
                Image("Genderless")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.30)

                HStack {
                    AsyncImage(url: URL(string: url)) { image in
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

                    Text(name)
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
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Ozan Cicek", gender: "Male")
    }
}
