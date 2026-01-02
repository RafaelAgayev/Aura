//
//  DashboardSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import CoreData

struct DashboardSection: View {
    
    @State private var showCamera = false
    
    @State private var capturedImage: UIImage?
    
    @State private var showCameraAlert = false
    
    let loginVM: LoginScreenViewModel
    
    @StateObject private var historyVM: HistoryViewModel
    
    init(historyVM: HistoryViewModel, loginVM: LoginScreenViewModel) {
        _historyVM = StateObject(wrappedValue: historyVM)
        self.loginVM = loginVM
    }
    
    
    
    var body: some View {
        
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16
        ){
            DashBoard(
                title: "Mood",
                subtitle: "How do you feel?",
                icon: "face.smiling"
            )
            .onTapGesture{
                showCamera = true
            }
            
            NavigationLink{
                HealthScreen()
            }label:{
                DashBoard(
                    title: "Health",
                    subtitle: "Daily status",
                    icon: "heart.text.square"
                )
            }
            
            NavigationLink{
                HistoryScreen(vm: historyVM)
            }label:{
                DashBoard(
                    title: "History",
                    subtitle: "Your activity",
                    icon: "clock.arrow.circlepath"
                )
            }
            NavigationLink{
                ProfileScreen(loginVM: loginVM)
            }label:{
                DashBoard(
                    title: "Profile",
                    subtitle: "Your info",
                    icon: "person.crop.circle"
                )
            }
            
            NavigationLink{
                ReminderScreen()
            }label:{
              
                DashBoard(
                    title: "Reminder",
                    subtitle: "Scan your today mood",
                    icon: "bell"
                )
            }
            .navigationDestination(isPresented: $showCamera) {
                CameraPicker { image in
                    capturedImage = image
                }
                .ignoresSafeArea()
            }
            .alert("Mood scan", isPresented: $showCameraAlert) {
                Button("Start") {
                    showCamera = true
                }
                Button("Cancel", role: .cancel) {}
            }message:{
                Text("We'll your analyze with camera")
            }
        }
    }
}

//#Preview {
//    DashboardSection()
//}
