require 'colorize'
require 'io/console'
#didn't know how to do graphics, found out how it works through looking at examples online

class Graphics
  attr_accessor :show_cursor

  KEYMAP = {
    " " => :space,
    "\r" => :return,
    "\e[A" => :n,
    "\e[B" => :s,
    "\e[C" => :e,
    "\e[D" => :w,
    "\u0003" => :ctrl_c,
  }

  MOVES = {
    w: [0, -1],
    e: [0, 1],
    n: [-1, 0],
    s: [1, 0]
  } 

  def initialize(board)
    @board = board
    @cursor_pos = [6,4]
    @show_cursor = @board.grid[@cursor_pos[0]][@cursor_pos[1]]
  end

  def get_inputs(turn)
    puts ""
    @color = turn
    @cursor_pos = @board.find_king(@color)
    display
    puts " "
    puts "#{@color} where would you like to move from?"
    starting = get_input

    puts " "
    puts "#{@color} where would you like to move to?"
    ending = get_input
    [starting, ending]
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key).nil? ? get_input : @cursor_pos
  end

  def handle_key(key)
    case key
    when :ctrl_c
      exit 0
    when :return, :space
      @cursor_pos
    when :w, :e, :n, :s
      update_pos(MOVES[key])
      display
      nil
    else
      puts key
    end
  end

  def update_pos(new)
    new_pos = [@cursor_pos[0] + new[0], @cursor_pos[1] + new[1]]
    @cursor_pos = new_pos unless @board.outside_parameters?(new_pos)
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr

    if input == "\e" 
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end

  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def display
    puts "\e[H\e[2J"
    puts "#{@color}s turn" 
    puts " #{@color}  CHECK " if @board.check?(@color)

    @board.grid.each.with_index do |col, idx1|
      puts ""
      col.each.with_index do |piece, idx2|

        if idx1 == @cursor_pos[0] && idx2 == @cursor_pos[1]
          if piece.nil?
            print "     ".colorize( :background => :blue, :color => :black)
          else
            if piece.color == :Black
              print piece.name.colorize( :background => :blue, :color => :black)
            else
              print piece.name.colorize( :background => :blue, :color => :white)
            end
          end

        elsif piece.nil?
          if !@board.grid[@cursor_pos[0]][@cursor_pos[1]].nil? && @board.grid[@cursor_pos[0]][@cursor_pos[1]].moves.include?([idx1,idx2])
            if (idx1 + idx2).even?
              print "     ".colorize(:background => :light_yellow, :color => :black)
            else
              print "     ".colorize(:background => :light_yellow, :color => :black)
            end
            next
          end
          if (idx1 + idx2).even?
            print "     ".colorize( :background => :green, :color => :light_yellow)
          else
            print "     ".colorize( :background => :red, :color => :light_yellow)
          end
        # highlight possible captures
        elsif !@board.grid[@cursor_pos[0]][@cursor_pos[1]].nil? && @board.grid[@cursor_pos[0]][@cursor_pos[1]].moves.include?([idx1, idx2])
            if piece.color == :Black
              if (idx1 + idx2).even?
                print "#{@board.grid[idx1][idx2].name}".colorize(:background => :light_yellow, :color => :black)
              else
                print "#{@board.grid[idx1][idx2].name}".colorize(:background => :light_yellow, :color => :black)
              end
            else
              if (idx1 + idx2).even?
                print "#{@board.grid[idx1][idx2].name}".colorize(:background => :light_yellow, :color => :white)
              else
                print "#{@board.grid[idx1][idx2].name}".colorize(:background => :light_yellow, :color => :white)
              end
            end
        else
          if (idx1 + idx2).even?
            if piece.color == :Black
              print piece.name.colorize( :background => :green, :color => :black)
            else
              print piece.name.colorize( :background => :green, :color => :white)
            end
          else
            if piece.color == :Black
              print piece.name.colorize( :background => :red, :color => :black)
            else
              print piece.name.colorize( :background => :red, :color => :white)
            end
          end
        end
      end
    end
    puts " "
    if !@board.grid[@cursor_pos[0]][@cursor_pos[1]].nil? 
      puts " "
      puts "Possible Moves: "
      puts "#{@board.grid[@cursor_pos[0]][@cursor_pos[1]].moves.length}"
      puts " "
    end
  end
end
