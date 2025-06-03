import SwiftUI

struct ListCreateView: View {
    @Binding var listName: String
    @StateObject var viewModel = ListCreateViewModel()
    var body: some View {
        ZStack {
            Color(.backLight)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                TextField("Введите название списка", text: $listName)
                    .textFieldStyle(.plain)
                    .frame(maxWidth: .infinity, maxHeight: 54)
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

                ColorPickerView(selectedColor: $viewModel.selectedColor)
                
                IconPickerView(selectedIcon: $viewModel.selectedIcon, selectedColor: $viewModel.selectedColor)
                Spacer()
                Button {
                    print()
                    
                } label: {
                    Text("Создать")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray)
                        .cornerRadius(100)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var previewListName = ""
        
        var body: some View {
            ListCreateView(listName: $previewListName)
        }
    }
    
    return PreviewWrapper()
}
