class BoardRendererText
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def render
    # 8.times do |row|
    #   puts "-------------------------"
    #   8.times do |column|
    #     piece = board[[column,row]]
    #     print "|#{board[[column, row]]} "
    #   end
    #   print "|"
    #   puts ""
    # end
    (7).downto(0) do |row|
      puts "-------------------------"
      8.times do |column|
        piece = board[[column, row]]
        print "|#{board[[column, row]]} "
      end
      print "|"
      puts ""
    end

  end
end