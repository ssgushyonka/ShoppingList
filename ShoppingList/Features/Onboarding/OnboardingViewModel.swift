import Foundation

final class OnboardingViewModel: ObservableObject {
    let onboardingSteps = [
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
}
