# Carrega as bibliotecas necessárias
# install.packages("dplyr") # Descomente para instalar se necessário
library(dplyr)

# 1. Definição da constante do raio da Terra (em km)
R <- 6371

# 2. Implementação da função Haversine
# Coordenadas devem ser passadas em graus
haversine_distance <- function(lat1, lon1, lat2, lon2) {
  # Converte graus para radianos
  rad <- function(deg) { deg * pi / 180 }
  
  phi1 <- rad(lat1)
  phi2 <- rad(lat2)
  lambda1 <- rad(lon1)
  lambda2 <- rad(lon2)
  
  # Diferenças
  d_phi <- phi2 - phi1
  d_lambda <- lambda2 - lambda1
  
  # Fórmula de Haversine
  a <- sin(d_phi / 2)^2 + cos(phi1) * cos(phi2) * sin(d_lambda / 2)^2
  d <- 2 * R * asin(sqrt(a))
  
  return(d)
}

# 3. Carregamento dos dados (Assumindo que michelin.csv está no diretório de trabalho)
df_michelin <- read.csv("michelin.csv")
View (df_michelin)

# 4. Localiza o restaurante de partida 
per_se <- df_michelin %>% filter(Name == "Sorrel", Location == "San Francisco, USA")
lat_per_se <- per_se$Latitude[1]
lon_per_se <- per_se$Longitude[1]

# 5. Filtra restaurantes com exatamente '1 Star'
df_one_star <- df_michelin %>% filter(Award == "1 Star")

# 6. Calcula a distância de 'Per Se' para todos os restaurantes '1 Star'
distancias <- df_one_star %>%
  rowwise() %>%
  mutate(
    dist_km = haversine_distance(lat_per_se, lon_per_se, Latitude, Longitude)
  ) %>%
  ungroup()

# 7. Encontra a distância mínima (e remove a distância de Per Se para ele mesmo, se estiver na lista)
min_distance <- distancias %>%
  filter(dist_km > 0.1) %>% # Filtra distâncias muito pequenas (para não considerar o próprio restaurante)
  summarise(min_dist = min(dist_km)) %>%
  pull(min_dist)

cat("Distância mínima para o próximo restaurante 1 Star:", round(min_distance, 2), "km\n")

#PERGUNTA: Total de restaurantes com 1, 2 ou 3 estrelas Michelin a uma distância de 100 km.
# ----------------------------------------------------------------------

# Filtra restaurantes com estrelas e calcula a distância
df_estrelas <- df_michelin %>%
  filter(Award %in% c("1 Star", "2 Stars", "3 Stars")) %>%
  rowwise() %>%
  mutate(
    dist_km = haversine_distance(lat_per_se, lon_per_se, Latitude, Longitude)
  ) %>%
  ungroup()

# Conta os restaurantes dentro do raio de 100 km (e exclui o próprio Per Se, por segurança)
restaurantes_100km <- df_estrelas %>%
  filter(dist_km <= 100, dist_km > 0.1) %>%
  nrow()

cat("1. Restaurantes 1/2/3 Estrelas a até 100 km:", restaurantes_100km, "\n")
cat("----------------------------------------------------------------------\n")

#PERGUNTA: Aniversário - 1, 2 ou 3 estrelas, máximo de 2 'dinheiros' e até 3000 km, fora da cidade inicial.
# ----------------------------------------------------------------------
# SUPOSIÇÃO: "2 dinheiros locais" corresponde ao símbolo '$$' na coluna 'Price'.

restaurantes_aniversario <- df_michelin %>%
  # 1. Pelo menos uma estrela
  filter(Award %in% c("1 Star", "2 Stars", "3 Stars")) %>%
  # 2. Pode gastar até 2 dinheiros ('$' e '$$' são aceitos, '$$$' e '$$$$' não)
  filter(Price %in% c("$", "$$")) %>%
  # 3. Fora da cidade inicial
  filter(Location != "New York, USA") %>%
  # Calcula a distância
  rowwise() %>%
  mutate(
    dist_km = haversine_distance(lat_per_se, lon_per_se, Latitude, Longitude)
  ) %>%
  ungroup() %>%
  # 4. Distância máxima de 3000 km
  filter(dist_km <= 3000) %>%
  nrow()

cat("2. Restaurantes disponíveis para o aniversário:", restaurantes_aniversario, "\n")
cat("----------------------------------------------------------------------\n")

## 3. PERGUNTA: Distância mínima para a culinária American (em km).
# ----------------------------------------------------------------------
# A culinária está na coluna 'Cuisine', que pode conter várias cozinhas (ex: 'American, French').
# Usamos grepl para verificar se "American" está em alguma parte da string.

df_american <- df_michelin %>%
  # Filtra restaurantes que servem "American"
  filter(grepl("Contemporary", Cuisine, ignore.case = TRUE)) %>%
  # Calcula a distância de 'Per Se' para estes restaurantes
  rowwise() %>%
  mutate(
    dist_km = haversine_distance(lat_per_se, lon_per_se, Latitude, Longitude)
  ) %>%
  ungroup()

