import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
    let buttonText: String
}

struct OnboardingView: View {
    @State private var currentStep = 0
    private let onboardingSteps = [
        OnboardingStep(
            image: "onboarding1",
            title: "Никогда не забывайте,\nчто нужно купить",
            description: "Создавайте списки\n и не переживайте о покупках",
            buttonText: "Начать"
        ),
        OnboardingStep(
            image: "onboarding2",
            title: "Давайте спланируем покупки!",
            description: "Создайте свой первый список",
            buttonText: "Создать список"
        )
    ]
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                TabView(selection: $currentStep) {
                    ForEach(0..<onboardingSteps.count, id: \.self) { index in
                        OnboardingStepView(step: onboardingSteps[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onboardingSteps.count, id: \.self) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(currentStep == index ? .lightGreen : .gray.opacity(0.5))
                    }
                }
                .padding(.bottom, 20)
                
                Button {
                    if currentStep < onboardingSteps.count - 1 {
                        withAnimation {
                            currentStep += 1
                        }
                    } else {
                        print("end onboarding")
                    }
                } label: {
                    Text(onboardingSteps[currentStep].buttonText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.lightGreen)
                        .cornerRadius(100)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct OnboardingStepView: View {
    let step: OnboardingStep
    var body: some View {
        VStack(spacing: 20) {
            Image(step.image)
                .resizable()
                .scaledToFit()
                .frame(width: 277, height: 285)
                .padding(.horizontal)

            VStack {
                Text(step.title)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(step.description)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 12)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 48)
            
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
