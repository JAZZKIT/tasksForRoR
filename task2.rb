def print_winner(winner)
  
  puts "==================="
  puts winner == nil ?  "Winner - '' " : "Winner - #{winner}" 
  exit
end

def makeArrayWithMatrix(boardMatrix)
  board = []
  boardMatrix.each do |arr|
    arr.each_with_index do |i, index|
      board.push arr[index]
    end
  end
  checker(board)
end


def checker(board)
  (0..2).each do |i|
    if board[i] == board[3+i] && board[3+i] == board[6+i]
      print_winner(board[0])
    end
  end

  [0, 3, 6].each do |i|
    if board[i] == board[i+1] && board[i+1] == board[i+2]
      print_winner(board[i])
    end
  end

  if board[0] == board[4] && board[4] == board[8]
    print_winner(board[0])
  end

  if board[2] == board[4] && board[4] == board[6]
    print_winner(board[2])
  else
    print_winner('')
  end
end

mat = [
  ['X','',''],
  ['','X',''],
  ['O','','X']
  ]
  
makeArrayWithMatrix(mat)
