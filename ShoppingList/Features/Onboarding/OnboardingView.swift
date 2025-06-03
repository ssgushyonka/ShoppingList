import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
    let buttonText: String
}

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var showListCreate = false
    private let viewModel = OnboardingViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                VStack {
                    TabView(selection: $currentStep) {
                        ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                            OnboardingStepView(step: viewModel.onboardingSteps[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    HStack {
                        ForEach(0..<viewModel.onboardingSteps.count, id: \.self) { index in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(currentStep == index ? .lightGreen : .gray.opacity(0.5))
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Button {
                        if currentStep < viewModel.onboardingSteps.count - 1 {
                            withAnimation {
                                currentStep += 1
                            }
                        } else {
                            showListCreate = true
                        }
                    } label: {
                        Text(viewModel.onboardingSteps[currentStep].buttonText)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.lightGreen)
                            .cornerRadius(100)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                    .navigationDestination(isPresented: $showListCreate) {
                        ListCreateView()
                    }
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
