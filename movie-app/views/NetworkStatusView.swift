//
//  NetworkStatusView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 28/04/2022.
//

import SwiftUI
import Alamofire

struct NetworkAlert: Equatable {
    let text: String
    let image: Image
    let color: Color
}

let reachableNetworkAlert = NetworkAlert(
    text: "We are back online!",
    image: Image(systemName: "checkmark.icloud"),
    color: .green
)

let notReachableNetworkAlert = NetworkAlert(
    text: "No internet connection!",
    image: Image(systemName: "wifi.exclamationmark"),
    color: .red
)

struct NetworkStatusView: View {
    @State private var networkAlert: NetworkAlert?
    
    var body: some View {
        VStack {
            Spacer()
            if let networkAlert = networkAlert {
                HStack {
                    networkAlert.image
                        .foregroundColor(.white)
                        
                    Text(networkAlert.text)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        
                }
                .padding()
                .background(networkAlert.color)
                .cornerRadius(20)
                .padding(.bottom, 80)
            }
            
        }.onAppear {
            NetworkManager.reachibilityManager?.startListening(
                onQueue: DispatchQueue.main,
                onUpdatePerforming: { status in
                    switch status {
                    case .reachable:
                        withAnimation {
                            if networkAlert != nil {
                                self.networkAlert = reachableNetworkAlert
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    if networkAlert == reachableNetworkAlert {
                                        self.networkAlert = nil
                                    }
                                }
                            }
                        }
                        print("reachable")
                    case .notReachable:
                        withAnimation {
                            self.networkAlert = notReachableNetworkAlert
                        }
                        print("not reachable")
                    case .unknown:
                        withAnimation {
                            self.networkAlert = nil
                        }
                        print("Unknow")
                    }
                }
            )
//            NetworkManager.reachibilityManager?.startListening { status in
//                switch status {
//                case .reachable:
//                    withAnimation {
//                        if networkAlert != nil {
//                            self.networkAlert = reachableNetworkAlert
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                if networkAlert == reachableNetworkAlert {
//                                    self.networkAlert = nil
//                                }
//                            }
//                        }
//                    }
//                    print("reachable")
//                case .notReachable:
//                    withAnimation {
//                        self.networkAlert = notReachableNetworkAlert
//                    }
//                    print("not reachable")
//                case .unknown:
//                    withAnimation {
//                        self.networkAlert = nil
//                    }
//                    print("Unknow")
//                }
//            }
        }
    }
}

struct NetworkStatusView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkStatusView()
    }
}
