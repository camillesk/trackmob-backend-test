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

############################################################ ROMAN NUMERALS

#logica utilizando uma tabela de conversao, e numero max de 4000

def romanNumeral(num)

if num > 4000
  return "ERRO"
end

#funcao que ve o correspondente romano
def correspondente(romanos, arabicos, unid)
indice = 0

   if unid != 0
      (0..romanos.length).each do |i|
         if unid == arabicos[i]
            indice = i
         end
      end
      result = romanos[indice]
   else
      result = ""
   end
   result
end

romanos = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM", "M", "MM", "MMM", "MMMM"]
arabicos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 4000]		

#separa as partes do numero
mil = num - (num % 1000)
num = num % 1000

cent = num - (num % 100)
num = num % 100

dez = num - (num % 10)
num = num % 10

#ve o correspondente do milhar
mil = correspondente(romanos, arabicos, mil)

#ve o correspondente da centena
cent = correspondente(romanos, arabicos, cent)

#ve o correspondente da dezena
dez = correspondente(romanos, arabicos, dez)

#ve o correspondente da unidade
num = correspondente(romanos, arabicos, num)

#puts "o resultado é: " + mil + cent + dez + num

return mil + cent + dez + num

end

############################################################ PARENTHESES

#logica utilizada: criar uma pilha, a cada aparicao dos caracteres de "inicio" é adicionado à pilha, e a cada aparicao do caractere de "fim" é retirado da pilha. Se ao final houver algo na pilha, é pq n esta balanceado.

def parentheses(exp)

def verifica(pilha, par)
   if pilha.last != par
     result = false
   else
     result = true
   end
   result
end


pilha = []

while exp.length != 0
caracter = exp[0,1]
#carateres de inicio sao adicionados à pilha
   if caracter == "(" or caracter == "[" or caracter == "{"
      pilha << caracter  
#caracteres de fim, é definido o seu par e procurado no fim da pilha. Precisa ser o ultimo se n, n esta balanceado  
   elsif caracter == ")" or caracter == "]" or caracter == "}"
      if pilha.length != 0
         pilha_inicial = pilha.length
         if caracter == ")"
            if verifica(pilha, "(") == true
               pilha.pop
	    else
	       return false
            end
         elsif caracter == "]"
            if verifica(pilha, "[") == true
               pilha.pop
	    else
	       return false
            end
         elsif caracter == "}"
            if verifica(pilha, "{") == true
               pilha.pop
	    else
	       return false
            end
         end
         if pilha.length == pilha_inicial
            return false
         end
      else
         return false
      end
   end
   exp.slice!(0) #retira o 1 caracter da expressao inicial  
end

if pilha.length == 0
  return true
end

end
