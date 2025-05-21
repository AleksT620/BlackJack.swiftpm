import SwiftUI

struct AnimatedCard: View {
    let card: Card
    @State var revealed = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(.gray.opacity(0.4), lineWidth: 2)
                }
                .opacity(revealed ? 0:1)
            
            ShowCard(card: card)
                .opacity(revealed ? 1:0)
        }
        .frame(width: 100, height: 145)
        .rotation3DEffect(.degrees(revealed ? 1:0), axis: (x: 0, y: 1, z: 0))
        .animation(.easeOut(duration: 0.6), value: revealed)
        .onAppear {
            revealed = true
        }
    }
}
