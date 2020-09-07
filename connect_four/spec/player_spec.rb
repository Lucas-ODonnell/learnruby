require "./lib/player"

describe Player do 
    let(:player) { Player.new("R") }
    describe "#initialize" do 
        it "should create a player that takes in a color as an argument" do 
            player
        end
    
        it "should ask player for a name" do 
            expect(player.name).to eql("Lucas") 
        end
    end
end