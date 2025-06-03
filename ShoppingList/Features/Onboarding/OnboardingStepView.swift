import SwiftUI

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
