import SwiftUI

struct PaymentMethodsView: View {
    @Binding var paymentMethods: [String]
    @Binding var isAddingPayment: Bool

    var body: some View {
        VStack {
            List {
                ForEach(paymentMethods, id: \.self) { method in
                    HStack {
                        Text(method)
                        Spacer()
                        if method == "Apple Pay" {
                            Image(systemName: "applelogo")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: removeMethod)
            }
            .listStyle(InsetGroupedListStyle())

            Spacer()

            Button(action: {
                isAddingPayment = true
            }) {
                Text("Add Payment Method")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }

    func removeMethod(at offsets: IndexSet) {
        paymentMethods.remove(atOffsets: offsets)
    }
}
