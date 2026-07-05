//
//  PersonalViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 03.05.26.
//

import Foundation
import SwiftUI

@Observable
class PersonalViewModel: BaseViewModel{
    
    var model: [ProfileModel] = [
        ProfileModel(
            profilImg: .thomasShelby,
            name: "Rafael Agayev",
            socialWebIcon: .iconInstagramColored,
            userName: "r.a_rus",
            socialWebName: "Instagram"),
        
        ProfileModel(
           
            profilImg: .ronaldo,
            name: "Zakir Qaralov",
            socialWebIcon: .iconInstagramColored,
            userName: "zakir_qaralov32",
            socialWebName: "Instagram"),
        
        ProfileModel(
            
            profilImg: .baby,
            name: "Rafael Agayev",
            socialWebIcon: .iconFacebook,
            userName: "Rafael Agayev",
            socialWebName: "Facebook • Locked"
        )
    ]
}
