//
//  ContentView.swift
//  ShareProject
//
//  Created by Vasichko Anna on 16.09.2022.
//

import SwiftUI

struct ImageToShare: Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    
    var image: Image
    var title: String
}

struct ContentView: View {
    
    private let url = URL(string: "https://swiftbook.org/")!
    private let imageToShare = ImageToShare(image: Image("swiftLogo"), title: "Swiftbook.org")
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "swift")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            ShareLink(item: url)
            
            ShareLink("Share our link!", item: url)
            
            ShareLink(item: url) {
                Label("Share our website", systemImage: "network")
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue, in: RoundedRectangle(cornerRadius: 20))
            }
            
            ShareLink(
                item: imageToShare,
                preview: SharePreview(
                    imageToShare.title,
                    image: imageToShare.image
                )
            ) {
                Text("Save the logo")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
