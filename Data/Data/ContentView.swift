//
//  ContentView.swift
//  Data
//
//  Created by Berk Gozek on 25/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    ///DEC | BIN CONVERSIONS
    
    
    func BinToDec()-> Int{
        var Output = 0
        var powcount = 0
        var input = Int(Input) ?? 0
        while(input > 0){
            if (input % 10 == 1){
                Output += Int(pow(2.0,Double(powcount)))
            }
            powcount += 1
            input = input/10
        }
        return Output
    }
    
    
    func DecToBin()-> String{
        var Output = ""
        var input = Int(Input) ?? 0
        
        while (input > 0){
            Output = String(input%2) + Output
            input = input/2
        }
        return Output
    }
    
    
    
    /// DEC HEX CONVERSIONS
    
    func DecToHex()-> String{
        var Output = ""
        var input = Int(Input) ?? 0
        
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
                Output = String(DecToHex())
            }
                
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
