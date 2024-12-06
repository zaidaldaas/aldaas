import SwiftUI

struct ExplorePage: View {
    @State private var searchText = ""

    let categories = [
        ServiceCategory(name: "Accounting", emoji: "💵"),
        ServiceCategory(name: "Construction", emoji: "🏗️"),
        ServiceCategory(name: "HVAC Services", emoji: "❄️"),
        ServiceCategory(name: "Landscaping", emoji: "🌿"),
        ServiceCategory(name: "Catering", emoji: "🍴"),
        ServiceCategory(name: "Photography", emoji: "📸")
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                // Search Bar
                HStack {
                    TextField("Search for services...", text: $searchText)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        )
                }
                .padding(.horizontal, 20)

                Text("Explore")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(categories.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }) { category in
                            VStack(spacing: 10) {
                                NavigationLink(destination: CategoryPage(category: category)) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
                                            .shadow(radius: 5)

                                        Text(category.emoji)
                                            .font(.system(size: 60))
                                    }
                                }

                                Text(category.name)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                }
            }
            .padding(.top)
            .navigationBarHidden(true)
        }
    }
}

struct ServiceCategory: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
