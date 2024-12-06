import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToHome = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome Back 👋")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)

                Button(action: {
                    // TODO: Add authentication logic here
                    navigateToHome = true
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(email.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(email.isEmpty || password.isEmpty)

                NavigationLink("Don't have an account? Sign Up", destination: SignUpView())
                    .foregroundColor(.blue)
            }
            .padding()
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $navigateToHome) {
                MainTabView()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
