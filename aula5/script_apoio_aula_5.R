decisoes %>% select(juiz,txt_decisao) %>% 
  filter(!is.na(txt_decisao)) %>% 
  mutate(tamanho = str_length(txt_decisao)) %>% 
  group_by(juiz) %>% 
  summarise(n = n(), 
            tamanho_mediana = median(tamanho)) %>% 
  filter(n >= 10) %>% 
  arrange(desc(tamanho_mediana)) %>%
  head(5)

religiao <- tidyr::relig_income # exemplo de base dados que vem com pacote

religiao_long <- religiao %>%
  pivot_longer(!religion, 
               names_to = "renda", # diz a varável onde entrarão os nomes
               values_to = "totais" # diz a variável onde entrarão os valores
  )

decisoes %>% 
  filter(!is.na(txt_decisao)) %>%
  mutate(txt_decisao = tolower(txt_decisao),
         droga = str_detect(txt_decisao,
                            "droga|entorpecente|psicotr[óo]pico|maconha|haxixe|coca[íi]na"),
         droga_cat=case_when(
           droga==TRUE ~ "droga",
           droga==FALSE ~ "n_droga"
         )) %>%# dplyr::select(id_decisao,juiz,droga_cat)
  group_by(juiz,droga_cat) %>%
  summarise(n=n()) %>% 
  pivot_wider(names_from = droga_cat, 
              values_from = n, 
              values_fill = 0) %>%
  mutate(total=droga+n_droga,
         proporcao=droga/total)

decisoes %>%
  mutate(mes_decisao = month(dmy(data_decisao),label = T)) %>%
  group_by(juiz,mes_decisao) %>%
  summarise(n=n()) %>% 
  arrange(mes_decisao) %>%
  drop_na(mes_decisao) %>%
  pivot_wider(names_from = mes_decisao, 
              values_from = n, 
              values_fill = 0) 

decisoes %>% 
  select(n_processo, classe_assunto) %>% 
  separate(classe_assunto, c('classe', 'assunto'), sep = ' / ', 
           extra = 'merge', fill = 'right',remove=T) %>% 
  count(classe, sort = TRUE)

## count é um jeito resumido de usar group_by() %>% summarise(n())

library(dados)

plot(mtcarros$peso,mtcarros$milhas_por_galao)
data_colig <- bancadas %>% left_join(coligacoes)

(g.colig <-
    data_colig %>%
    ggplot() +
    geom_bar(aes(x=size,y=party,fill=president),stat = "identity")
)

data_colig %>%
  group_by(president) %>% 
  summarise(size=sum(size,na.rm=T)) %>% 
  drop_na(president) %>% 
  ggplot(aes(x=size,y=president,fill=president,
             color=president)) +
  geom_bar(stat = "identity",width=0.1,alpha=0.5,color=NA) +
  geom_point(size=3) +
  scale_color_discrete() +
  scale_color_discrete() +
  labs(y="",x="tamanho da bancada de apoio") +
  theme_classic() +
  theme(legend.position = "none")

