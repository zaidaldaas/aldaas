import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var location = ""
    @State private var navigateToHome = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Create Your Account")
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

                TextField("Location", text: $location)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)

                Button(action: {
                    // TODO: Add sign-up logic here
                    navigateToHome = true
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(email.isEmpty || password.isEmpty || location.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(email.isEmpty || password.isEmpty || location.isEmpty)
            }
            .padding()
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $navigateToHome) {
                MainTabView()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
