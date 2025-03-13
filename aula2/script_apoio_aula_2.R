
# Cuidado com a utilização de etiquetas com o mesmo nome de funções, pode gerar confusão no script


## Classes

## Númerico

# Numeric é a classe composta por valores númericos

class(sorte)


# Objetos do tipo "numeric" permitem funções matemáticas como média, mediana etc...
# No caso de valores decimais, utilizamos ponto ao invés de vírgula
decimal <- 3,5

# Erro: ',' inesperado in "decimal <- 3,"

decimal <- 3.5

decimal = 3.5

## Lógico

# Logical é a classe composta por TRUE, FALSE e NA


vdd <- TRUE
vdd <- T
class(vdd)



# Não é preciso escrever sempre TRUE e FALSE, isto é, podemos resumir para T e F, respectivamente

# Por trás dos valores T e F, há valores númericos correspondente a 1 e 0


T + F




## Caracteres

# Characters é a classe composta por nomes

# Importante característica é que os nomes devem estar dentro de aspas, caso contrário, o R não reconhecerá como caracter


nome <- "Alvaro"

nome

class(nome)





## Caracteres vs Fatores

# Em termos estatísticos, não há diferença entre caracteres e fatores
# Fatores apresentam as categorias por dentro de vetor.
# Em termos de manipulação de dataframes, porém, veremos que esses dois objetos terão tratamento distintos, a começar pela importação da base e a definição de string tratada como factor



# Vetores
## O que são vetores?

# Vetores são combinações de valores em uma estrutura unidimensional 
# Ou seja, podem ser combinações de números, valores lógicos, nomes e várias outras possibilidades
# Por exemplo, combinação de valores pares: 2,4,6,8
# Ou a combinações de nomes começando por P: Pedro, Paula, Pietro, Paloma
# Combinação de valores lógico: TRUE, FALSE, TRUE, TRUE


## Criação de vetores

# Para criar vetores é importante combinar valores
# A função necessária para a criação de vetores, portanto, é a função c(), c de *combine* ou *concatenate*

c(2,4,6,8)

c("Pedro","Paula","Pietro","Paloma")

c(TRUE,FALSE,TRUE,FALSE)



## Etiquetas para vetores

# Assim como fizemos com os valores, atribuímos também etiquetas aos vetores
# Dessa maneira, podemos trabalhar com as sequências ao longo do script, assim como dar razão ou justificativa aos valores combinados

n_pares <- c(2,4,6,8)

nomes_com_p <- 
  c("Pedro","Paula","Pietro","Paloma") 

valores_log <- c(TRUE,FALSE,TRUE,FALSE)



## Classes dos vetores

# Os vetores também possuem classes
# Essas categorias determinam as operações possíveis dentro de um vetor
# Para obter a informação sobre a classe de um vetor, utilizamos a função class()

class(n_pares)

class(nomes_com_p)

class(valores_log)


vetor_louco <- c(T,1)

class(vetor_louco)

## Comprimento de vetores

# Os vetores podem ser medidos em relação ao seu comprimento
# O seu comprimento define a extensão do vetor, assim como quantos elementos estão presentes dentro da combinação de valores
# O comprimento pode ser medido pela função length()

length(n_pares)

length(c(2,3,4))

length(nomes_com_p)

length(valores_log)





## Somatório de vetores

# Para vetores númerico podemos somar os valores de um vetor
# A função se chama sum() que corresponde ao $\sum$

sum(n_pares)


# Em vetores com valores lógicos, com TRUE e FALSE, o sum soma o número de T que temos dentro de um vetor


sum(valores.log)




## Somatório de vetores

# A função sum() pode se tornar ainda um contador de um teste
# Por exemplo, queremos saber quantos nomes são iguais ao de Pedro no vetor 'nomes.com.p'

teste1 <- nomes_com_p == "Pedro"

teste1

sum(teste1)

(teste2 <- n_pares == 2)



## Seleção de elementos

# Queremos selecionar no vetor nomes.com.p o segundo elemento que é Paula
# Vejamos, primeiro, como se compõe o vetor de caracteres nomes.com.p e a lógica do posicionamento dentro do vetor

nomes.com.p




## Seleção de elementos

# Vamos testar se Paula se inclui dentro do vetor sem termos que ver no console
# As vezes, vetores são maiores do que temos como exemplo
# O teste lógico, portanto, utilizamos o operado %in%, que retorna TRUE, caso o valor esteja incluso no vetor

