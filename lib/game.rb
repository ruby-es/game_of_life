class Game

  def initialize(cell_grid)
    @cell_grid = cell_grid
  end

  def contar_celulas_vizinhas_vivas(i, j)
    n_live_cells = 0

    #a linha dele
    
    n_live_cells+=1 if @cell_grid[i] && @cell_grid[i][j-1] == '*' && j > 0
    n_live_cells+=1 if @cell_grid[i] && @cell_grid[i][j+1] == '*'

    #a linha abaixo dele
    n_live_cells+=1 if @cell_grid[i-1] && @cell_grid[i-1][j-1] == '*' && i > 0 && j > 0
    n_live_cells+=1 if @cell_grid[i-1] && @cell_grid[i-1][j] == '*'  && i > 0
    n_live_cells+=1 if @cell_grid[i-1] && @cell_grid[i-1][j+1] == '*'  && i > 0

    #a linha acima dele
    n_live_cells+=1 if @cell_grid[i+1] && @cell_grid[i+1][j-1] == '*'  && j > 0
    n_live_cells+=1 if @cell_grid[i+1] && @cell_grid[i+1][j] == '*'
    n_live_cells+=1 if @cell_grid[i+1] && @cell_grid[i+1][j+1] == '*'

    n_live_cells
  end

  def next_generation
    future_cell_grid = @cell_grid.dup

    @cell_grid.each_with_index do |row, i| 
      row.each_with_index do |col, j|
        total =  contar_celulas_vizinhas_vivas(i, j)
        viva_menos_2 = (col == '*' && total < 2)
        viva_mais_3 = (col == '*' && total > 3)
        viva_2_ou_3 = (col == '*' && (total == 2 || total == 3))
        morta_exatamente_3 = (col == '.' && total == 3)
        if viva_menos_2 || viva_mais_3
          future_cell_grid[i][j] = '.'
        elsif viva_2_ou_3 || morta_exatamente_3
          future_cell_grid[i][j] = '*'
        end
      end
    end
    future_cell_grid
  end
end