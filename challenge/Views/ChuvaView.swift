import SwiftUI

struct ChuvaParticulas: View {
    @State private var iniciarAnimacao = false

    let xPosition: CGFloat
    let duration: Double
    var yInicial: CGFloat 
    var alturaFinalQueda: CGFloat
    var tamanhoMinGota: CGFloat = 25
    var tamanhoMaxGota: CGFloat = 40

    var body: some View {
        Capsule()
            .fill(Color.blue.opacity(0.8))
            .frame(width: 2.5, height: CGFloat.random(in: tamanhoMinGota...tamanhoMaxGota))
            .rotationEffect(.degrees(8))
            .position(x: xPosition, y: iniciarAnimacao ? alturaFinalQueda : yInicial)
            .onAppear {
                withAnimation(
                    Animation
                        .linear(duration: duration)
                        .repeatForever(autoreverses: false)
                        .delay(Double.random(in: 0.5...2))
                ) {
                    iniciarAnimacao = true
                }
            }
    }
}

struct testedaChuva: View {
    var intensidadeChuva: Int
    var geo: GeometryProxy

    var body: some View {
        ZStack {
            ForEach(0..<intensidadeChuva, id: \.self) { index in
                ChuvaParticulas(
                    xPosition: CGFloat.random(in: 0...geo.size.width),
                    duration: Double.random(in: 0.6...2),
                    yInicial: 200,
                    alturaFinalQueda: geo.size.height + 50
                )
            }
        }
    }
}
#Preview {
    GeometryReader { geometry in
        
        testedaChuva(intensidadeChuva: 1000, geo: geometry)
    }
}
