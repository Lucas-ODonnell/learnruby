require "./lib/players"

describe Player do 
    let (:player) {Player.new(:X)}
    describe "#initialize" do 
        it "should take in a player_value argument" do
            player
        end
    end
end