import Foundation

enum StringStyle {
    case camelCase
    case snakeCase
    case kebabCase
}

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    var upperCase: String {
        return lowercased()
            .split(separator: " ")
            .map { return $0.lowercased().capitalizingFirstLetter() }
            .joined()
    }

    var lowerCase: String {
        let upperCased = upperCase
        return upperCased.prefix(1).lowercased() + upperCased.dropFirst()
    }
}

@propertyWrapper
public struct CodingStyle {
    private(set) var text: String
    var style: StringStyle
    
     public var wrappedValue: String {
        get {
           get()
        }
        set {
            set(newValue)
        }
    }
    
    init(wrappedValue: String, style: StringStyle) {
        self.text = wrappedValue
        self.style = style
    }
    
    private func get() -> String {
        switch style {
        case .camelCase:
            return getCamel()
        case .snakeCase:
            return getSnake()
        case .kebabCase:
            return getKebab()
        }
    }
    
    private mutating func set(_ newValue: String) {
        text = newValue
    }
    
    private func getCamel() -> String {
        text.upperCase
    }
    
    private func getSnake() -> String {
        text.replacingOccurrences(of: " ", with: "_")
    }
    
    private func getKebab() -> String {
        text.replacingOccurrences(of: " ", with: "-")
    }
}
