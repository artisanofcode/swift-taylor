import XCTest
@testable import Taylor

final class TaylorTests: XCTestCase {
    private func checkWord(_ word: String) {
        XCTAssert(word.count > 0, "word must not be zero length")
    }

    private func checkWords(_ words: String) {
        var unique: Set<String> = []

        for word in words.split(separator: " ", omittingEmptySubsequences: false) {
            checkWord(String(word))
            unique.insert(String(word))
        }
        

        if words.split(separator: " ").count > 1 {
            XCTAssert(unique.count > 1, "multiple words should be different")
        }
    }

    private func checkSentence(_ sentence: String) {
        XCTAssert(sentence.hasSuffix("."), "sentence must end in a period")
        XCTAssert(sentence == sentence.trimmingCharacters(in: .whitespacesAndNewlines), "sentence must not have surrounding whitespace")
        XCTAssert(sentence.prefix(1) == sentence.prefix(1).capitalized, "sentence must start with capital")
        XCTAssert(sentence.dropFirst() == sentence.dropFirst().lowercased(), "only first letter of sentence must be capitalised")
        XCTAssert((5...15).contains(sentence.split(separator: " ").count), "sentence must contain 5 to 15 words")

        checkWords(String(sentence.dropLast()))
    }

    private func checkSentences(_ sentences: String) {
        var unique: Set<String> = []

        XCTAssert(sentences.hasSuffix("."), "sentence must end in a period")
        XCTAssert(sentences == sentences.trimmingCharacters(in: .whitespacesAndNewlines), "sentences must not have surrounding whitespace")

        for sentence in (" " + sentences).split(separator: ".", omittingEmptySubsequences: false).dropLast() {
            XCTAssert(sentence == " " + sentence.trimmingCharacters(in: .whitespaces), "sentences must be seperated by a single space")
            checkSentence(sentence.dropFirst() + ".")
            unique.insert(String(sentence))
        }

        if sentences.split(separator: ".").count > 1 {
            XCTAssert(unique.count > 1, "multiple sentences should be different")
        }
    }

    private func checkParagraph(_ paragraph: String) {
        checkSentences(paragraph)

        XCTAssert(paragraph.hasSuffix("."), "paragraphs must end in a period")

        XCTAssert((3...7).contains(paragraph.split(separator: ".").count), "paragraph must contain 3 to 7 sentences")
    }

    private func checkParagraphs(_ paragraphs: String) {
        var unique: Set<String> = []

        XCTAssert(paragraphs.hasSuffix("."), "paragraph must end in a period")
        XCTAssert(paragraphs == paragraphs.trimmingCharacters(in: .whitespacesAndNewlines), "paragraphs must not have surrounding whitespace")

        for paragraph in paragraphs.split(separator: "\n", omittingEmptySubsequences: false) {
            checkParagraph(String(paragraph))
            unique.insert(String(paragraph))
        }
        
        if paragraphs.split(separator: "\n").count > 1 {
            XCTAssert(unique.count > 1, "multiple paragraphs should be different")
        }
    }

    func testWord() {
        var unique: Set<String> = []

        for _ in 1...10 {
            let word = Taylor.word()

            checkWord(word)

            unique.insert(word)
        }
        
        XCTAssert(unique.count > 1, "must return different values on each call")
    }

    func testSentence() {
        var unique: Set<String> = []

        for _ in 1...10 {
            let sentence = Taylor.sentence()

            checkSentence(sentence)

            unique.insert(sentence)
        }
        
        XCTAssert(unique.count > 1, "must return different values on each call")
    }

    func testParagraph() {
        var unique: Set<String> = []

        for _ in 1...10 {
            let paragraph = Taylor.paragraph()

            checkParagraph(paragraph)

            unique.insert(paragraph)
        }
        
        XCTAssert(unique.count > 1, "must return different values on each call")
    }

    func testWords() {
        for count in 1...10 {
            let words = Taylor.words(count)

            checkWords(words)

            XCTAssert(words.split(separator: " ").count == count, "must generated requested number of words")
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)...Int.random(in: 12...20))
            
            let words = Taylor.words(range)

            checkWords(words)

            XCTAssert((range).contains(words.split(separator: " ").count), "must generated a number of words in range")
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)..<Int.random(in: 12...20))
            
            let words = Taylor.words(range)

            checkWords(words)

            XCTAssert((range).contains(words.split(separator: " ").count), "must generated a number of words in range")
        }
    }

    func testSentences() {
        for count in 1...10 {
            let sentences = Taylor.sentences(count)
            
            checkSentences(sentences)

            XCTAssert(sentences.split(separator: ".").count == count,  "must generated requested number of sentences")
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)...Int.random(in: 12...20))
            
            let sentences = Taylor.sentences(range)

            checkSentences(sentences)

            XCTAssert((range).contains(sentences.split(separator: ".").count), "must generated a number of sentences in range")
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)..<Int.random(in: 12...20))
            
            let sentences = Taylor.sentences(range)

            checkSentences(sentences)

            XCTAssert((range).contains(sentences.split(separator: ".").count), "must generated a number of sentences in range")
        }
    }

    func testParagraphs() {
        for count in 1...10 {
            let paragraphs = Taylor.paragraphs(count)
            
            checkParagraphs(paragraphs)

            XCTAssertEqual(paragraphs.split(separator: "\n").count, count)
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)...Int.random(in: 12...20))
            
            let paragraphs = Taylor.paragraphs(range)

            checkParagraphs(paragraphs)

            XCTAssert((range).contains(paragraphs.split(separator: "\n").count), "must generated a number of sentences in range")
        }

        for _ in 1...10 {
            let range = (Int.random(in: 2...10)..<Int.random(in: 12...20))
            
            let paragraphs = Taylor.paragraphs(range)

            checkParagraphs(paragraphs)

            XCTAssert((range).contains(paragraphs.split(separator: "\n").count), "must generated a number of sentences in range")
        }
    }

    func testTitle() {
        var unique: Set<String> = []

        for _ in 1...10 {
            let title = Taylor.title()

            XCTAssert(title == title.trimmingCharacters(in: .whitespacesAndNewlines), "title must not have surrounding whitespace")
            XCTAssert(title == title.capitalized, "sentence must be capitalized")
            XCTAssert((2...6).contains(title.split(separator: " ").count), "sentence must contain 2 to 6 words")

            checkWords(title.lowercased())

            unique.insert(title)
        }
        
        XCTAssert(unique.count > 1, "must return different values on each call")
    }

    static var allTests = [
        ("testWord", testWord),
        ("testSentence", testSentence),
        ("testParagraph", testParagraph),
        ("testWords", testWords),
        ("testSentences", testSentences),
        ("testParagraphs", testParagraphs),
    ]
}
