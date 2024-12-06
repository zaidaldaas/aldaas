import SwiftUI

struct LoginSecurityView: View {
    @State private var username = "john.doe"
    @State private var password = "********"

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
            }
        }
        .navigationTitle("Login & Security")
    }
}

struct LoginSecurityView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSecurityView()
    }
}
