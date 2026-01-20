//
//  MusicViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 20.01.26.
//

import Foundation
import SwiftUI
internal import Combine

class MusicViewModel: ObservableObject{
    
    @Published var music: [MusicModel] = []
    
    func musicData() {
        music = [
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(),
                artist: "Inna",
                songName: "INNDia",
                image: .innaInndia,
                description: "INNdiA is a song by Romanian singer Inna featuring Romanian trio Play & Win. The music video was released on September 19, 2012." ),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(),
                artist: "Inna",
                songName: "Yalla",
                image: .innaYalla,
                description: """
                "Inna Yalla" refers to Romanian singer Inna's 2015 dance-pop single "Yalla," from her fourth album, featuring English lyrics with an Arabic chorus, known for its catchy tune and Moroccan-shot music video, becoming a hit in Romania and beyond. "Yalla" is a popular Arabic term meaning "Let's go" or "Hurry up," adding to the song's appeal. 
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(),
                artist: "Inna",
                songName: "Caliente",
                image: .innaCaliente,
                description: """
                "Caliente" (Spanish for "Hot") is a popular 2012 dance-pop song by Romanian singer Inna, featured on her album Party Never Ends. The track marked Inna's first song with Spanish lyrics, influenced by salsa and '90s dance, with a music video filmed in Costa Rica featuring Brazilian DJ Jesus Luz. While it saw mixed reviews, it was a significant release, appearing on Inna's Party Never Ends album and becoming part of her successful discography, which includes hits like "Hot" and "Amazing". 
                """),
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(),
                artist: "Inna",
                songName: "Sun is up",
                image: .innaSunIsUp,
                description: """
                "Sun Is Up" is a song recorded by Romanian singer Inna for her second studio album, I Am the Club Rocker (2011), and also included on several versions of her debut album Hot (2009).[A] Written and produced by Play & Win members Sebastian Barac, Radu Bolfea and Marcel Botezan, the song was released in October 2010 as the first single from I Am the Club Rocker. "Sun Is Up" is a rave pop track, and was compared to Sabrina's "Boys (Summertime Love)" (1987) by one reviewer.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(),
                artist: "Inna",
                songName: "Party never ends",
                image: .innaPartyNeverEnds,
                description: """
                Party Never Ends is the third studio album by Romanian singer Inna, released in 2013, featuring dance, hip-hop, and Latin influences with singles like "More than Friends" (ft. Daddy Yankee) and "In Your Eyes" (ft. Yandel). The English-language album was released by Roton and later Atlantic Records (US), known for its diverse production from DJ Frank E, Steve Mac, and Play & Win, showcasing Inna's evolving sound. 
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000006") ?? UUID(),
                artist: "Rihanna",
                songName: "Man down",
                image: .rihannaManDown,
                description: """
                "Man Down" is a reggae song which incorporates elements of ragga and electronic music. Lyrically, Rihanna is a fugitive after she shoots a man, an action she later regrets. Several critics singled out "Man Down" as Loud's highlight, while others commented on her prominent West Indian accent and vocal agility.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000007") ?? UUID(),
                artist: "Rihanna",
                songName: "Diamonds",
                image: .rihannaDiamonds,
                description: """
                The song premiered on September 26, 2012, during the Elvis Duran and the Morning Show and was digitally released the following day as the lead single from Unapologetic. "Diamonds" is a mid-tempo pop, electronic and R&B ballad that features heavy synthesizers, orchestral sounds and electronic rhythms.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000008") ?? UUID(),
                artist: "Rihanna",
                songName: "Russian roulette",
                image: .rihannaRussianRoulette,
                description: """
                "Russian Roulette" is a song recorded by Barbadian singer Rihanna for her fourth studio album, Rated R (2009). It premiered on radio stations worldwide on October 20, 2009, and was released as the album's lead single on October 26 by Def Jam Recordings. Written and produced by Ne-Yo and Chuck Harmony, "Russian Roulette" is a pop, pop rock and R&B ballad that contains dark, morbid, and tense atmospheric elements in its composition. Lyrically, the single is about an abusive romantic relationship that ended abruptly. Music critics noted the lyrical theme to be a response to the domestic violence case between Rihanna and her former boyfriend, singer and rapper Chris Brown.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000009") ?? UUID(),
                artist: "Rihanna",
                songName: "Rehab",
                image: .rihannaRehab,
                description: """
                "Rehab" is a song recorded by Barbadian singer Rihanna for her third studio album, Good Girl Gone Bad (2007). Def Jam Recordings serviced the song to contemporary hit radio in the United States on October 6, 2008, as the fifth and final single from the album. It was released in the United Kingdom as a CD single on December 8, 2008.

                Development of "Rehab" began while Rihanna was accompanying Timbaland on Justin Timberlake's FutureSex/LoveShow tour in 2007. Timberlake wrote the song in collaboration with his producers, Hannon Lane and Timbaland, and provided additional vocals. "Rehab" is a mid-paced R&B song with an emotional, melancholy chorus; the lyrics are about the protagonist's painful memories of her former lover, who is portrayed metaphorically as a disease.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000010") ?? UUID(),
                artist: "Rihanna",
                songName: "Where have you been",
                image: .rihannaWhereHaveYouBeen,
                description: """
                "Where Have You Been" is a popular dance-pop/trance song by Barbadian singer Rihanna from her 2011 album Talk That Talk, released as a single in April 2012, known for its hard synths and electro-inspired breakdown, with music video choreography influencing Just Dance video game routines. 
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000011") ?? UUID(),
                artist: "Rihanna",
                songName: "Rude boy",
                image: .rihannaRudeBoy,
                description: """
                "Rude Boy" is a song by Barbadian singer Rihanna, taken from her fourth studio album, Rated R (2009). It was released as the album's fourth overall and third international single on February 5, 2010, through Def Jam. Rihanna co-wrote the song with Ester Dean, Makeba Riddick, and producers Rob Swire and Stargate. "Rude Boy" is a clubby midtempo dancehall and R&B song which incorporates elements of raggamuffin. The song received mixed to positive reviews from critics; some have called it the highlight of the album, but others criticized Rihanna's "monotone" and "icy" vocal performance. However, opinion of the song has improved over time, and several critics have retrospectively ranked it as one of the strongest releases in her discography.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000012") ?? UUID(),
                artist: "Rihanna",
                songName: "Rocky",
                image: .rihannaRocky,
                description: """
                Rihanna and A$AP Rocky's musical connection on Wikipedia involves collaborations like the remix of Rihanna's "Cockiness (Love It)," where Rocky rapped the first verse, performed together at the 2012 MTV VMAs, and their shared musical exploration on Rihanna's rock-influenced Rated R album (2009) and Rocky's tracks like "Fashion Killa" (from his Long. Live. A$AP album), showcasing a blend of R&B, pop, and hip-hop with Rocky often adding rap verses to Rihanna's tracks. 
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000013") ?? UUID(),
                artist: "Rihanna",
                songName: "Breakin' dishes",
                image: .rihannaBreakinDishes,
                description: """
                "Breakin' Dishes" is a popular song by Rihanna from her 2007 album Good Girl Gone Bad, co-written and produced by Christopher Stewart and Terius Nash (The-Dream). The song, a blend of R&B and dance-pop, received positive critical acclaim, became a club hit, and saw a resurgence in popularity via TikTok in 2025. 
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000014") ?? UUID(),
                artist: "Lonown",
                songName: "Avangard",
                image: .lonownAvangard,
                description: """
                "LONOWN" likely refers to an electronic music artist on Last.fm (LONOWN), while "Avangard" refers to Russia's Avangard (hypersonic glide vehicle) (Avangard), a hypersonic weapon; "Wikipedia" confirms Avangard's capabilities (Mach 20-27) but the "AI" part of your query is a misinterpretation, possibly linking the cutting-edge tech of Avangard with modern AI concepts, or confusing it with another term. 
                """),
            
            MusicModel(
                    id: UUID(uuidString: "00000000-0000-0000-0000-000000000015") ?? UUID(),
                    artist: "Sam Smith",
                    songName: "Unholy",
                    image: .samSmithUnholy,
                    description: """
                    "Unholy" is a song by British singer Sam Smith and German singer Kim Petras. It was released on 22 September 2022 through EMI Records and Capitol Records as the second single from Smith's fourth studio album Gloria (2023) and as a bonus track on Petras' debut studio album Feed the Beast (2023). It was teased by Smith on their TikTok account a month before its release and went viral due to its use in thirst trap-style videos. Produced by Ilya, Omer Fedi, Blake Slatkin, Jimmy Napes, and Cirkut and written by them alongside Smith and Petras, "Unholy" is a sexually charged electropop, dance-pop, and synth-pop song with choral and hyperpop influences. It uses the Phrygian dominant scale and its lyrics are about a family man who cheats on his wife at a strip club.
                    """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000016") ?? UUID(),
                artist: "LP",
                songName: "Lost on you",
                image: .lpLostOnYou,
                description: """
                "Lost on You" is a song recorded by American recording artist LP (Laura Pergolizzi). It was released on November 20, 2015, as the second single from their third EP, Death Valley and the fourth studio album of the same name (2016). The song experienced commercial success, mostly in Central and Eastern Europe and Western Asia, and topped the charts of thirteen countries.

                The single was certified quadruple Platinum by the Federation of the Italian Music Industry for sales exceeding 200,000 units. By November 2018, "Lost on You" received a release as a single in Mexico to much success. It was among the most-played songs on Top 40 radio stations in the country, mainly popular in Mexico City. In 2023, the song was included in the soundtrack of the Brazilian telenovela Terra e Paixão.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000017") ?? UUID(),
                artist: "LP",
                songName: "Other people",
                image: .lpOtherPeople,
                description: """
                "Other People" is a song recorded by American recording artist LP (Laura Pergolizzi). It was released on March 19, 2016, as
                the second single from their third EP, Death Valley and the fourth studio album of the same name (2016). The song
                experienced commercial success, mostly in Central and Eastern Europe and Western Asia, and topped the charts of thirteen
                countries.

                The single was certified quadruple Platinum by the Federation of the Italian Music Industry for sales exceeding 200,000 units. By November 2018, "Lost on You" received a release as a single in Mexico to much success. It was among the most-played songs on Top 40 radio stations in the country, mainly popular in Mexico City. In 2023, the song was included in the soundtrack of the Brazilian telenovela Terra e Paixão.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000018") ?? UUID(),
                artist: "Adele",
                songName: "Set fire to the rain",
                image: .adeleSetFireToTheRain,
                description: """
                "Set Fire to the Rain" is a song recorded by English singer-songwriter Adele for her second studio album, 21 (2011). The song was written by Adele and Fraser T. Smith while the production was handled by the latter. It became Adele's third consecutive US number-one single from 21 and reached the top ten in most of other foreign markets. It is a pop power ballad with lush instrumentation and a swelling string arrangement, in contrast to the understated production of most songs on the album. The song has received acclaim from various critics with many complimenting on Adele's vocals. "Set Fire to the Rain" was voted by readers of Billboard as their favorite number one hit of 2012.[3] Though no official music video was released for the song, a live performance from the DVD Live at the Royal Albert Hall was uploaded to video-sharing website YouTube. This rendition won the Grammy Award for Best Pop Solo Performance at the 55th Annual Grammy Awards.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000019") ?? UUID(),
                artist: "Adele",
                songName: "Skyfall",
                image: .adeleSkyfall,
                description: """
                "Skyfall" is a song recorded by British singer Adele for the James Bond film of the same name. It was written by Adele and producer Paul Epworth and features orchestration by J. A. C. Redford. Eon Productions invited the singer to work on the theme song in early 2011, a task that Adele accepted after reading the film's script. While composing the song, Adele and Epworth aimed to capture the mood and style of the other Bond themes, including dark and moody lyrics descriptive of the film's plot. "Skyfall" was released at 0:07 BST on 5 October 2012 as part of the Global James Bond Day, celebrating the 50th anniversary of the release of Dr. No, the first James Bond film.
                """),
            
            MusicModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000020") ?? UUID(),
                artist: "Adele",
                songName: "Someone like you",
                image: .adeleSomeoneLikeYou,
                description: """
                "Someone like You" is a song recorded by English singer-songwriter Adele. She and Dan Wilson wrote and produced the track for her second studio album, 21 (2011). XL Recordings released the song as the second single from the album on 24 January 2011 (the same day the album was released) in the United Kingdom and on 9 August 2011 in the United States. Accompanied only by a piano in the song (played by co-writer Wilson), Adele sings about the end of the relationship with her ex-partner who has moved on with someone else.
                """),
            
            ]
    }
}
