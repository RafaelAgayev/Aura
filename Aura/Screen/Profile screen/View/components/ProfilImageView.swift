//
//  ProfilImageView.swift
//  Aura
//
//  Created by Rafael Agayev on 25.12.25.
//

import SwiftUI
import PhotosUI

struct ProfilImageView: View {
    @State private var profilImage: UIImage? = nil
    @State private var showImagePicker = false
    
    let userID: String
    
    private var storageKey: String{
        "profileImageData_\(userID)"
    }
    
    var body: some View {
        ZStack {
            if let profilImage {
                Image(uiImage: profilImage)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            } else if let data = UserDefaults.standard.data(forKey: storageKey),
                      let uiImage = UIImage(data: data){
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            }
        }
        .onTapGesture {
            showImagePicker = true
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $profilImage)
        }
        .onChange(of: profilImage) { newImage in
            guard let data = newImage?.jpegData(compressionQuality: 0.8) else { return }
                        UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}


//#Preview {
//    ProfilImageView()
//}