"Paula" %in% nomes.com.p

## Seleção de elementos

# Para escolhar Paula, portanto, vamos definir como a segunda posição dentro do vetor

nomes.com.p[2]

# O posicionamento dos nomes ao longo do vetor determina como seleciona-lo individualmente
# Porém, podemos selecionar através do valor

nomes.com.p[nomes.com.p == "Paula"]



## Seleção de elementos

# Selecionamos também o último valor do vetor nomes.com.p
# Sabemos que o vetor possui 4 valores utilizando a função length()

length(nomes.com.p)

# Assim o último valor é igual a 4
# Para selecionarmos o último valor, ou definimos como a posição 4 ou apenas o length() do vetor

nomes.com.p[4]

nomes.com.p[length(nomes.com.p)]




## Seleção de elementos

# Para seleção de elementos através de regras, podemos utilizar o vetor númerico de n.pares

n.pares  <- c(2,4,6,8)

n.pares


# O objetivo aqui é selecionar os elementos maiores que 5, que é a mediana do vetor

median(n.pares)





## Seleção de elementos

# Selecionamos, assim, os elementos acima da mediana do vetor n.pares, que são os valores 6 e 8

n.pares[n.pares > 5]

# Ou ainda podemos definir o valor 5 como o valor da mediana
# O resultado é o mesmo, porém, deixa claro ao leitor do seu script que se trata dos valores acima da mediana do vetor n.pares

n.pares[n.pares > median(n.pares)]


# Operações matemáticas
## Operações com vetores
# Em vetores numéricos, podemos fazer operações matemáticas a partir do seu posicionamento
# Vamos calcular o alcance do vetor "n.pares"

#ultimo elemento 
n.pares[length(n.pares)]

#primeiro elemento
n.pares[1]


# Subtraindo esses dois elementos, temos o alcance do vetor

n.pares[length(n.pares)] - n.pares[1]




## Operações com vetores

# Ainda em vetores numéricos, vamos calcular vetores com regras
# Selecionamos elementos maiores que 5

n.pares[n.pares >= 5]


# Queremos duplicar os valores inclusos dentro da condição

n.pares[n.pares >= 5] * 2


# Por fim, operacionar um conjunto com um elemento

n.pares[n.pares >= 5] * n.pares[1]




## Conjuntos

# Utilizamos a teoria de conjuntos no R com a função de manipular e identificar elementos comuns ou diferente entre vetores
# Já temos o vetor "n.pares" e vamos criar um vetor com números naturais

n.naturais <- c(0,1,2,3,4,5,6,7,8,9)
n.naturais


# Se perguntarmos por valores que não estão no vetor "n.naturais", o resultado será conjunto vazio

n.naturais[n.naturais == 10]


## Conjuntos

# Outro ponto importante é saber se os elementos estão contidos dentro de outro vetor
# A pergunta a se fazer é: os elementos do vetor "n.pares" está contido no vetor "n.naturais"
# No R, contidos é igual a \%in\%

n.pares %in% n.naturais


# Isto é, o vetor "n.pares" está contido no vetor "n.naturais" e é um subconjunto
# Outra maneira, porém é utilizando a função is.element()

is.element(n.pares,n.naturais)


## Conjuntos

# Para encontrar os valores exclusivos de um conjunto, vamos utilizar a escrita da seleção de elementos
# Podemos incluir a notação de "!", que quer dizer diferente
# Portanto, selecionamos os valores que estão contido no conjunto dos naturais, porém não no conjunto dos valores pares

n.naturais[!is.element(n.naturais,n.pares)]




## Conjuntos

# Por fim, vamos testar se um valor está presente em um desses vetores
# Testaremos os valores 1, 11 e 21

1 %in% c(n.naturais,n.pares)

11 %in% c(n.naturais,n.pares)

21 %in% c(n.naturais,n.pares)

# Assim, não temos os valores 11 e 21 em nenhum dos vetores, entendidos como conjuntos 


# data.frame

## data.frame

# Um data.frame é o mesmo que uma tabela do SQL ou uma planilha Excel
# seus dados provavelmente serão importados para um objeto data.frame 

# data.frame’s são listas especiais em que todos os elementos possuem o mesmo comprimento.

# Cada elemento dessa lista pode ser pensado como uma coluna da tabela # ou como uma variável. Uso do '$'

# Seu comprimento representa o número de linhas # ou seja, de observações

pacman::p_load(foreign)




