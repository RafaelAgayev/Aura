//
//  ProfileModel.swift
//  Aura
//
//  Created by Rafael Agayev on 03.05.26.
//

import Foundation

import SwiftUI

struct ProfileModel: Identifiable{
    let id = UUID()
    
    var profilImg: ImageResource
    
    var name: String
    
    var socialWebIcon: ImageResource
    
    var userName: String
    
    var socialWebName: String
}
