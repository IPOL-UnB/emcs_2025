## Ativar pacotes

# Cada pacote, inclusive o foreign, tem uma documentação disponível na internet
# Nessa documentação estão disponíveis as funções que o pacote possui, além do nome do seu criador
# As função não ficam disponíveis assim que o pacote termina a instalação
# Para ativar as funções do pacote, é preciso utilizar a função library()

library(foreign)

# Uma vez instalado o pacote, não é preciso instalar mais a não ser que você reinstale o R



# Importação de dados
## Passo a passo

setwd("/Volumes/Macintosh HD/MQCP_IPOL_2020/Slides/aula 02")




## Passo a passo

# Esse diretório definido significa que as bases e os gráficos produzidos serão enviados para essa pasta
# Finalmente, vamos importar as bases de dados
# Primeiro, vamos importar a base de extensão txt com o nome baserm
# Não é preciso de pacote para esse procedimento

lines <- readLines("aula2/dados/baserm.txt")

baserm <- read.table(text = lines, sep = '\t')

## Passo a passo

# Vamos ativar as funções disponíveis no pacote readxl com a função library()

library(readxl)

# Vamos importar a base controle_cgu_municípios.xlsx
nome_caminho <- "aula2/dados/controle_cgu_municípios.xlsx"
cgu <- read_xlsx(nome_caminho)



## Importação por pacote 
library(electionsBR)
leg_df_2018 <- legend_fed(year = 2018,uf="DF")

cands <- elections_tse(2002, type = "candidate")
## Visualizando a base

# Primeira coisa importante de se informar é a classe desses objetos
# Temos 4 objetos: baserm, cgu, educacao e pnad2018

class(baserm)

class(cgu)

class(leg_df_2018)



## Visualizando a base

# Uma visão completa da base é o comando View()
# Entretanto, cuidado, dependendo do tamanho da base, podemos travar o software

View(baserm)

# Repare no V maiúsculo, lembre-se que o R é bastante sensível na sua linguagem
# O View() abre uma nova aba com a base no formato de grade
# Podemos, assim, visualizar a base de dados na forma mais intuitiva



## Visualizando a base

# Porém, para bases como a pnad2018, por exemplo, sabemos que é grande demais para sua visualização ser feita através do View()
# Algumas funções podem nos ajudar nessa tarefa
# A primeira é o dim, que as dimensões da base

dim(leg_df_2018)

# O primeiro valor sempre retrata o número de linhas, ou observações, enquanto o segundo valor apresenta o número de colunas, ou variáveis
# A função ncol() e length() também indicam quantas colunas, ou variáveis estão presentes na base



## Visualizando a base

# Outra função importante na visualização de bases de dados é a lista de nomes
# A função names() descreve as variáveis presentes na base
# Isso facilita no momento de selecionar as variáveis que entrarão na análise de vocês

names(cgu)

## Visualizando a base

# Outra função possível é o str()
# Essa função apresenta o nome das variáveis, a classe de cada uma delas e os primeiros valores

str(leg_df_2018)




## Visualizando a base

# Finalmente, a função head() e tail()
# A primeira função apresenta os primeiros valores de uma base de dados

head(baserm,2)

# O segundo argumento serve para indicar quantas linhas serão apresentadas
# Tail(), por outro lado, apresenta os últimos valores de uma base de dados

tail(baserm,4)

View(tail(leg_df_2018,2))

mean(cgu$Pibpercapita_medio,na.rm=F)

summary(cgu$Pibpercapita_medio)

# O Universo tidyverse


## Usando o pipe # O operador %>%

library(tidyverse)
library(magrittr)



## E se aumentarmos o código?

#Vamos calcular a raiz quadrada da soma dos valores de 1 a 4.
x <- c(1, 2, 3, 4)

#Primeiro, sem o pipe.
soma_x <- sum(x) #somando x
raiz_soma_x <- sqrt(soma_x) # tirando raiz quadrada da soma
raiz_soma_x


sqrt(sum(x))

#Agora com o pipe.

c(1, 2, 3, 4) %>% 
  sum %>% 
  sqrt

x %>% 
  sum %>% 
  sqrt