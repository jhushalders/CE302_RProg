### Módulo · Estrutura da linguagem R ------------------------------------------
### Prof. Wagner Hugo Bonat ----------------------------------------------------

## Comentários e instruções

# Faz uma soma
2 + 2

# Meu IMC
83/1.85^2

# Quantos segundos tem um dia?
24 * 60 * 60

# Instrução em uma linha
2 + 2 + 7 + 5

# Instrução em várias linhas

2 + 
  2 + 
  7 + 
  5

# Várias instruções em um linha
2 + 2; 7 + 5

# Ordem de execução (segue a matemática usual)
2 + 2*4
2 + (2*4)
2^2 * 5^3
(2^2) * (5^3)

# Área e espaço de trabalho
peso <- 83
altura <- 1.80
imc <- peso/altura^2
imc

# Lista objetos na área de trabalho
ls()

# Apaga objetos
rm(peso, altura)
ls()
imc

# Espaços de trabalho
women

# Mostra os demais espaços
search()

# Conteúde de um espaço
ls("package:datasets")

# O que acontece se fizermos?
women <- c("Gertrude Mary Cox", "Florence Nightingale David")

women
datasets::women

# Onde o R trabalha?

# Diretório atual de trabalho
getwd()

# Troca por outro endereço
setwd("~/Downloads")

# Lista o conteúdo do diretório de trabalho
dir()

# Instalação de pacotes
install.packages("tidyverse")

# Carrega o pacote
library(tidyverse)

# Conteúdo do pacote
ls("package:tidyverse")

# Documentação do pacote
help(package = "tidyverse")

# Remover um pacote
detach("package:tidyverse", unload = TRUE)

# Documentação interna
?women
help(women)

# Procura por ocorrências
help.search("women")

# Objetos que batem com um termo de busca
apropos("tukey")

# Vinhetas
browseVignettes(package = "survival")

# Procura no site do R
RSiteSearch("spider plot")

# Operações básicas
2 + 3    # Soma.
2 - 3    # Subtração.
2 * 3    # Multiplicação.
2/3      # Divisão.
2^3      # Potenciação.
2^(1/3)  # Radiciação.
10 %% 3  # Resto.
10 %/% 3 # Parte inteira.

# Logaritmos
exp(2)            # Exponencial neperiano.
log(10)           # Neperiano.
log10(10)         # Base 10.
log2(10)          # Base 2.
log(10, base = 5) # Base qualquer.

# Trigonométricas
sin(3) # Seno.
cos(3) # Cosseno.
tan(3) # Tangente.
asin(0.5) # Arco seno.
acos(0.5) # Arco cosseno.
atan(0.5) # Arco tangente.

# Arredondamento
round(pi, digits = 5)
floor(pi)   # Inteiro logo baixo.
ceiling(pi) # Inteiro logo acima.
trunc(pi)  

# Operações lógicas
x <- 3
y <- 4
2 == 2  # Igualdade.
2 != 2  # Desigualdade.
x <= y  # Outros operadores: "<", ">", and ">=".

(2 < 5) & (7 >= 3) # Operador AND.
(2 < 5) | (7 >= 3) # Operador OR.
!(2 < 5)

# Tipos especiais
5 + NA         # O resultado é NA.
is.na(5 + NA)  # Verifica se é NA.
10 + NULL      # Retorna objeto vazio.
is.null(NULL)  # Verifica se é nulo.
5/0            # Infinito.
is.finite(5/0) # Verifica se é finito.
0/0            # Valor indeterminado.
is.nan(0/0)    # Verifica se é not a number.

# Estruturas de dados
inteiro <- 10L
real <- 10
is.numeric(inteiro)

vetor_atomico <- c(1,2,3,4)
matriz <- matrix(c(1,0,0,1),2, 2) # 2 linhas e 2 colunas, primeiro preenche coluna
lista <- list("a" = 5, "b" = 5L, 
              "c" = "Letra") #combina diferentes tipos
tab <- data.frame("Nome" = c("Bent", "Jon"), 
                  "Idade" = c(3, 4))

# Vetores atômicos - sempre mesmo tipo
vetor_numerico <- c(1, 5, 11, 33)
vetor_caracter <- c("hello", "world")
vetor_logico <- c(TRUE, TRUE, FALSE)
vetor_combinado <- c(vetor_numerico, 
                     vetor_caracter, 
                     vetor_logico, 
                     "boo")
vetor_combinado
class(vetor_combinado)

?Reserved

# Verificando tipo de um objeto
is.integer(1)
is.numeric(1)
is.integer(1L)
is.numeric(1L)
is.character("Curitiba")
y <- factor(c("Solteiro", "Casado"))
is.factor(y)
is.character(y)
is.logical(c(TRUE, FALSE))

# Usando o typeof()
x <- "caracter"
typeof(x)

x <- 10
typeof(x)

x <- 10L
typeof(x)

x <- TRUE
typeof(x)

# Conversão de objetos
x <- 10
is.numeric(x)
x <- as.logical(x)
is.numeric(x)
x

# Classe e métodos
x <- c(1, 2, 3)
class(x)
methods(class = "numeric")
methods(class = "factor")

# Objetos com atributos
notas <- c("João" = 7.8,
           "Bianca" = 10,
           "Eduarda" = 8.5)
class(notas)
attributes(notas)

# Tamanho do vetor
length(notas)

# Sequencias estruturadas

# Sequencia de 1 a 7
1:7

