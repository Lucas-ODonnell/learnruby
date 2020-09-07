require "./lib/lucas_odonnell_caesar_cipher"
describe CaesarCipher do
    describe "#caesar_cipher" do
        it "shifts the letters right according to the number given" do 
            caesar = CaesarCipher.new
            expect(caesar.caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
        end
    end
end

