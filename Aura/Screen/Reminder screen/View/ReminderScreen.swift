//
//  ReminderScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import SwiftUI

@available(iOS 18.0, *)
struct ReminderScreen: View {
    
    @StateObject private var vm: ReminderViewModel
        
    @Environment(\.dismiss) private var dismiss
    
    init(historyVM: HistoryViewModel) {
            _vm = StateObject(wrappedValue: ReminderViewModel(historyVM: historyVM))
        }
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    var body: some View {
        content
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 12){
            
            Form{
                
                ReminderHeader()
                
                ReminderRepeatDaily(repeatDaily: $vm.repeatDaily, isEnabled: $vm.isEnabled)
                
                ReminderToggleSection(isEnabled: $vm.isEnabled)
                
                ReminderTimeSection(isEnabled: $vm.isEnabled, reminderTime: $vm.tempTime)
                   
                SaveSection(onSave: {
                    vm.reminderTime = vm.tempTime
                    vm.save()
                    dismiss()
                }
                )
            }
            .formStyle(.grouped)
        }
        .onChange(of: vm.isEnabled) {
            if !vm.isEnabled{
                vm.disableReminder()
            }
        }
        .onChange(of: vm.isLoading) { _, isLoading in
            isLoading ? showLoading() : hideLoading()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
        .onAppear{
            vm.requestPermission()
            vm.tempTime = vm.reminderTime
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