# Sequencia de 1 a 10 de 2 em 2
seq(from = 1, to = 10, by = 2)

# Sequencia de 1 a 20 de tamanho 7
seq(from = 1, to = 20, length.out = 7)

# Sequencia começando em 1 de tamanho sete de 2 em 2.
seq(from = 1, by = 2, length.out = 7)

# Repetições estruturadas

# Repita o 0 5 vezes
rep(0, 5)

# Repita a sequencia 1 a 3, 2 vezes
rep(1:3, times = 2)

# Repita a sequencia 1 a 3, cada número 2 vezes
rep(1:3, each = 2)

# Valores aleatórios

# Retire uma amostra aleatório de tamanho 10 de uma sequencia de 1 a 20 sem reposição.
sample(1:20, size = 10, replace = FALSE)

# Retire uma amostra de tamanho 10 da sequencia "a", "b", "c" de tamanho 10 com reposição.
sample(c("a", "b", "c"), size = 10, replace = TRUE)

#usando distribuição de probabilidade
# 10 amostras da distribuição uniforme entre 0 e 1
runif(n = 5, min = 0, max = 1)

# 10 amostras da distribuição Normal com média 1.80 e desvio-padrão 0.1
rnorm(n = 5, mean = 1.80, sd = 0.1)

# Selecionando elementos de um vetor
## Criando vetor numérico nomeado.
notas <- c("João" = 7.8, 
           "Bianca" = 10,
           "Eduarda" = 8.5,
           "Felipe" = 7.0,
           "Márcia" = 6.5)
notas[1]       # A posição 1.
notas[5]       # A posição 5.
notas[1:2]     # Um intervalo.
notas[c(1, 3)] # Um conjunto, só o 1 e o 3
notas[-1]      # Remove.

# Máscara lógica
# Alunos com nota maior que 7.0
mask <- notas > 7.0 
notas[mask]
notas[notas > 9.0]

# Modificando vetores
notas["João"] <- 0
notas

# Atribui nota "desconhecida" para aluno.
notas["Felipe"] <- NA
notas

# Remove elemento do vetor.
notas <- notas[-4]

# Adiciona
append(notas, value = c("Carlos" = 9.0))

# Adiciona posição especifica
append(notas, value = c("Simone" = 7.2),
       after = 0)

# Concatena
novas_notas <- c(notas,
                 c("Pedro" = 8.0,
                   "Luana" = 8.3))

# Matrizes - mesmo tipo, primeiro preenche a coluna
matriz <- matrix(data = c(1, 0, 0, 1), 
                 nrow = 2, ncol = 2)
matriz

# Dimensão
dim(matriz)

# Preenchimento por colunas
matriz <- matrix(c(1,2,3,4,5,6,7,8), 
                 nrow = 4, ncol = 2)
matriz

# Preenchimento por linhas
matriz <- matrix(c(1,2,3,4,5,6,7,8), 
                 nrow = 4, ncol = 2, 
                 byrow = TRUE)
matriz

# Acessando por posição (linha, coluna)

# Linha 1 Coluna 2
matriz[1,2]
# Linha 3 Coluna 1
matriz[3,1]
# Linhas 1 e 2 Coluna 2
matriz[1:2, 2]
# Linhas 2 e 3 e Colunas 1 e 2
matriz[2:3, 1:2]
## Elementos maiores do que 4
matriz[matriz > 4]
## Máscara lógica
matriz > 4

# Listas - diferentes tipos
minha_lista <- list(10, "Dez", TRUE, 1+10i)
minha_lista

# Primeiro elemento
minha_lista[[1]]

# Quarto elemento
minha_lista[[4]]

# Primeiro e quarto elemento
minha_lista[c(1,4)]

# Listas nomeadas
minha_lista <- list("Números" = c(10, 100), 
                    "Caracter" = c("Dez", "Cem"),
                    "Logico" = TRUE, 
                    "Complexo" = 1+10i)
minha_lista

# Acesso pelo nome
minha_lista$Logico

# Ver os atributos(tipos) em cada elemento
attributes(minha_lista)

# Tabelas
#linha = observação, coluna = variável
str(iris) #estrutura, resumao
iris

# fatores - definir ordem
fator <- factor(c("alta","baixa","baixa","media",
                  "alta","media","baixa","media","media"),
                levels = c("baixa", "media", "alta"),
                ordered = TRUE)
table(fator)

# Criando e inspecionando data.frame
#cada coluna é um vetor, elementos dentro da coluna são do mesmo tipo, 
#mas os tipos podem ser diferentes em diferentes colunas
dados <- data.frame(Letras = letters[1:6], 
                    Numeros = 1:6, 
                    Logico = rep(c(TRUE, FALSE), 
                                 each = 3))
dados
str(dados) #estrutura
head(dados)
tail(dados)
dim(dados) #numero de colunas e linhas
nrow(dados) #número de linhas
ncol(dados) #número de colunas
names(dados) #nomes das colunas e linhas
colnames(dados) #nomes das colunas
rownames(dados) #nomes das linhas

dados$Letras
dados$Numeros > 3 #devolve lógico
dados[dados$Numeros > 3, ] #devolve os números

# Acessando elementos de um data.frame

# Primeira linha todas as colunas
iris[1,]

# Segunda linha colunas de 1 a 3
iris[2,1:3]

# Linhas 1 e 5 todas as colunas
iris[c(1, 5),]

# Acesso pelo nome da coluna
names(iris)
iris$Sepal.Length