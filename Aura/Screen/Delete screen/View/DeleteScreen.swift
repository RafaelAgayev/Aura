//
//  DeleteScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct DeleteScreen: View {
    
    @StateObject private var vm = DeleteScreenViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 10) {
                Image(.critical)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                
                Text(vm.title)
                    .fontModifier(size: 28, weight: .semibold, foregroundColor: .colorBlack)
                    .multilineTextAlignment(.center)
                
                Text(vm.subtitle)
                    .multilineTextAlignment(.center)
                    .fontModifier(size: 18, weight: .medium, foregroundColor: .colorGray)
            }
        }
        .padding(.top, 20)
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
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
    }
}

#Preview {
    DeleteScreen()
}
