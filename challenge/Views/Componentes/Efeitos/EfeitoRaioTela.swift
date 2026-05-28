import SwiftUI

struct EfeitoRaioTela: View {
    @State private var opacidadeFundo: Double = 0.0
    @State private var opacidadeRaio: Double = 0.0
    
    var body: some View {
        ZStack {
            // Tela Branca
            Color.white
                .ignoresSafeArea()
                .opacity(opacidadeFundo)
            
            //Imagem do Trovão/Raio
            Image("Raio 1")
                .resizable()
                .scaledToFit()
                .opacity(opacidadeRaio)
        }
        .onAppear {
            dispararTempestade()
        }
    }
    
    func dispararTempestade() {
       // intervalo aleatório
        let intervalo = Double.random(in: 3...7)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + intervalo) {
           // mostrar o raio
            opacidadeRaio = 1.0
            
            // primeiro flash
            withAnimation(.easeIn(duration: 0.05)) {
                opacidadeFundo = 0.8 // primeiro flash um pouco mais suave
            }
            
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.easeOut(duration: 0.05)) {
                    opacidadeFundo = 0.0
                }
                
               // segundo flash
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                    withAnimation(.easeIn(duration: 0.05)) {
                        opacidadeFundo = 1.0 // Flash total
                    }
                    
                   // após o flash o raio vai sumindo
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                        withAnimation(.easeOut(duration: 0.1)) {
                            opacidadeFundo = 0.0
                        }
                        // tempo para o raio sumir
                        withAnimation(.easeOut(duration: 0.8)) {
                            opacidadeRaio = 0.0
                        }
                        
                        // loop
                        dispararTempestade()
                    }
                }
            }
        }
    }
}

#Preview {
    EfeitoRaioTela()
}