# Encontra a distância mínima (e exclui o próprio Per Se, pois ele serve American e a distância é 0)
min_dist_american <- df_american %>%
  filter(dist_km > 0.1) %>% # Filtra distâncias muito pequenas (o próprio Per Se, se for o caso)
  summarise(min_dist = min(dist_km)) %>%
  pull(min_dist)

cat("3. Distância mínima para Culinária American:", round(min_dist_american, 2), "km\n")
cat("----------------------------------------------------------------------\n")

# 5. Filtra restaurantes com exatamente '1 Star'
df_one_star <- df_michelin %>% filter(Award == "1 Star")

# 6. Calcula a distância de 'Per Se' para todos os restaurantes '1 Star'
distancias <- df_one_star %>%
  rowwise() %>%
  mutate(
    dist_km = haversine_distance(lat_per_se, lon_per_se, Latitude, Longitude)
  ) %>%
  ungroup()

# 7. Encontra a distância mínima (filtrando o próprio Per Se, se for um restaurante '1 Star')
min_distance <- distancias %>%
  filter(dist_km > 0.1) %>% # Filtra distâncias muito pequenas para não considerar o próprio restaurante
  summarise(min_dist = min(dist_km)) %>%
  pull(min_dist)

# Exibe o resultado arredondado
cat("O entusiasta precisa viajar:", round(min_distance, 2), "km para visitar o próximo restaurante 1 Star.\n")


# Para as perguntas a seguir, utilize o banco de dados proveninete do Tidytuesday de 2021, semana 48, que contém informações sobre a série de TV Dr. Who. Para carregar o banco, utilize a função abaixo.

tuesdata <- tidytuesdayR::tt_load(2021, week = 48)
writers <- tuesdata$writers
View (writers)
directors <- tuesdata$directors
View (directors)
episodes <- tuesdata$episodes
View (episodes)
imdb <- tuesdata$imdb
View (imdb)

df_intermedio <- full_join(directors, writers, by = "story_number")
df_drwho <- full_join(df_intermedio, episodes, by = "story_number")

# Filtra o dataframe pela dupla e conta as linhas (episódios)
episodios_dupla <- df_drwho %>%
  filter(director == "Hettie MacDonald ", writer == "Steven Moffat") %>%
  nrow()

# Exibe o resultado
cat("A dupla Joe Ahearne e Russell T Davies é responsável por", episodios_dupla, "episódios.\n")

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# Filtra o dataframe para o escritor e o ano especificados
episodios_moffat_2020 <- df_drwho %>%
  filter(writer == "Steven Moffat") %>%
  # Extrai os primeiros 4 caracteres de 'first_aired' (que é o ano) e compara com "2011"
  filter(substr(first_aired, 1, 4) == "2020") %>%
  nrow()

# Exibe o resultado
cat("Em 2011, Steven Moffat escreveu", episodios_moffat_2011, "episódios.\n")

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# 1. Filtra os episódios escritos por Mark Gatiss
# 2. Extrai o ano da coluna 'first_aired'
# 3. Encontra o ano mínimo e máximo
anos_trabalhados <- df_drwho %>%
  filter(writer == "Matthew Graham") %>%
  mutate(year = as.numeric(substr(first_aired, 1, 4))) %>%
  summarise(
    min_year = min(year),
    max_year = max(year)
  )

# Calcula a diferença de anos e adiciona 1 (para incluir o ano de início)
anos_totais <- anos_trabalhados$max_year[1] - anos_trabalhados$min_year[1] 

# Exibe o resultado
cat("Mark Gatiss trabalhou na série por", anos_totais, "anos.\n")

roteiros_mark_gatiss <- df_drwho %>%
  filter(writer == "Matthew Graham") %>%
  nrow()

# Exibe o resultado
cat("Mark Gatiss foi responsável por", roteiros_mark_gatiss, "roteiros.\n")

# Certifique-se de que a biblioteca dplyr está carregada
library(dplyr)

# Filtra o dataframe pelos episódios dirigidos por Bill Anderson e calcula a média da duração
duracao_media <- df_drwho %>%
  filter(director == "Lee Haven Jones") %>%
  summarise(
    media_minutos = mean(duration, na.rm = TRUE, NaN.rm = TRUE)
  ) %>%
  pull(media_minutos)

# Arredonda o resultado para duas casas decimais
duracao_media_arredondada <- round(duracao_media, 2)

# Exibe o resultado
cat("O diretor Bill Anderson dirigiu episódios com duração média de", duracao_media_arredondada, "minutos.\n")



# ⚠️ IMPORTANTE: Corrija o nome do diretor no texto final!
if (is.na(duracao_media)) {
  duracao_media_arredondada <- "N/D" # N/D = Não Disponível / Não Encontrado
} else {
  duracao_media_arredondada <- round(duracao_media, 2)
}

# Exibe o resultado, corrigindo o nome no texto
cat("O diretor Lee Haven Jones dirigiu episódios com duração média de", duracao_media_arredondada, "minutos.\n")
