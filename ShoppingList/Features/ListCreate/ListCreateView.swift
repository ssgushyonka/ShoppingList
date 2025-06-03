import SwiftUI

struct ListCreateView: View {
    @StateObject var viewModel = ListCreateViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.backLight)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        TextField("Введите название списка", text: $viewModel.listName)
                            .textFieldStyle(.plain)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, maxHeight: 54)
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        ColorPickerView(selectedColor: $viewModel.selectedColor)
                        
                        IconPickerView(selectedIcon: $viewModel.selectedIcon, selectedColor: $viewModel.selectedColor)
                        
                        Spacer()
                        
                        Button {
                            print("Создание списка")
                        } label: {
                            Text("Создать")
                                .font(.headline)
                                .foregroundColor(!viewModel.listName.isEmpty ? .white : .grayHint)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(!viewModel.listName.isEmpty ? .lightGreen : .grayButton)
                                .cornerRadius(100)
                                .padding(.horizontal)
                        }
                        .disabled(viewModel.listName.isEmpty)
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 12)
                    .frame(minHeight: geometry.size.height)
                }
                .scrollDisabled(true)
            }
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            hideKeyboard()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                        Text("Создать список")
                            .font(.headline)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var previewListName = ""
        
        var body: some View {
            ListCreateView()
        }
    }
    
    return PreviewWrapper()
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
