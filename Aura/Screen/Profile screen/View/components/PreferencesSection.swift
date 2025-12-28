//
//  PreferencesSection.swift
//  Aura
//
//  Created by Rafael Agayev on 23.12.25.
//

import SwiftUI

struct PreferencesSection: View {
    
    @State private var notificationEnabled: Bool = false
        
    @AppStorage("app_theme") private var theme: Int = AppTheme.system.rawValue
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            Toggle("Enable notification", isOn: $notificationEnabled)
            
            Picker("Selection theme", selection: $theme){
                
                Text("Light")
                    .tag(AppTheme.light.rawValue)
                
                Text("Dark")
                    .tag(AppTheme.dark.rawValue)
                
                Text("System")
                    .tag(AppTheme.system.rawValue)
                
            }
            .foregroundStyle(.colorBlack)
            .pickerStyle(.navigationLink)
        }
        .padding()
      
    }
}


#Preview {
    PreferencesSection()
}
