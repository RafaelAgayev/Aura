//
//  TravelViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import Foundation
internal import Combine
import SwiftUI

class TravelViewModel: BaseViewModel{
    
    @Published var model: [TravelModel] = []
    
    @Published var selectedModel: TravelModel? = nil
    
    func loadTravel(){
        
        model = [ TravelModel(
            id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(),
            title: "JW Marriot Hotel Baku.",
            description: """
              Step into JW Marriott Absheron Baku to discover modern luxury in a place where you can be mindful and present. This luxury hotel in Baku city center leaves no detail unattended, meticulously crafting a sanctuary that fosters the rejuvenation of your mind, body and soul. Guests can enjoy luxurious amenities alongside delicious dining options and vibrant bars to enhance their stay. Nestled in the city center, our JW Marriott Baku hotel is the perfect base for exploring. Our comfortable and stylish hotel provides effortless access to the city's cherished historical landmarks, the scenic Baku Boulevard, renowned shopping malls, the vibrant business area and much more.
              """,
            image: .marriottHotel,
            rank: 1442,
            liked: 4.8,
            location: "Baku, Azerbaijan"
        ),
                  TravelModel(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(),
                    title: "Raffles Hotel.",
                    description: """
                    Raffles Hotels & Resorts is a Singaporean chain of luxury hotels which traces its roots to 1887 with the opening of the original Raffles Hotel in Singapore. The company started to develop internationally in the late 1990s. Since 2015, Raffles has been a part of Accor.
                    """,
                    image: .rafflesHotel,
                    rank: 1022,
                    liked: 4.92,
                    location: "Singapore city, Singapore"
                  ),
                  TravelModel(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(),
                    title: "Fairmont Hotels & Resorts",
                    description: """
                    Fairmont Hotels & Resorts is a Canadian chain of luxury hotel that operates more than 70 properties worldwide, with a strong presence in Canada.
                    
                    The company originated from two hotel businesses established in the late 19th century, the Canadian Pacific Limited-owned Canadian Pacific Hotels & Resorts, and Fairmont Hotels. In 1999, Canadian Pacific Hotels acquired a majority interest in Fairmont Hotels; with Canadian Pacific Hotels later renaming its entire hotel portfolio under the Fairmont Hotels & Resorts banner in 2001. Shortly after the hotel division was renamed, Canadian Pacific Limited was split into several smaller companies in a starburst move, with Fairmont becoming a separately-traded company.
                    
                    In 2006, Fairmont was acquired by Colony Capital, who subsequently entered into a joint partnership with the Kingdom Holding Company; consolidating Fairmont with their other hotel brands, Raffles and Swissôtel to form Fairmont Raffles Hotels International (FRHI). FRHI in turn became a subsidiary of AccorHotels in 2016.
                    """,
                    image: .fairmontHotel,
                    rank: 899,
                    liked: 4.99,
                    location: "Toronto, Ontario, Canada"
                  ),
                  TravelModel(
                    id:  UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(),
                    title: "Pullman Hotels and Resorts",
                    description: "Pullman Hotels and Resorts is a French multinational upscale hotel brand owned by Accor. Pullman has 145 hotels and resorts in 42 countries spread across Africa, the Americas, Asia, Europe, the Middle-East and Oceania.",
                    image: .pullman,
                    rank: 1321,
                    liked: 4.74,
                    location: "Paris, France"
                  ),
                  TravelModel(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(),
                    title: "Coast Hotels",
                    description: """
                    Coast Hotels is a mid-range hotel chain in western North America with over 46 hotels and resorts in the US states of Alaska, Washington, Hawaii, California, and in the Canadian provinces of British Columbia, Alberta, Saskatchewan and Yukon. The chain has been a subsidiary of the Japan-based APA Group since 2016.[1] APA Group has caused some controversy in the past due to their owner's far right Japanese nationalist books distributed in APA's Japanese properties. Controversy extended to Canada in 2017 when antisemitic remarks by founder and CEO of APA Group, Toshio Motoya, were distributed in Coast Hotels Canadian properties.
                    
                    Coast Hotels range from suburban and airport properties such as those in Greater Vancouver; Edmonton, Alberta; Calgary, Alberta; Seattle, Washington, and Burbank,California to resort-designated properties such as: The Coast Osoyoos Beach Hotel in Osoyoos, British Columbia; the Hillcrest Hotel, a Coast Resort in Revelstoke, British Columbia; and the Coast Capri Hotel, in Kelowna, British Columbia.
                    
                    It has corporate offices in Vancouver and Seattle. It also manages two hotels that do not carry the Coast Hotels brand; The Campus Tower Suite Hotel at the University of Alberta, and Tekarra Lodge in Jasper, Alberta.
                    """,
                    image: .coastHotel,
                    rank: 324,
                    liked: 4.99,
                    location: "Paradise, Nevada, U.S.")
        ]
    }
}
