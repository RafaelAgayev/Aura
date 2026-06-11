//
//  SocialInteractionsViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 08.06.26.
//

import Foundation

@Observable
class SocialInteractionsViewModel: BaseViewModel{
    var model: [ProfileModel] = [
        ProfileModel(profilImg: .baby, name: "Rafael", socialWebIcon: .iconFacebook, userName: "Rafa El", socialWebName: "Facebook"),
        
        ProfileModel(profilImg: .ronaldo, name: "Rafael", socialWebIcon: .iconInstagramColored, userName: "zakir.qaralov32", socialWebName: "Instagram"),
        
        ProfileModel(profilImg: .thomasShelby, name: "Rafael Agayev", socialWebIcon: .iconInstagramColored, userName: "r.a_rus", socialWebName: "Instagram")
    ]
}
