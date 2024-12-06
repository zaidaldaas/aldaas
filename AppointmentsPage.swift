import SwiftUI

struct AppointmentsPage: View {
    @State private var selectedTab: String = "Active"

    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Appointments")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            // Tabs
            HStack {
                TabButton(title: "Active", isSelected: selectedTab == "Active") {
                    selectedTab = "Active"
                }
                TabButton(title: "Past", isSelected: selectedTab == "Past") {
                    selectedTab = "Past"
                }
                TabButton(title: "Canceled", isSelected: selectedTab == "Canceled") {
                    selectedTab = "Canceled"
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            // Content
            if selectedTab == "Active" {
                AppointmentPlaceholder(
                    imageName: "calendar.badge.clock",
                    title: "Your active appointments",
                    message: "You haven’t started any appointments yet. Once you make one, it’ll appear here."
                )
            } else if selectedTab == "Past" {
                AppointmentPlaceholder(
                    imageName: "clock.arrow.circlepath",
                    title: "Revisit past appointments",
                    message: "Here you can refer to all past appointments and get inspiration for your next ones."
                )
            } else if selectedTab == "Canceled" {
                AppointmentPlaceholder(
                    imageName: "calendar.badge.exclamationmark",
                    title: "Canceled appointments",
                    message: "Here you can refer to all the appointments you’ve canceled—maybe next time!"
                )
            }

            Spacer()
        }
        .padding(.top, 10)
        .background(Color(.systemBackground))
    }
}

// AppointmentPlaceholder Component
struct AppointmentPlaceholder: View {
    let imageName: String
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .padding(.top, 50)

            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct AppointmentsPage_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsPage()
    }
}
