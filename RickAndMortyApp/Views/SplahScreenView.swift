//
//  SplahScreenView.swift
//  RickAndMortyApp
//
//  Created by Ozan Çiçek on 6.03.2023.
//

import SwiftUI

struct SplahScreenView: View {
    @State var isActive = false
    @State var status = UserDefaults.standard.value(forKey: "status")

    var body: some View {
        if self.isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 150)

                    if (self.status != nil ) {
                        Text("Hello!")
                            .font(.largeTitle)
                            .bold()
                    }else {
                        Text("Welcome!")
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"),
                                                    object: nil)
                }
            }
        }
    }
}

struct SplahScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplahScreenView()
    }
}
