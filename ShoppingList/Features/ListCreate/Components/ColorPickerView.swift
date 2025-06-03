import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: ListColor?
    private let rows = [GridItem(.flexible())]

    var body: some View {
        ZStack {
            Color(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 0) {
                Text("Выберите цвет")
                    .font(.callout)
                    .foregroundStyle(.black)
                    .padding(.top, 12)
                gridView()
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .frame(height: 105)
    }
    
    @ViewBuilder private func gridView() -> some View {
        LazyHGrid(rows: rows, spacing: 12) {
            ForEach(ListColor.allCases, id: \.self) { colorCase in
                gridItem(colorCase: colorCase)
            }
        }
    }
    @ViewBuilder private func gridItem(colorCase: ListColor) -> some View {
        Button(action: {
            selectedColor = colorCase
        }) {
            itemButtonContent(colorCase: colorCase)
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder private func itemButtonContent(colorCase: ListColor) -> some View {
        ZStack {
            Circle()
                .fill(colorCase.color)
                .frame(width: 48, height: 48)
                .overlay {
                    ZStack {
                        Circle()
                            .stroke(Color.white, lineWidth: 7)
                        Circle()
                            .stroke(selectedColor == colorCase ? Color.lightGreen : Color.clear, lineWidth: 2)
                    }
                }
        }
    }
}

#if DEBUG
#Preview {
    @Previewable @State var previewSelectedColor: ListColor? = .red
    
    ZStack {
        Color.backLight.ignoresSafeArea()
        
        ColorPickerView(selectedColor: $previewSelectedColor)
    }
}
#endif
