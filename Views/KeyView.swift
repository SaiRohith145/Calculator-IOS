//
//  KeyView.swift
//  Calculator
//
//  Created by Sai Rohith on 30/03/26.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    
    @State var runningNumber = 0
    
    @State var currentOperation : Operation = .none
    
    @State private var changeColor : Bool = true
    
    let buttons : [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equla]
        
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeColor ?
                                     Color("num").opacity(0.4) : Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor = false
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.black))
            }.padding()
            ForEach(buttons, id: \.self){row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){elem in
                        Button {
                            self.didTap(button: elem)
                        } label: {
                            Text(elem.rawValue)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(elem.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }.padding(.bottom, 4)

                        
                    }
                }
                
            }
        }

    }
    
    func didTap(button : Keys){
        print("helo")
    }
}

#Preview {
    KeyView()
}
