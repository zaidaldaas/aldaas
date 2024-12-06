import SwiftUI

struct PersonalInfoView: View {
    @State private var name = "John Doe"
    @State private var phoneNumber = "+1 ***-***-0002"
    @State private var email = "johndoe@gmail.com"
    @State private var address = "Not Provided"

    var body: some View {
        Form {
            Section(header: Text("Personal Info")) {
                TextField("Name", text: $name)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Email", text: $email)
                TextField("Address", text: $address)
            }
        }
        .navigationTitle("Personal Info")
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
