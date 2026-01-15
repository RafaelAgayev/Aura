//
//  BooksViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 15.01.26.
//

import Foundation
internal import Combine

class BooksViewModel: BaseViewModel{
    
    @Published var details: Bool = false
    
    @Published var selectedBook: BooksModel? = nil
    
    @Published var books: [BooksModel] = []
    
    func loadBooks() {
        books = [
            BooksModel(
            id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(),
            title: "Non-Suspicious",
            author: "Ed Church",
            description: """
                Someone is killing British war veterans. Homicide can’t see anything suspicious. In fact, the only person asking questions is a jaded Met detective with breakfast beers on his mind. Shame for the killer…

                You shouldn’t underestimate Brook Deelman.

                Standing between Brook and the truth: a police cover-up, a professional hitman, and a dark secret going back to the final throes of WW2. But what exactly happened in those last days at Stalag IV-B? And why is the past catching up with people now?

                In a web of loyalty and betrayal, revenge and redemption, an old police saying has never been truer: Assume nothing. The closer Brook Deelman gets to the heart of the conspiracy… the more seismic the twists will become.
             """,
            image: .nonSuspicious,
            year: "2020"),
        BooksModel(
            id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(),
            title: "Les Misérables",
            author: "Victor Hugo",
            description: """
            In the English-speaking world, the novel is usually referred to by its original French title. However, several alternatives have been used, including The Miserables, The Wretched, The Miserable Ones, The Poor Ones, The Wretched Poor, The Victims, and The Dispossessed. Beginning in 1815 and culminating in the 1832 June Rebellion in Paris, the novel follows the lives and interactions of several characters, particularly the struggles of ex-convict Jean Valjean and his experience of redemption.

            Examining the nature of law and grace, the novel elaborates upon the history of France, the architecture and urban design of Paris, politics, moral philosophy, antimonarchism, justice, religion, and the types and nature of romantic and familial love.
            """,
            image: .lesMiserables,
            year: "1815"),
        BooksModel(
            id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(),
            title: "Martin Eden",
            author: "Jack London",
            description: """
            Martin Eden is a 1909 novel by American author Jack London about a young proletarian autodidact struggling to become a writer. It was first serialized in The Pacific Monthly magazine from September 1908 to September 1909 and then published in book form by Macmillan in September 1909.

            Eden represents writers' frustration with publishers. The central theme of Eden's developing artistic sensibilities places the novel in the tradition of the Künstlerroman, which narrates an artist's formation and development.

            Eden differs from London in rejecting socialism, attacking it as "slave morality" and relying on Nietzschean individualism. Nevertheless, in the copy of the novel which he inscribed for Upton Sinclair, London wrote, "One of my motifs, in this book, was an attack on individualism (in the person of the hero). I must have bungled it, for not a single reviewer has discovered it."
            """,
            image: .martinEden,
            year: "1909"),
            BooksModel(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(),
                title: "The Idiot",
                author: "Fyodor Dostoyevsky",
                description: """
                The Idiot (pre-reform Russian: Идіотъ; post-reform Russian: Идиот, romanized: Idiót) is a novel by the 19th-century Russian author Fyodor Dostoevsky. It was first published serially in the journal The Russian Messenger in 1868–1869.

                The title is an ironic reference to the central character of the novel, Lev Nikolayevich Myshkin, a young prince whose goodness, open-hearted simplicity, and guilelessness lead many of the more worldly characters he encounters to mistakenly assume that he lacks intelligence and insight. In the character of Prince Myshkin, Dostoevsky set himself the task of depicting "the positively good and beautiful man."[1] The novel examines the consequences of placing such a singular individual at the centre of the conflicts, desires, passions, and egoism of worldly society, both for the man himself and for those with whom he becomes involved.

                Joseph Frank describes The Idiot as "the most personal of all Dostoevsky's major works, the book in which he embodies his most intimate, cherished, and sacred convictions."[2] It includes descriptions of some of his most intense personal ordeals, such as epilepsy and mock execution, and explores moral, spiritual, and philosophical themes consequent upon them. His primary motivation in writing the novel was to subject his own highest ideal, that of true Christian love, to the crucible of contemporary Russian society.

                The artistic method of conscientiously testing his central idea meant that the author could not always predict where the plot was going as he was writing. The novel has an awkward structure, and many critics have commented on its seemingly chaotic organization. According to Gary Saul Morson, "The Idiot violates every critical norm and yet somehow manages to achieve real greatness."[3] Dostoevsky himself was of the opinion that the experiment was not entirely successful, but the novel remained his favourite among his works. In a letter to Nikolay Strakhov he wrote, "Much in the novel was written hurriedly, much is too diffuse and did not turn out well, but some of it did turn out well. I do not stand behind the novel, but I do stand behind the idea."
                """,
                image: .idiot,
                year: "1868-1869")
    ]
    }
}
