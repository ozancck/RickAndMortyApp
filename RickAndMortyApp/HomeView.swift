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

            ScrollView(.vertical) {
                VStack {
                    ForEach(1 ..< 20) { _ in
                        Button {
                            
                        } label: {
                            HStack {
                                Image("try")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.35)

                                Spacer()
                                Text("Ozan Cicek")
                                    .font(.title)
                                    .bold()
                                    .padding()
                                    .foregroundColor(.black)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 2)
                                    .fill(Color(.black))
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        }

                    }
                }
            }
        }

        .onAppear {
            viewModel.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
