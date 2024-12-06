import SwiftUI

struct AddPaymentMethodView: View {
    @Binding var isPresented: Bool
    @State private var cardNumber = ""
    @State private var expiration = ""
    @State private var cvv = ""
    @State private var zipCode = ""
    @State private var country = "United States"
    let onAddPayment: (String) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Card Details")) {
                    TextField("Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)

                    HStack {
                        TextField("Expiration (MM/YY)", text: $expiration)
                            .keyboardType(.numberPad)
                        TextField("CVV", text: $cvv)
                            .keyboardType(.numberPad)
                    }

                    TextField("ZIP Code", text: $zipCode)
                        .keyboardType(.numberPad)

                    Picker("Country/Region", selection: $country) {
                        ForEach(["United States", "Canada", "United Kingdom"], id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                }

                Section {
                    Button("Done") {
                        if !cardNumber.isEmpty {
                            onAddPayment("Card ending in \(cardNumber.suffix(4))")
                            isPresented = false
                        }
                    }
                    .disabled(cardNumber.isEmpty || expiration.isEmpty || cvv.isEmpty || zipCode.isEmpty)
                }
            }
            .navigationTitle("Add Card Details")
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            })
        }
    }
}
