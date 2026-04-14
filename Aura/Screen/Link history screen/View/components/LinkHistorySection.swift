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
    
    @State private var linked: Linked?
    
//    let transform: CGAffineTransform = {
//        var transform = CGAffineTransform.identity
//        transform.c = cosh(0)
//        return transform
//    }()
    
    @State private var scaleEffect = false
    
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        if let mark = URL(string: marksProfile),
            let rafael = URL(string: rafaelProfile),
           let cristiano = URL(string: ronaldoProfile),
           let rock = URL(string: rockProfile),
           let meetra = URL(string: meetraProfile)
        {
            Button("Mark Zuckerberg"){
                linked = .mark
                openURL(mark)
            }
            .scaleEffect(scaleEffect ? 1.2 : 1.0)
//          .projectionEffect(ProjectionTransform(transform))
            .onAppear{
                scaleEffect = false
                withAnimation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true)
                ){
                    scaleEffect = true
                }
            }
            .foregroundStyle(.primary)
            
            Button("Rafael Agayev"){
                linked = .rafael
                openURL(rafael)
            }
            .foregroundStyle(.primary)
            
            Button("Cristiano"){
                linked = .cristiano
                openURL(cristiano)
            }
            .foregroundStyle(.primary)
            
            Button("The Rock"){
                linked = .rock
                openURL(rock)
            }
            .foregroundStyle(.primary)
            
            Button("Meetra"){
                linked = .meetra
                openURL(meetra)
            }
            .foregroundStyle(.primary)
            
        }
        
    }
}

extension LinkHistorySection{
    enum Linked{
        case mark, rafael, cristiano, rock, meetra
    }
}
