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
    
    var onChange: ((String, String) -> Void)? = nil
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            Toggle("Enable notification", isOn: $notificationEnabled)
            
            Picker("Selection theme", selection: $theme){
                
                Text("Light")
                    .tag(AppTheme.light.rawValue)
                    .foregroundStyle(.primary)
                
                Text("Dark")
                    .tag(AppTheme.dark.rawValue)
                    .foregroundStyle(.primary)
                
                Text("System")
                    .tag(AppTheme.system.rawValue)
                    .foregroundStyle(.primary)
                
            }
            .onChange(of: theme) { oldValue, newValue in
                onChange?("New theme is:", theme.description)
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
