import Foundation

public final class Taylor {
    public static func word() -> String {
        return bucket.randomElement()!
    }
    
    public static func words(_ count: Int) -> String {
        return (1...count).map { _ in word() }.joined(separator: " ")
    }
    
    public static func words(_ range: Range<Int>) -> String {
        return words(Int.random(in: range))
    }
    
    public static func words(_ range: ClosedRange<Int>) -> String {
        return words(Int.random(in: range))
    }
    
    public static func sentence() -> String {
        let result = words(Int.random(in: wordsPerSentence))
        
        return result.prefix(1).capitalized + result.dropFirst() + "."
    }
    
    public static func sentences(_ count: Int) -> String {
        return (1...count).map { _ in sentence() }.joined(separator: " ")
    }
    
    public static func sentences(_ range: Range<Int>) -> String {
        return sentences(Int.random(in: range))
    }
    
    public static func sentences(_ range: ClosedRange<Int>) -> String {
        return sentences(Int.random(in: range))
    }

    public static func paragraph() -> String {
        return sentences(Int.random(in: sentencesPerParagraph))
    }
    
    public static func paragraphs(_ count: Int) -> String {
        return (1...count).map { _ in paragraph() }.joined(separator: "\n")
    }
    
    public static func paragraphs(_ range: Range<Int>) -> String {
        return paragraphs(Int.random(in: range))
    }
    
    public static func paragraphs(_ range: ClosedRange<Int>) -> String {
        return paragraphs(Int.random(in: range))
    }
    
    public static func title() -> String {
        return words(Int.random(in: wordsPerTitle)).capitalized
    }

    fileprivate static let wordsPerSentence = 5...15
    fileprivate static let sentencesPerParagraph = 3...7
    fileprivate static let wordsPerTitle = 2...6

    fileprivate static let bucket = [
        "lorem",
        "ipsum",
        "dolor",
        "sit",
        "amet",
        "consectetur",
        "adipiscing",
        "elit",
        "sed",
        "do",
        "eiusmod",
        "tempor",
        "incididunt",
        "ut",
        "labore",
        "et",
        "dolore",
        "magna",
        "aliqua",
        "ut",
        "enim",
        "ad",
        "minim",
        "veniam",
        "quis",
        "nostrud",
        "exercitation",
        "ullamco",
        "laboris",
        "nisi",
        "ut",
        "aliquip",
        "ex",
        "ea",
        "commodo",
        "consequat",
        "duis",
        "aute",
        "irure",
        "dolor",
        "in",
        "reprehenderit",
        "in",
        "voluptate",
        "velit",
        "esse",
        "cillum",
        "dolore",
        "eu",
        "fugiat",
        "nulla",
        "pariatur",
        "excepteur",
        "sint",
        "occaecat",
        "cupidatat",
        "non",
        "proident",
        "sunt",
        "in",
        "culpa",
        "qui",
        "officia",
        "deserunt",
        "mollit",
        "anim",
        "id",
        "est",
        "laborum"
    ]
}
