//
//  ContentView.swift
//  Data
//
//  Created by Berk Gozek on 25/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    ///DEC | BIN CONVERSIONS
    
    
    func BinToDec(strinp:String)-> String{
        var Output = 0
        var powcount = 0
        var input = Int(strinp) ?? 0
        while(input > 0){
            if (input % 10 == 1){
                Output += Int(pow(2.0,Double(powcount)))
            }
            powcount += 1
            input = input/10
        }
        return String(Output)
    }
    
    
    func DecToBin(strinp:String)-> String{
        var Output = ""
        var input = Int(strinp) ?? 0
        
        while (input > 0){
            Output = String(input%2) + Output
            input = input/2
        }
        return Output
    }
    
    
    
    /// DEC HEX CONVERSIONS
    
    func DecToHex(strinp:String)-> String{
        var Output = ""
        var input = Int(strinp) ?? 0
        
        let TenArray = ["A","B","C","D","E","F"]
        
        while input > 0{
            
            if (input % 16) >= 10 {
                        let HexIndex = (input % 16) - 10

                        Output = TenArray[HexIndex] + Output
                        input = input / 16
                        continue
                    }
                    Output = String(input % 16) + Output
                    input = input / 16
        }
        
        return Output
    }
    
    func HexToDec(strinp:String)-> String{
        var Output = 0
        let input = strinp.reversed()
        var step = 1
        
        for i in input{
            if i == "A"{
                Output += step*10
            }
            else if i == "B"{
                Output += step*11
            }
            else if i == "C"{
                Output += step*12
            }
            else if i == "D"{
                Output += step*13
            }
            else if i == "E"{
                Output += step*14
            }
            else if i == "F"{
                Output += step*15
            }
            else {
                Output += (Int(String(i)) ?? 1 )*step
            }
            step = step*16

        }
        return String(Output)
    }
    
    
    /// BUTTON SWITCHES
    
    func buttonWorks()->String{
        let input = Input
        let from = InputSel
        let to = OutputSel
        
        var Output = ""
        
        if from == "Binary"{
            if to == "Binary"{
                Output = input
            }
            else if to == "Decimal"{
                Output = BinToDec(strinp: input)
            }
            else if to == "Hexadecimal"{
                Output = DecToHex(strinp: BinToDec(strinp: input))
             }
        }
        else if from == "Decimal"{
            if to == "Binary"{
                Output = DecToBin(strinp: input)
            }
            else if to == "Decimal"{
                Output = input            }
            else if to == "Hexadecimal"{
                Output = DecToHex(strinp: input)
             }
        }
        else if from == "Hexadecimal"{
            if to == "Binary"{
                Output = DecToBin(strinp: HexToDec(strinp: input))
            }
            else if to == "Decimal"{
                Output = HexToDec(strinp: input)            }
            else if to == "Hexadecimal"{
                Output = input
             }
        }
        else if from == "Select"
        {
            Output = ""
        }
        
        
        
        return Output
    }
    
    
    
    
    
    
    @State private var InputSel = "Select"
    @State private var OutputSel = "Select"
    
    @State private var Input: String = ""
    @State private var Output: String = ""
        let colors = ["Select", "Binary", "Decimal", "Hexadecimal"]
    
    var body: some View {
        VStack {
            HStack{
                Text("Input")
                Text("to")
                Text("Output")
            }
            HStack{
                Picker("Select Input", selection: $InputSel) {
                                   ForEach(colors, id: \.self) {
                                       Text($0)
                                   }
                               }
                               .pickerStyle(.menu)
                
                Text("to")
                Picker("Select Output", selection: $OutputSel) {
                                   ForEach(colors, id: \.self) {
                                       Text($0)
                                   }
                               }
                               .pickerStyle(.menu)
            }
            Text("Input")
            TextField("Input", text: $Input)
            Text("Output")
            TextField("Input", text: $Output).disabled(true)
            Button("Convert"){
                Output = buttonWorks()            }
                
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
