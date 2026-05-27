//
//  TelaSplashView.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 27/05/26.
//

import Foundation
import SwiftUI

struct TelaSplashView: View {
    
    @State private var aparecer = false
    @State private var pulsar = false
    @State private var iniciar = false
    
    var body: some View {
     
        GeometryReader { geometry in
            
            if iniciar {
                TelaMenuView()
            }

            ZStack {

                LinearGradient(
                    colors: [.caixasAzul, .azulGradiente],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                Image("Logo")
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.20)
                    .opacity(aparecer ? 1 : 0)
                    .scaleEffect(pulsar ? 1.15 : 1.0)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.8)) {
                            aparecer = true
                        }
                        
                        withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                            pulsar = true
                        }
                            
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {

                          withAnimation {
                              iniciar = true
                          }
                        }
                }
          }
      }
  }
}
#Preview {
    TelaSplashView()
}
