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
   if caracter == "(" or caracter == "[" or caracter == "{"
      pilha << caracter    
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


