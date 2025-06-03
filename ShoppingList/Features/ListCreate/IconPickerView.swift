import SwiftUI

struct IconPickerView: View {
    private let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var selectedIcon: ListIcon?
    @Binding var selectedColor: ListColor?

    var body: some View {
        ZStack {
            Color(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 0) {
                text()
                grid()
                    .frame(maxWidth: .infinity, maxHeight: 168)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .frame(height: 225)
        .padding(.horizontal)
    }
    
    @ViewBuilder private func text() -> some View {
        Text("Выберите дизайн")
            .foregroundStyle(.black)
            .font(.callout)
            .padding(.top, 12)
    }
    
    @ViewBuilder private func grid() -> some View {
        LazyHGrid(rows: rows, spacing: 12) {
            ForEach(ListIcon.allCases, id: \.self) { iconCase in
                Button(action: {
                    selectedIcon = iconCase
                }) {
                    ZStack {
                        Circle()
                            .fill(iconCase == selectedIcon ?
                                  (selectedColor?.color ?? .gray) : .gray
                            )
                            .frame(width: 48, height: 48)
                        
                        iconCase.icon
                            .renderingMode(.template)
                            .foregroundStyle(iconCase == selectedIcon ?
                                .black : .white
                            )
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }

}


#if DEBUG
#Preview {
    @Previewable @State var previewSelectedIcon: ListIcon? = .airplane
    @Previewable @State var previewSelectedColor: ListColor? = nil
    
    ZStack {
        Color.backLight.ignoresSafeArea()
        
        IconPickerView(
            selectedIcon: $previewSelectedIcon,
            selectedColor: $previewSelectedColor
        )
    }
}
#endif
