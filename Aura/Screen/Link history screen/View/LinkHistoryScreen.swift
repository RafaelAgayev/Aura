//
//  LinkHistoryScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 06.01.26.
//

import SwiftUI

struct LinkHistoryScreen: View {
    
    @StateObject private var vm = LinkHistoryViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List{
            LinkHistorySection(
              marksProfile: $vm.marksProfile,
              rafaelProfile: $vm.rafaelProfile,
              ronaldoProfile: $vm.ronaldoProfile,
              rockProfile: $vm.rockProfile,
              meetraProfile: $vm.meetraProfile
            )
        }
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
            }label:{
                Image(systemName: "chevron.left")
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    LinkHistoryScreen()
}
