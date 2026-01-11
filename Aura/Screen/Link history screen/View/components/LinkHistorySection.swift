//
//  LinkHistorySection.swift
//  Aura
//
//  Created by Rafael Agayev on 12.01.26.
//

import SwiftUI

struct LinkHistorySection: View {
    
    @Binding var marksProfile: String
    
    @Binding var rafaelProfile: String
    
    @Binding var ronaldoProfile: String
    
    @Binding var rockProfile: String
    
    @Binding var meetraProfile: String
    
    var body: some View {
        
        Link("Mark Zuckerberg", destination: URL(string: marksProfile)!)
            .foregroundStyle(.primary)
        
        Link("Rafael Agayev", destination: URL(string: rafaelProfile)!)
            .foregroundStyle(.primary)
        
        Link("Cristiano", destination: URL(string: ronaldoProfile)!)
            .foregroundStyle(.primary)
        
        Link("The Rock", destination: URL(string: rockProfile)!)
            .foregroundStyle(.primary)
        
        Link("Meetra", destination: URL(string: meetraProfile)!)
            .foregroundStyle(.primary)
        
    }
}
