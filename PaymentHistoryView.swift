import SwiftUI

struct PaymentHistoryView: View {
    @Binding var paymentHistory: [String]

    var body: some View {
        VStack {
            if paymentHistory.isEmpty {
                VStack {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Your Receipts")
                        .font(.headline)
                    Text("Add a card to your profile to see your payment history.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.top, 2)
                        .padding(.horizontal)
                }
                .padding()
            } else {
                List {
                    ForEach(paymentHistory, id: \.self) { history in
                        Text(history)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Payment History")
    }
}
