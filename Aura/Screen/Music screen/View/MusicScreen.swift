//
//  MusicScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import SwiftUI

struct MusicScreen: View {
    
    @StateObject private var vm = MusicViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            ForEach(vm.music, id: \.id){ music in
                NavigationLink{
                    DetailableScreen(content: .music(music))
                }label: {
                    MusicSection(music: music)
                }
                Divider()
            }
        }
        .onAppear{
            vm.musicData()
        }
        
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
}

extension MusicScreen{
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }
        ToolbarItem(placement: .principal) {
            Text("Music")
                .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorBlack)
        }
    }
}

#Preview {
    MusicScreen()
}
