import SwiftUI

enum ListColor: Int, CaseIterable, Codable {
    case green = 0
    case purple = 1
    case blue = 2
    case red = 3
    case yellow = 4
    
    var color: Color {
        switch self {
        case .green:
            return .listColor2
        case .purple:
            return .listColor3
        case .blue:
            return .listColor1
        case .red:
            return .listColor4
        case .yellow:
            return .listColor5
        }
    }
}
