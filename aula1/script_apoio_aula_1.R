# emcs_2025
# https://ipol-unb.github.io/emcs_2025/
# https://posit.co/download/rstudio-desktop/
# https://posit.cloud/
# https://pt.r4ds.hadley.nz/
# https://github.com/IPOL-UnB/emcs_2025

## R como calculadora


# Uma função primordial e básica do R, 
# como software estatístico, é de calculadora
# O R possui os operadores básicos da matemática 
# como '+' , '-', '*' e '/'


5 + 5 + 5

5 - 3

4 * 9

16 / 2

2^3

## R como calculadora

# Assim como na matemática, atenção em relação aos ()


(5 + 6) * 3

5 + 6 * 3

# Além das funções de exponencial e raiz quadrada

# Respectivamente, ^ e sqrt()

2 ^ 2

sqrt(36)

## Lógica

# O R permite também avaliações lógicas
# Ou seja, o software possui operadores lógicos afim de fazer testes lógicos com resultados de Verdadeiro ou Falso de acordo com a proposição
# Os principais operadores são $==$, $<$ , $>$, $<=$ , $>=$ e $!=$
  
5 == 5

5 <= 5 / 5

5 * 4 > 5

3 != 6




## Lógica

# Testamos também Verdade e Falsidade

TRUE == TRUE


TRUE <= FALSE

# Assim como testamos caracteres

"Python" == "python"

"Stata" != "Sasta"





## Operadores lógicos especiais

# Atenção para os operadores e e ou
# O primeiro, para ser verdade, precisa que todos os pressupostos sejam verdadeiros

(3 == 3) & (4 != 5)

# O ou, por sua vez, para ser verdade precisa que apenas 1 pressuposto seja verdadeiro

(3 != 3) | (4 != 5)




## Atribuição

# Trata-se da famosa setinha que indica objetos (valores, vetores, dataframes) para alguma etiqueta
# Dessa maneira, podemos 'salvar' os objetos nas etiquetas para utilizarmos através dessas em qualquer momento ao longo do script
# Quando utilizadas em operações, as etiquetas representam aquilo que fora atribuído a elas
# Quando criamos a etiqueta, não geramos outputs, apenas quando rodamos diretamente a etiqueta


sorte <- 5
c <- 3
3 -> d
(e <- c+d)
rm(c,d)
c = 3
3 = d

sortea = 6
rm(sortea)


## Regras do uso da setinha

# Atenção, letras maiúsculas e minúsculas importam

sorte <- 5

Sorte

# Erro: objeto 'Sorte' não encontrado

um_objeto_bem_doido_que_ficou_grandao <- 23 

outro_objeto_de_texto <- "Sim"

# Também não podemos criar etiquetas que começam com números


15luck <- 15
a15luck <- 15
a15luck
a.1 <- 4

# Erro: unexpected symbol in "15luck"

