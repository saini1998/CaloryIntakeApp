//
//  ContentView.swift
//  CaloryIntakes
//
//  Created by Aaryaman Saini on 31/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 60, 80, 190, 200],
        [150, 50, 100, 40, 180, 80, 100],
        [100, 150, 50, 200, 180, 140, 80]
    ]
    
    var body: some View {
        
        ZStack{
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Calory Intake")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal,24)
                
                HStack(spacing: 16){
                    
                    BarView(value: dataPoints[pickerSelectedItem][0], day: Text("Su"))
                    BarView(value: dataPoints[pickerSelectedItem][1], day: Text("M"))
                    BarView(value: dataPoints[pickerSelectedItem][2], day: Text("Tu"))
                    BarView(value: dataPoints[pickerSelectedItem][3], day: Text("W"))
                    BarView(value: dataPoints[pickerSelectedItem][4], day: Text("Th"))
                    BarView(value: dataPoints[pickerSelectedItem][5], day: Text("F"))
                    BarView(value: dataPoints[pickerSelectedItem][6], day: Text("Sa"))
                    
                }.padding(.top,20)
                .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BarView: View {
    
    var value: CGFloat
    var day: Text
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 40, height: 210)
                    .foregroundColor(Color("capBack"))
                Capsule().frame(width: 27, height: value)
                    .foregroundColor(Color("capFront"))
                    .padding(.bottom,5)
            }
            Text("\(day)").padding(.top,8)
        }
    }
}
