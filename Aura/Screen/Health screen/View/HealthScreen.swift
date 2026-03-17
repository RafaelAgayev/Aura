//
//  HealthScreen.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import CoreData

struct HealthScreen: View {
    
    @Environment(\.managedObjectContext) private var context
    
    @Environment(\.dismiss) private var dismiss

    @StateObject private var historyVM: HistoryViewModel
    
    @StateObject private var vm: HealthScreenViewModel
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading
    
    @State private var screen: Screen? = nil
    
    @State private var emoji: HealthScreenViewModel.Emoji?
    

    init() {
        let context = PersistenceController.shared.container.viewContext
        let historyVM = HistoryViewModel(context: context)
        
        _historyVM = StateObject(wrappedValue: historyVM)
        _vm = StateObject(wrappedValue: HealthScreenViewModel(historyVM: historyVM))
    }
    
    var body: some View {
        
        ScrollView{
            content
            
        }
        
        historyButton
        .navigationDestination(item: $screen){ change in
            switch change{
            case .camera:
                CameraPicker { image in
                    Task{
                        await vm.analyzeFace(image)
                    }
                }
                .ignoresSafeArea()
            case .history:
                
                HistoryScreen(vm: historyVM)
            }
        }
        .onChange(of: vm.isLoading) { _, isLoading in
            if isLoading{
                showLoading()
            }else{
                hideLoading()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    private var historyButton: some View{
        Text("View History")
            .fontModifier(size: 17, weight: .semibold, foregroundColor: .colorWhite)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .padding()
            .background(
                Color.colorBlue
                    .opacity(0.68)
                    .roundedCorners(cornerRadius: 12)
                    .shadow(radius: 1.33)
            )
            .onTapGesture {
                screen = .history
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 24) {
            HealthHeader(navigation: $screen, vm: vm)
            
            TodayInsightCard(text: vm.todayInsight)
            
            HealthStatsCard(healthVM: vm)
            
            AISuggestionsSection()
            
            MoodHistorySection(healthVM: vm, emoji: $emoji)
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

extension HealthScreen{
    enum Screen{
        case camera, history
    }
}

//#Preview {
//    HealthScreen()
//}
