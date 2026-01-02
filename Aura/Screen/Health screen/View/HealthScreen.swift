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
        
        NavigationLink{
            HistoryScreen(vm: historyVM)
        } label: {
            Text("View History")
                .fontModifier(size: 17, weight: .semibold, foregroundColor: .colorWhite)
                
                .frame(width: 200, height: 30)
                .padding()
                .background(
                    Color.colorAccent
                        .roundedCorners(cornerRadius: 15)
                        .shadow(radius: 2.33)
                )
               
        }
        .padding(.top, 12)
        .padding(.leading, 18)

        .navigationDestination(isPresented: $vm.showCamera) {
            CameraPicker { image in
                Task{
                    await vm.analyzeFace(image)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    private var content: some View{
        VStack(alignment: .leading, spacing: 24) {
            
            HealthHeader(showCamera: $vm.showCamera)
            
            TodayInsightCard(text: vm.todayInsight)
            
            HealthStatsCard(healthVM: vm)
            
            AISuggestionsSection()
            
            MoodHistorySection(healthVM: vm)
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

//#Preview {
//    HealthScreen()
//}
