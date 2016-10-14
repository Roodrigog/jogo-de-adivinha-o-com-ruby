def boa_vidas 
	puts "Esse é jogo da advinhação (versão ruby) "
	puts "Qual seu nome ?" 
	nome = gets.strip
	puts "Olá #{nome},o jogo é simples voce terá 5 chances para acerta um número secreto boa sorte" 
	nome
end
def pede_dificuldade 
	puts "Qual o nível de dificuldade que deseja (1 fácil ,5 muito difícl)"
	dificuldade = gets.to_i
	dificuldade
end
def sorteia(dificuldade)
	case dificuldade
	when 1 
	    maximo = 40   
	when 2 
	    maximo = 80
	when 3
	    maximo = 120
	when 4   
	    maximo = 160
	else 
	    maximo = 200
	end 
	sorteado= rand(maximo)
	puts "Sorteando um número 1 a #{maximo}"
	puts "Vamos começar a jogar!!!"
	sorteado#o return é voluntário
end

def pede_numero(x)
	puts "diga seu chute #{x}" 
    pede = gets.strip
    pede = pede.to_i
    pede
end

def compara(c,s,t,p)
	if c == s
	puts("Voce ganhou!!!")
	puts "Sua pontuação foi: #{p}"
	return true 
elsif t == 0 
    puts "Acabou suas chances reinicie o jogo"
    puts "Sua pontuação foi: #{p}"
    puts "O numero secreto era #{s}"
    return false
else 
	if c > s
	    puts "Voce perdeu,o numero secreto é menor,voce ainda tem "+t.to_s+" tentativas"
	
    else c < s
    	puts "Voce perdeu,o numero secreto é maior ,voce ainda tem "+t.to_s+" tentativas"
    
    end
    return false
end
end
nome = boa_vidas
dificuldade = pede_dificuldade
secreto = sorteia(dificuldade) #voce tem que guardar o que função devolve em algum lugar
tentativa = 5
limite = tentativa
chutes=[]
pontos_iniciais = 1000
loop do 
for conta in 1..limite
chute = pede_numero(nome)
if nome == "Rodrigo"
    puts "Acertou!!!"
    break
    
end 

tentativa -= 1 
chutes << chute
subtr = (secreto - chute).abs# transforma em inteiro sem sinal 
pontos_perder = subtr/2.0

pontos_iniciais -= pontos_perder
puts "Seu chutes foram: "+chutes.to_s
break if compara(chute,secreto,tentativa,pontos_iniciais)


#ou break
# end 

end 
puts "Deseja jogar novamente?Vc parece bom,com advinhação(responda sim ou não)"
desejo = gets.strip
if desejo == "não"
	puts "Tchau!!!"
	break
elsif desejo == "sim"
   tentativa = limite
end 
end 