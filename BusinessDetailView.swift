import SwiftUI

struct BusinessDetailView: View {
    let business: Business

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Placeholder for Business Image
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 250)
                }
                .padding(.bottom)

                // Business Details
                VStack(alignment: .leading, spacing: 10) {
                    Text(business.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(business.rating)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Text(business.description)
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("Price: \(business.price)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle(business.name)
            .padding()
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(
            business: Business(
                name: "Example Business",
                description: "This is an example business for preview purposes.",
                price: "$100/hour",
                rating: "4.8 (200)"
            )
        )
    }
}
