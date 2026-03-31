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
                                .frame(width: self.getWidth(elem: elem), height: self.getHeight())
                                .background(elem.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(self.getWidth(elem: elem))
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }.padding(.bottom, 4)

                        
                    }
                }
                
            }
        }

    }
    
    func getWidth(elem : Keys) -> CGFloat{
        if(elem == .zero){
            return (UIScreen.main.bounds.width - (5*10))/2
        }
        return (UIScreen.main.bounds.width - (5*10))/4
    }
    
    func getHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*10))/4
    }
    
    func didTap(button : Keys){
        switch button{
        case .add, .subtract, .multiply, .divide, .equla:
            if(button == .add){
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? Int(Float(self.value) ?? 0)
            } else if(button == .subtract){
                self.currentOperation = .substract
                self.runningNumber = Int(self.value) ?? Int(Float(self.value) ?? 0)
            } else if(button == .multiply){
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? Int(Float(self.value) ?? 0)
            } else if(button == .divide){
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? Int(Float(self.value) ?? 0)
            } else if(button == .equla){
                let runningValue = self.runningNumber;
                let currentValue = Int(self.value) ?? Int(Float(self.value) ?? 0);
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .substract:
                    self.value = "\(runningValue - currentValue)"
                case .divide:
                    self.value = "\(runningValue * currentValue)"
                case .multiply:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
                
            }
            if(button != .equla){
                self.value = "0"
            }
        case .clear:
            self.value = "0";
            self.runningNumber = 0;
            self.currentOperation = .none;
        case .decimal, .negative, .percent:
            if(button == .negative){
                self.value = "\((Int(self.value) ?? 0) * -1)"
            } else if(button == .percent){
                self.value = "\((Int(self.value) ?? 0) % 100)"
            } else {
                let dot = button.rawValue;
                if self.value == "0"{
                    self.value = "0.";
                } else {
                    self.value = "\(self.value)\(dot)"
                }
            }
            break
            
        default:
            let number = button.rawValue;
            if self.value == "0"{
                self.value = number;
            } else {
                self.value = "\(self.value)\(number)"
            }
            
        }
        
    }
}

#Preview {
    KeyView()
}
