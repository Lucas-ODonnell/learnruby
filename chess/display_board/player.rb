class Player
  def initialize(color)
    @color = color
    @name = player_name
  end

  def player_name
    print "Please input your name: "
    gets.chomp
  end
end
