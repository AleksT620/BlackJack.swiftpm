import SwiftUI

struct ShowCard: View {
    let card: Card
    
    var isRed: Bool {
        card.suit == "♥︎" || card.suit == "♦︎"
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(card.label)
                        .font(.headline)
                        .bold()
                    Text(card.suit)
                        .font(.subheadline)
                }
                .foregroundStyle(isRed ? .red : .black)
                Spacer()
            }
            Spacer()
            
            Text(card.suit)
                .font(.largeTitle)
                .foregroundStyle(isRed ? .red: .black)
            
            Spacer()
            
            HStack{
                Spacer()
                VStack(alignment: .trailing, spacing: 0){
                    Text(card.label)
                        .font(.headline)
                        .bold()
                    Text(card.suit)
                        .font(.subheadline)
                }
                .rotationEffect(.degrees(180))
                .foregroundStyle(isRed ? .red : .black)
            }
        }
        .padding(8)
        .frame(width: 105, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(radius: 4)
        )
        .offset(x: 0, y: 100)
    }
}
