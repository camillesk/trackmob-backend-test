=begin
a logica eh a seguinte: coloca a 1 rainha em algum lugar na 1 coluna, a 2 na 2, e assim por diante
sempre verificando antes se a posicao eh segura, caso nao seja possivel prosseguir e o numero
de rainhas n nao tenha sido atingido, faz um backtrack
a solucao retornada é sempre a primeira correta encontrada, porém há mais de uma correta
=end

def nqueens(rainhas)

if rainhas < 4
  return "ERRO"
end

#declaracao funcao que posiciona a rainha em um local seguro
def posiciona(tab, rai, li, col)

#verifica ataques em linha
  for i in 0..rai-1
    if tab[li][i] == "*"
      pos = false
      return
    end
  end

#verifica ataques em coluna
  for i in 0..rai-1
    if tab[i][col] == "*"
      pos = false
      return
    end
  end

#verifica ataques diagonal principal
=begin
  for i in li.downto(0)
    for j in col.downto(0)
      if tab[i][j] == "*"	
        puts "hit"
        ret = false
        return
      end
    end
  end

  for i in li..rai-1
    for j in col..rai-1
      if tab[i][j] == "*"
        ret = false
        return
      end
    end
  end
=end

#verifica ataques diagonal secundaria

pos = true
end

#declaracao funcao que procura uma solucao
def solucao(tab, rai, col)

#se chegou ate a 4 linha, é pq de 0 a 3 foram preenchidas com as 4 rainhas
  if col >= rai
    sol = true
    return
  end

#verifica linha por linha, em qual posicao a rainha esta segura
   for li in 0..rai-1
      pos = posiciona(tab, rai, li, col)
      if pos == true
         tab[li][col] = "*"
         sol = solucao(tab, rai, col + 1)
	 if sol != false
	   sol = true
           return
         else
#se nao foi achado lugar para a rainha, verifica se todas ja foram posicionadas, se não, volta um passo(backtracking) para explorar outra solução
	   tab[li][col] = "-"
         end
      end
    end
end

tabuleiro = []
sol = ""

#cria o tabuleiro
rainhas.times do
  tabuleiro << []	
end

#preenche o tabuleiro
(0..rainhas-1).each do |i|
  (0..rainhas-1).each do |j|
    tabuleiro[i][j] = "-"
  end
end

fim = solucao(tabuleiro, rainhas, 0)

#preenche a string solucao
(0..rainhas-1).each do |i|
  (0..rainhas-1).each do |j|
    sol << tabuleiro[i][j]
  end
  sol << "\n"
end

#puts sol
	
return sol
end
