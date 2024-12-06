import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "bell")
                        .font(.title2)
                }
                .padding(.horizontal)
                .padding(.top, 20)

                // User Info
                HStack(spacing: 15) {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text("U") // Placeholder for user's initial
                                .font(.title)
                                .foregroundColor(.white)
                        )
                    VStack(alignment: .leading) {
                        Text("Hi, User")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                // Settings
                Text("Settings")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                VStack(alignment: .leading, spacing: 20) {
                    NavigationLink(destination: PersonalInfoView()) {
                        SettingsRow(iconName: "person.crop.circle", title: "Personal Information")
                    }
                    NavigationLink(destination: PaymentsView()) {
                        SettingsRow(iconName: "creditcard.fill", title: "Payments")
                    }
                    NavigationLink(destination: LoginSecurityView()) {
                        SettingsRow(iconName: "lock.shield.fill", title: "Login & Security")
                    }
                    NavigationLink(destination: NotificationsView()) {
                        SettingsRow(iconName: "bell.fill", title: "Notifications")
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 16)
            .background(Color(.systemBackground))
        }
    }
}

// SettingsRow Component
struct SettingsRow: View {
    let iconName: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(.blue)
                .frame(width: 30)
            Text(title)
                .font(.body)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
