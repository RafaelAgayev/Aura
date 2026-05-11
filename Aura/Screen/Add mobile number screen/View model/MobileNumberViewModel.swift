//
//  MobileNumberViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 10.05.26.
//

import Foundation
import SwiftUI

class MobileNumberViewModel: BaseViewModel{
    
    
    var account: [ProfileModel] = [
        .init(profilImg: .baby, name: "Rafael", socialWebIcon: .iconFacebook, userName: "Rafa El", socialWebName: "Facebook"),
        .init(profilImg: .ronaldo, name: "Zakir Qaralov", socialWebIcon: .iconInstagramColored, userName: "zakir.qaralov32", socialWebName: "Instagram"),
        .init(profilImg: .thomasShelby, name: "Rafael", socialWebIcon: .iconInstagramColored, userName: "r.a_rus", socialWebName: "Instagram")
    ]
    
}
