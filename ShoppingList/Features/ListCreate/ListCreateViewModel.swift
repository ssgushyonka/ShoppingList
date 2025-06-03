import Foundation
import Combine

final class ListCreateViewModel: ObservableObject {
    @Published var selectedColor: ListColor? = nil
    @Published var selectedIcon: ListIcon? = nil
    @Published var listName: String = ""
}
