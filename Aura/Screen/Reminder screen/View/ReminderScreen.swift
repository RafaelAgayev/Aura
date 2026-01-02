//
//  ReminderScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

struct ReminderScreen: View {
    
    @StateObject private var vm = ReminderViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        content
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 12){
            
            Form{
                
                ReminderHeader()
                
                ReminderRepeatDaily(repeatDaily: $vm.repeatDaily, isEnabled: $vm.isEnabled)
                
                ReminderToggleSection(isEnabled: $vm.isEnabled)
                
                ReminderTimeSection(isEnabled: $vm.isEnabled, reminderTime: $vm.reminderTime)
                
                SaveSection(onSave: {
                    vm.save()
                    dismiss()
                }
                )
            }
            .formStyle(.grouped)
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
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

#Preview {
    ReminderScreen()
}
