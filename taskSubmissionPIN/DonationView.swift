//
//  SwiftUIView.swift
//  taskSubmissionPIN
//
//  Created by Noga Gercsak on 9/20/23.
//

import SwiftUI

// Creating a struct for a currencytextfield
struct CurrencyTextField: UIViewRepresentable {
    
    typealias UIViewType = CurrencyUITextField
    
    //numberFormatter supports currencies on swift
    let numberFormatter: NumberFormatter
    let currencyField: CurrencyUITextField
    
    
    //initializer
    init(numberFormatter: NumberFormatter, value: Binding<Int>) {
        self.numberFormatter = numberFormatter
        currencyField = CurrencyUITextField(formatter: numberFormatter, value: value)
    }
    
    // function to support the ui development
    func makeUIView(context: Context) -> CurrencyUITextField {
        return currencyField
    }
    
    func updateUIView(_ uiView: CurrencyUITextField, context: Context) { }
}
struct DonationView: View {
    
    //labeling the variables. State used so that info can be stored in Swift
    @State private var isSubtitleHidden = false
    @State private var value = 0
        
    private var numberFormatter: NumberFormatter
    
        //initializer used to make 2 digits appear after decimal to represent currency
    init(numberFormatter: NumberFormatter = NumberFormatter()) {
            self.numberFormatter = numberFormatter
            self.numberFormatter.numberStyle = .currency
            self.numberFormatter.maximumFractionDigits = 2
        }
    var body: some View {
        
        ZStack{
            
            Color(red: 246/255, green: 240/255, blue: 214/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Donate Now")
                    .font(.system(size: 45, design: .rounded))
                // The paragraph text informing about disabilties and uber.
                Text("Accomodations for people with disabilites\nin uber costs extra money. This prevents\nmany people with disabilities  from being\nable to access an uber. Donate now to\nhelp increase the number of people with diabilsabilities that uber can accomodate.   ")
                
                
                Text("\nEnter Monetary Value For Donation:")
                    .font(.system(size: 20, design:.rounded))
                
                // creating the UI that shows pops up on the page.
                CurrencyTextField(numberFormatter: numberFormatter, value: $value)
                    .padding(20)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    .frame(height: 100)
                
                //Send button
                Rectangle()
                    .frame(width: 0, height: 40)
                
                Text("Send")
                    .frame(width: 180, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .onTapGesture {
                        if !isSubtitleHidden {
                            isSubtitleHidden.toggle()
                        }
                    }
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
        }
    }
}
    
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
// this code will support the numberFormatter as it makes it localizable.
import UIKit
class CurrencyUITextField: UITextField {
    // binding the variable
    @Binding private var value: Int
    private let formatter: NumberFormatter
    
    init(formatter: NumberFormatter, value: Binding<Int>) {
            self.formatter = formatter
            self._value = value
            super.init(frame: .zero)
            setupViews()
    }
    required
    init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // having the numberpad input
    override func willMove(toSuperview newSuperview: UIView?) {
            addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            addTarget(self, action: #selector(resetSelection), for: .allTouchEvents)
            keyboardType = .numberPad
            textAlignment = .right
            sendActions(for: .editingChanged)
        }
    //formatting the way the numbers get deleted
    override func deleteBackward() {
            text = textValue.digits.dropLast().string
            sendActions(for: .editingChanged)
        }
        //setting up the ui
        private func setupViews() {
            tintColor = .clear
            font = .systemFont(ofSize: 40, weight: .regular)
        }
        
        @objc private func editingChanged() {
            text = currency(from: decimal)
            resetSelection()
            value = Int(doubleValue * 100)
        }
        
        @objc private func resetSelection() {
            selectedTextRange = textRange(from: endOfDocument, to: endOfDocument)
        }
        
        private var textValue: String {
            return text ?? ""
        }
        private var doubleValue: Double {
          return (decimal as NSDecimalNumber).doubleValue
        }
        private var decimal: Decimal {
          return textValue.decimal / pow(10, formatter.maximumFractionDigits)
        }
        // transforming it into a string
        private func currency(from decimal: Decimal) -> String {
            return formatter.string(for: decimal) ?? ""
        }
    }
// transforming into a string
    extension StringProtocol where Self: RangeReplaceableCollection {
        var digits: Self { filter (\.isWholeNumber) }
    }
    extension String {
        var decimal: Decimal { Decimal(string: digits) ?? 0 }
    }
    extension LosslessStringConvertible {
        var string: String { .init(self) }
    }


#Preview {
    DonationView()
}
