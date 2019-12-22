import Foundation

struct NanoID {
    public enum Alphabet: String {
        case hexadecimal = "0123456789abcdef"
        case lowercase = "abcdefghijklmnopqrstuvwxyz"
        case numbers = "0123456789"
        case unambiguous = "23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstwxyz"
        case uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case urlSafe = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-"
    }

    private var alphabet: String
    private var size: Int

    init(alphabet: String = Alphabet.urlSafe.rawValue, size: Int = 21) {
        self.alphabet = alphabet.isEmpty ? Alphabet.urlSafe.rawValue : alphabet
        self.size = size
    }

    public func new() -> String {
        return NanoID.generate(alphabet: alphabet, size: size)
    }

    public static func new() -> String {
        return NanoID.generate(alphabet: Alphabet.urlSafe.rawValue, size: 21)
    }

    public static func generate(alphabet: String, size: Int) -> String {
        var result = ""
        for _ in 0 ..< size {
            let character = NanoID.randomCharacter(from: alphabet)
            result.append(character)
        }
        return result
    }

    private static func randomCharacter(from alphabet: String) -> Character {
        let offset = Int.random(in: 0 ..< alphabet.count)
        let index = alphabet.index(alphabet.startIndex, offsetBy: offset)
        return alphabet[index]
    }
}
