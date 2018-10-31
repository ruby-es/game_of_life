require_relative '../lib/game'

describe Game do

   it 'grid 2x2 e célula viva com menos de 2 vizinhos morre' do
     game = Game.new([
       ['*', '.'],
       ['.', '.']
     ])
    expect(game.next_generation).to eq([
      ['.', '.'],
      ['.', '.']
    ])
  end

  it 'grid 2x2 e célula viva com menos de 2 vizinhos morre' do
     game = Game.new([
       ['*', '*'],
       ['*', '*']
     ])
    expect(game.next_generation).to eq([
      ['*', '*'],
      ['*', '*']
    ])
  end

  it 'grid 2x2 e célula viva com menos de 2 vizinhos morre' do
     game = Game.new([
       ['*', '*', '.'],
       ['*', '*', '*'],
       ['*', '*', '*']
     ])
    expect(game.next_generation).to eq([
     ['*', '.', '*'],
       ['.', '.', '.'],
       ['*', '.', '*']
    ])
  end

  it '2x2 faz contagem de celulas vivas 3,2,2,2' do 
    game = Game.new([
      ['.', '*'],
      ['*', '*']
    ])

    expect(game.contar_celulas_vizinhas_vivas(0,0)).to eq(3)
    expect(game.contar_celulas_vizinhas_vivas(0,1)).to eq(2)
    expect(game.contar_celulas_vizinhas_vivas(1,0)).to eq(2)
    expect(game.contar_celulas_vizinhas_vivas(1,1)).to eq(2)
  end
 
  it '3x3 faz contagem de celulas vivas 3,2,2,2' do 
    game = Game.new([
      ['.', '*', '*'],
      ['*', '*', '*'],
      ['*', '*', '*']
    ])
    

    expect(game.contar_celulas_vizinhas_vivas(0,0)).to eq(3)
    expect(game.contar_celulas_vizinhas_vivas(0,1)).to eq(4)
    expect(game.contar_celulas_vizinhas_vivas(1,1)).to eq(7)
  end

  it '3x3 faz contagem de celulas vivas 3,2,2,2' do 
    game = Game.new([
      ['*', '*', '.'],
       ['*', '*', '*'],
       ['*', '*', '*']
    ])
    

    expect(game.contar_celulas_vizinhas_vivas(0,2)).to eq(3)
  end
end