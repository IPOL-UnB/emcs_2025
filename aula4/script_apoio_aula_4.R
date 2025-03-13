
## Tidy data e janitor
library(janitor)


# Pacotes `dplyr` e `tidyr`

## Conjunto de dados

#Vamos trabalhar com a base `decisoes`, que contém decisões do Tribunal de Justiça de São Paulo


decisoes <- read_rds("dados/decisoes.rds")
glimpse(decisoes)





decisoes <- read_rds("dados/decisoes.rds") %>%
  janitor::clean_names() # com dois pontos eu não preciso usar library
glimpse(decisoes)




## Características do `dplyr`


# select

## `select`

# Utilizar `starts_with(x)`, `contains(x)`, `matches(x)`, `one_of(x)`, etc.
# Possível colocar nomes, índices, e intervalos de variáveis com `:`.

## Em ação


decisoes %>% 
  select(id_decisao, n_processo, municipio, juiz)


## Em ação


decisoes %>% 
  select(classe_assunto:id_decisao, juiz)


## Em ação


decisoes %>% 
  select(id_decisao, starts_with('data_'))



## Operações

# selecione as colunas que acabam com "cisao".


decisoes %>% 
  select(ends_with("cisao"))


## Operações 
# tire as colunas de texto = 'txt_decisao' e classe/assunto = 'classe_assunto'.
# Dica: veja os exemplos de `?select` em `Drop variables ...`


decisoes %>% 
  select(-classe_assunto, -txt_decisao)


# filter

## `filter`


decisoes %>% 
  select(n_processo, id_decisao, municipio, juiz) %>% 
  filter(municipio == 'São Paulo')


## Dica: usar `%in%`

library(lubridate) # para trabalhar com as datas
#`day(dmy(data_decisao))` pega o dia da decisão. 



decisoes %>% 
  select(id_decisao, municipio, data_decisao, juiz) %>% 
  # municipio igual a campinas ou jaú, OU dia da decisão maior ou igual a 25
  filter(municipio %in% c('Campinas', 'Jaú') | day(dmy(data_decisao)) >= 25)




## Mais ação


decisoes %>% 
  select(juiz) %>% 
  # filtra juízes que têm `Z` ou `z` no nome
  filter(str_detect(juiz, regex("z", ignore_case = TRUE))) %>% 
  # conta e ordena os juizes em ordem decrescente
  count(juiz, sort = TRUE) %>%
  head(5)

## 

# filtre apenas casos em que `id_decisao` não é `NA`
decisoes %>% 
  filter(is.na(id_decisao))



##

# filtre todas as decisões de 2018.

# Dica: função `lubridate::year()`
decisoes %>% 
  filter(year(dmy(data_decisao)) == 2018)


# mutate

## `mutate`

# Aceita várias novas colunas iterativamente.

# Novas variáveis devem ter o mesmo `length` que o `nrow` do bd original ou `1`.

## `mutate` em ação

decisoes %>% 
  select(n_processo, data_decisao, data_registro) %>% 
  mutate(tempo = dmy(data_registro) - dmy(data_decisao))


## 

# Crie uma coluna binária `drogas` que vale `TRUE` se no texto da decisão algo é falado de drogas e `FALSE` caso contrário. 
# Dica: `str_detect`

#Obs.: Considere tanto a palavra 'droga' como seus sinônimos, ou algum exemplo de droga e retire os casos em que `txt_decisao` é vazio


decisoes %>% 
  filter(!is.na(txt_decisao)) %>% 
  mutate(txt_decisao = tolower(txt_decisao),
         droga = str_detect(txt_decisao,
                            "droga|entorpecente|psicotr[óo]pico|maconha|haxixe|coca[íi]na")) %>%
  dplyr::select(n_processo,droga) 



# summarise

## `summarise`

# Retorna um vetor de tamanho `1` a partir de uma operação com as variáveis (aplicação de uma função).
# Geralmente é utilizado em conjunto com `group_by()`.
# Algumas funções importantes: `n()`, `n_distinct()`.

## Em ação

decisoes %>% 
  select(n_processo, municipio, data_decisao) %>%
  #        pega ano da decisão
  mutate(ano_julgamento = year(dmy(data_decisao)),
         # pega o ano do processo 0057003-20.2017.8.26.0000" -> "2017"
         ano_proc = str_sub(n_processo, 12, 15),
         # transforma o ano em inteiro
         ano_proc = as.numeric(ano_proc),
         # calcula o tempo em anos
         tempo_anos = ano_julgamento - ano_proc) %>% 
  group_by(municipio) %>% 
  summarise(n = n(),
            media_anos = mean(tempo_anos),
            min_anos = min(tempo_anos),
            max_anos = max(tempo_anos)) 


## Resultado



decisoes %>% 
  select(n_processo, municipio, data_decisao) %>%
  #        pega ano da decisão
  mutate(ano_julgamento = year(dmy(data_decisao)),
         # pega o ano do processo 0057003-20.2017.8.26.0000" -> "2017"
         ano_proc = str_sub(n_processo, 12, 15),
         # transforma o ano em inteiro
         ano_proc = as.numeric(ano_proc),
         # calcula o tempo em anos
         tempo_anos = ano_julgamento - ano_proc) %>% 
  group_by(municipio) %>% 
  summarise(n = n(),
            media_anos = mean(tempo_anos),
            min_anos = min(tempo_anos),
            max_anos = max(tempo_anos)) 



## usando `count()`

#A função `count()`, simplifica um `group_by %>% summarise %>% ungroup`:


decisoes %>% 
  count(juiz, sort = TRUE) %>% 
  mutate(prop = n / sum(n), 
         prop = scales::percent(prop))



## + fácil ainda

#mas sem formato %


decisoes %>% 
  count(juiz, sort = TRUE) %>% 
  mutate(prop = prop.table(n))



# arrange

## `arrange`


## 


decisoes %>% 
  filter(!is.na(txt_decisao)) %>% 
  mutate(tamanho = str_length(txt_decisao)) %>% 
  group_by(juiz) %>% 
  summarise(n = n(), 
            tamanho_mediana = median(tamanho)) %>% 
  filter(n >= 10) %>% 
  arrange(desc(tamanho_mediana)) %>%
  head()






