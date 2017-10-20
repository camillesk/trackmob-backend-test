=begin
a logica eh a seguinte: coloca a 1 rainha em algum lugar na 1 coluna, a 2 na 2, e assim por diante
sempre verificando antes se a posicao eh segura, caso nao seja possivel prosseguir e o numero
de rainhas n nao tenha sido atingido, faz um backtrack
a solucao retornada é sempre a primeira correta encontrada, porém há mais de uma correta
=end

#declaracao funcao que posiciona a rainha em um local seguro
def posiciona(tab, rai, li, col)

#verifica ataques em linha
  for i in 0..rai-1
    if tab[li][i] == "*"
      ret = false
      return
    end
  end

#verifica ataques em coluna
  for i in 0..rai-1
    if tab[i][col] == "*"
      ret = false
      return
    end
  end

#verifica ataques diagonal principal

  for i in (li).downto(0)
	puts i
    for j in (col).downto(0)	
	puts j
      if tab[i][j] == "*"
	puts "ue"
        ret = false
        return
      end
    end
  end

  for i in li..rai-1
    for j in col..rai-1
      if tab[i][j] == "*"
	puts "uepa"
        ret = false
        return
      end
    end
  end


#verifica ataques diagonal secundaria

ret = true
end

#declaracao funcao que procura uma solucao
def solucao(tab, rai, col)

#se chegou ate a 4 linha, é pq de 0 a 3 foram preenchidas com as 4 rainhas
  if col == rai
    puts "finalizo"
    fim = true
    return
  end

#verifica linha por linha, em qual posicao a rainha esta segura
  if fim != true
    for li in 0..rai-1
      ret = posiciona(tab, rai, li, col)
      if ret == true
        tab[li][col] = "*"
        puts tab.inspect
        fim = solucao(tab, rai, col + 1)
#se nao foi achado lugar para a rainha, verifica se todas ja foram posicionas, se não, volta um passo(backtracking) para explorar outra solução
      end
    end
    if fim != true
      puts "apago"
      puts li
      tab[li][col] = "-"
    end
  end
#return
end

###################### fim da declaracao de funçoes

tabuleiro = []

puts "qtd de rainhas"
rainhas = gets.to_i

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

solucao(tabuleiro, rainhas, 0)
puts tabuleiro.inspect
