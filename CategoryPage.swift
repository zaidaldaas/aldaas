import SwiftUI

struct CategoryPage: View {
    let category: ServiceCategory

    var businesses: [Business] {
        switch category.name {
        case "Accounting":
            return [
                Business(name: "Tax Pro Services", description: "Expert tax preparation and advice.", price: "$100/hour", rating: "4.8 (120)"),
                Business(name: "Finance Solutions Inc.", description: "Comprehensive accounting services.", price: "$150/hour", rating: "4.7 (85)")
            ]
        case "Construction":
            return [
                Business(name: "Build It Right", description: "Reliable construction and remodeling.", price: "$5,000/project", rating: "4.9 (200)"),
                Business(name: "Solid Foundations", description: "High-quality construction services.", price: "$4,800/project", rating: "4.8 (175)")
            ]
        case "HVAC Services":
            return [
                Business(name: "Cool Comfort HVAC", description: "Top-notch heating and cooling services.", price: "$90/hour", rating: "4.9 (90)"),
                Business(name: "HVAC Pros", description: "Affordable and reliable HVAC solutions.", price: "$85/hour", rating: "4.7 (110)")
            ]
        case "Landscaping":
            return [
                Business(name: "Green Thumb Landscaping", description: "Beautiful gardens and yard designs.", price: "$300/project", rating: "4.8 (95)"),
                Business(name: "Outdoor Paradise Co.", description: "Transform your outdoor spaces.", price: "$500/project", rating: "4.9 (150)")
            ]
        case "Catering":
            return [
                Business(name: "Gourmet Bites Catering", description: "Delicious food for every occasion.", price: "$1,000/event", rating: "4.9 (210)"),
                Business(name: "Party Platters Co.", description: "Affordable and tasty catering options.", price: "$800/event", rating: "4.7 (180)")
            ]
        case "Photography":
            return [
                Business(name: "Creative Snapshots", description: "Capture your moments with perfection.", price: "$300/session", rating: "4.9 (130)"),
                Business(name: "Picture Perfect Studio", description: "Professional photography services.", price: "$400/session", rating: "4.8 (190)")
            ]
        default:
            return []
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                // Search Bar
                HStack {
                    TextField("Search \(category.name)...", text: .constant(""))
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .padding(.trailing, 10)
                        .font(.title2)
                }
                .padding(.horizontal)
                .padding(.top)

                ForEach(businesses) { business in
                    NavigationLink(destination: BusinessDetailView(business: business)) {
                        VStack(alignment: .leading, spacing: 10) {
                            // Placeholder for business image
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(.secondarySystemBackground))
                                    .frame(height: 200)
                            }

                            VStack(alignment: .leading, spacing: 5) {
                                Text(business.name)
                                    .font(.headline)
                                Text(business.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(business.price)
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text(business.rating)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle(category.name)
    }
}

struct Business: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
    let rating: String
}
