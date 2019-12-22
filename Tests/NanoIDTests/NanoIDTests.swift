import XCTest
@testable import NanoID

extension String {
    func matches(pattern: String) throws -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: self.count)
            return regex.firstMatch(in: self, options: [], range: range) != nil
        } catch let error {
            throw error
        }
    }
}

final class NanoIDTests: XCTestCase {
    func testPlainInstanceGeneratesUrlSafeAnd21CharacterID() {
        // given
        let nanoid = NanoID()

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[a-zA-Z0-9_-]+$"))
    }

    func testInstanceGeneratesIDWithCustomAlphabetAndSize() {
        // given
        let nanoid = NanoID(alphabet: "abcdef", size: 10)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 10)
        XCTAssertTrue(try! id.matches(pattern: "^[a-f]+$"))
    }

    func testInstanceGeneratesIDWithHexadecimalAlphabetAndDefaultSize() {
        // given
        let nanoid = NanoID(alphabet: NanoID.Alphabet.hexadecimal.rawValue)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[a-f0-9]+$"))
    }

    func testInstanceGeneratesIDWithLowercaseAlphabetAndDefaultSize() {
        // given
        let nanoid = NanoID(alphabet: NanoID.Alphabet.lowercase.rawValue)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[a-z]+$"))
    }

    func testInstanceGeneratesIDWithNumbersAlphabetAndDefaultSize() {
        // given
        let nanoid = NanoID(alphabet: NanoID.Alphabet.numbers.rawValue)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[0-9]+$"))
    }

    func testInstanceGeneratesIDWithUnambiguousAlphabetAndDefaultSize() {
        // given
        let nanoid = NanoID(alphabet: NanoID.Alphabet.unambiguous.rawValue)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstwxyz]+$"))
    }

    func testInstanceGeneratesIDWithUppercaseAlphabetAndDefaultSize() {
        // given
        let nanoid = NanoID(alphabet: NanoID.Alphabet.uppercase.rawValue)

        // when
        let id = nanoid.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[A-Z]+$"))
    }

    func testStaticNewMethodGeneratesUrlSafeAnd21CharacterID() {
        // given, when
        let id = NanoID.new()

        // then
        XCTAssertEqual(id.count, 21)
        XCTAssertTrue(try! id.matches(pattern: "^[a-zA-Z0-9_-]+$"))
    }

    func testStaticGenerateMethodGeneratesIDWithCustomAlphabetAndSize() {
        // given, when
        let id = NanoID.generate(alphabet: "@£$%^&*()", size: 10)

         // then
        XCTAssertEqual(id.count, 10)
        XCTAssertTrue(try! id.matches(pattern: "^[@£$%^&*()]+$"))
    }
    
    func testStaticNewMethodUrlSafe21CharacterIDGenerationPerformance() {
        measure {
            for _ in 1 ... 10000 {
                _ = NanoID.new()
            }
        }
    }
    
    func testInstanceNewMethodUrlSafe21CharacterIDGenerationPerformance() {
        let nanoid = NanoID()
        measure {
            for _ in 1 ... 10000 {
                _ = nanoid.new()
            }
        }
    }

    static var allTests = [
        ("testPlainInstanceGeneratesUrlSafeAnd21CharacterID", testPlainInstanceGeneratesUrlSafeAnd21CharacterID),
    ]
}
