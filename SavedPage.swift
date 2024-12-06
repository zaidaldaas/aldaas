import SwiftUI

struct SavedPage: View {
    @State private var selectedTab: String = "Lists"

    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Saved")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            // Tabs
            HStack {
                TabButton(title: "Lists", isSelected: selectedTab == "Lists") {
                    selectedTab = "Lists"
                }
                TabButton(title: "Messages", isSelected: selectedTab == "Messages") {
                    selectedTab = "Messages"
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            // Content
            if selectedTab == "Lists" {
                PlaceholderContent(
                    imageName: "bookmark",
                    title: "Save what you like for later",
                    message: "Create lists of your favorite services to help you share, compare, and book.",
                    buttonText: "Start your search",
                    linkText: "Create a list"
                )
            } else if selectedTab == "Messages" {
                PlaceholderContent(
                    imageName: "message",
                    title: "Stay connected",
                    message: "Message businesses directly to inquire about services.",
                    buttonText: "Start messaging",
                    linkText: "Learn more"
                )
            }

            Spacer()
        }
        .padding(.top, 10)
        .background(Color(.systemBackground))
    }
}

// TabButton Component
struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Text(title)
                    .foregroundColor(isSelected ? .blue : .gray)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(isSelected ? .blue : .clear)
            }
            .padding(.horizontal)
        }
    }
}

// PlaceholderContent Component
struct PlaceholderContent: View {
    let imageName: String
    let title: String
    let message: String
    let buttonText: String
    let linkText: String

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

            Button(action: {
                // TODO: Add action here
            }) {
                Text(buttonText)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            Button(action: {
                // TODO: Add action here
            }) {
                Text(linkText)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SavedPage_Previews: PreviewProvider {
    static var previews: some View {
        SavedPage()
    }
}
