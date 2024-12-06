import SwiftUI

struct LandingPage: View {
    @State private var navigateToSignIn = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 30) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)

                Text("Serviced.")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)

                Text("Find and book services tailored to your needs.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                navigateToSignIn = true
            }
        }
        .fullScreenCover(isPresented: $navigateToSignIn) {
            SignInView()
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
