//
//  ContentView.swift
//  Calculator
//
//  Created by Imran on 24/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import SwiftUI

struct CalculateState {
    var currentNumber : Double = 0
    mutating func appendNumber (_ number: Double){
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
            
            // 2 4 = 20 + 4 = 24
            print(currentNumber)
        }else {
            currentNumber = number
        }
    }
}




struct ContentView: View {
    @State var state = CalculateState()
    
    var displayString: String{
        return String(format: "%.2f", arguments: [state.currentNumber])
    }
    var body: some View {
        VStack(alignment: .trailing, spacing: 20){
            Spacer()
            Text(displayString)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(2)
                .padding(.bottom, 64)
                .animation(.spring())
            
            HStack{
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                NumberView(number: .pi, state: $state)
            }
            HStack{
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                NumberView(number: 4, state: $state)
            }
            HStack{
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                NumberView(number: 4, state: $state)
            }
            HStack{
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                NumberView(number: 4, state: $state)
            }
        }.padding(32)
    }
}


struct NumberView: View {
    let number : Double
    
    @Binding var state : CalculateState
    
    var numberSting : String{
        if number == .pi {
            return "π"
        }
        return String(Int(number))
    }
    var body: some View{
        Text(numberSting)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.appendNumber(self.number)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
