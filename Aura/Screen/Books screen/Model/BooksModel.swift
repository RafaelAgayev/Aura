//
//  BooksModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import Foundation
import SwiftUI

struct BooksModel: Identifiable, Hashable{
    let id: UUID
    let title: String
    let author: String
    let description: String
    let image: ImageResource?
    let year: String
}
