import SwiftUI

struct PaymentsView: View {
    @State private var selectedTab: PaymentTab = .methods
    @State private var paymentMethods = [
        "Visa **** 3097",
        "Apple Pay"
    ]
    @State private var paymentHistory = [
        "Payment 1: $100 on 12/01/2024",
        "Payment 2: $200 on 11/15/2024"
    ]
    @State private var isAddingPayment = false

    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                ForEach(PaymentTab.allCases, id: \.self) { tab in
                    Text(tab.rawValue).tag(tab)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedTab == .methods {
                PaymentMethodsView(paymentMethods: $paymentMethods, isAddingPayment: $isAddingPayment)
            } else if selectedTab == .history {
                PaymentHistoryView(paymentHistory: $paymentHistory)
            }
        }
        .navigationTitle("Payments")
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $isAddingPayment) {
            AddPaymentMethodView(isPresented: $isAddingPayment, onAddPayment: { newMethod in
                paymentMethods.append(newMethod)
            })
        }
    }
}

enum PaymentTab: String, CaseIterable {
    case methods = "Payment Methods"
    case history = "Payment History"
}

struct PaymentsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsView()
    }
}
