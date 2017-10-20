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
