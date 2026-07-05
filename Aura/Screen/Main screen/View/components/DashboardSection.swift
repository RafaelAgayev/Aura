//
//  DashboardSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI
import CoreData

struct DashboardSection: View {
        
    @State private var capturedImage: UIImage?
    
    @State private var showCameraAlert = false
    
    let loginVM: LoginScreenViewModel
    
    @StateObject private var historyVM: HistoryViewModel
    
    @State private var navigation: Navigation?
    
    init(historyVM: HistoryViewModel, loginVM: LoginScreenViewModel) {
        _historyVM = StateObject(wrappedValue: historyVM)
        self.loginVM = loginVM
    }
    
    @Environment(\.showLoading) private var showLoading
    
    @Environment(\.hideLoading) private var hideLoading

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
                navigation = .camera
            }
                DashBoard(
                    title: "Health",
                    subtitle: "Daily status",
                    icon: "heart.text.square"
                )
                .onTapGesture {
                    navigation = .health
                }
                .onChange(of: historyVM.isLoading) { _, newValue in
                    if newValue{
                        showLoading()
                    }else{
                        hideLoading()
                    }
            }
            
          
                DashBoard(
                    title: "History",
                    subtitle: "Your activity",
                    icon: "clock.arrow.circlepath"
                )
                .onTapGesture {
                    navigation = .history
                }
           
                DashBoard(
                    title: "Profile",
                    subtitle: "Your info",
                    icon: "person.crop.circle"
                )
                .onTapGesture {
                    navigation = .profile
                }
                DashBoard(
                    title: "Reminder",
                    subtitle: "Scan your today mood",
                    icon: "bell"
                )
                .onTapGesture {
                    navigation = .reminder
                }
            
          
                DashBoard(
                    title: "Actions",
                    subtitle: "You can watch actions",
                    icon: "waveform.path.ecg"
                    )
                .onTapGesture {
                    navigation = .actions
                }
                .onChange(of: historyVM.isLoading) { _, newValue in
                    if newValue{
                        showLoading()
                    }else{
                        hideLoading()
                    }
                }
            }
        .navigationDestination(item: $navigation) { navigate in
            switch navigate{
            case .actions:
                ActionsScreen()
            case .camera:
                CameraPicker { image in
                    capturedImage = image
                }
                .ignoresSafeArea()
            case .health:
                HealthScreen()
            case .profile:
                ProfileScreen(loginVM: loginVM, historyVM: historyVM)
                
            case .history:
                HistoryScreen(vm: historyVM)
            case .reminder:
                if #available(iOS 18.0, *) {
                    ReminderScreen(historyVM: historyVM)
                } else {
                    
                }
            case .mood:
                CameraPicker { image in
                    capturedImage = image
                }
                .ignoresSafeArea()
            }
        }
        .alert("Mood scan", isPresented: $showCameraAlert ) {
            Button("Start") {
                navigation = .camera
        }
        Button("Cancel", role: .cancel) {}
    }message:{
        Text("We'll your analyze with camera")
    }
    }
}

extension DashboardSection{
    enum Navigation{
        case mood, health, history, profile, reminder, actions, camera
    }
}
