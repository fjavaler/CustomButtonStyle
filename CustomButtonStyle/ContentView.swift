//
//  ContentView.swift
//  CustomButtonStyle
//
//  Created by Frederick Javalera on 9/8/21.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
  
  let scaledAmount:CGFloat
  
  init(scaledAmount: CGFloat = 0.9) {
    self.scaledAmount = scaledAmount
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
      .opacity(configuration.isPressed ? 0.9 : 1.0)
  }
}

extension View {
  func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
    self.buttonStyle(PressableButtonStyle())
  }
}

struct ContentView: View {
  var body: some View {
    Button(action: {
      // eat
    }, label: {
      Text("Click Me")
        .font(.headline)
        .foregroundColor(.white)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10 )
    })
    .withPressableStyle(scaledAmount: 1.5)
    //.buttonStyle(PressableButtonStyle(scaledAmount: 0.9))
    .padding(40)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
