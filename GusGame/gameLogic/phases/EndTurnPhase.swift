import Foundation


final class EndTurnPhase: Phase {
    let winners: [Player]
    let country: Country
    
    init(winners: [Player], country: Country, game: MutableGame) {
        self.winners = winners
        self.country = country
        super.init(game: game)
    }
    
    func commit() -> Phase {
        
        if let country: Country = game.getNextCountry() {
            return FindCountryPhase(country: country, player: game.firstPlayer(), game: game)
        }
        return EndGamePhase(game: game)
    }
}
