import SwiftUI

struct ShowCard: View {
    let card: Card
    
    var isRed: Bool {
        card.suit == "♥︎" || card.suit == "♦︎"
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 70, height: 100)
                .shadow(radius: 4)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.label)
                            .font(.headline)
                            .bold()
                        Text(card.suit)
                            .font(.subheadline)
                    }
                    .foregroundStyle(isRed ? .red: .black)
                    Spacer()
                }
                Spacer()
                Text(card.suit)
                    .font(.largeTitle)
                    .foregroundStyle(isRed ? .red : .black)
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .trailing){
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
            .padding(6)
        }
    }
}
