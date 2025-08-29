#1 Em uma apresentação feita em Markdown, você deseja incluir a imagem grafico.png com 
#a legenda “Gráfico de Resultados”. Qual é a sintaxe correta?
#![Gráfico de Resultados](grafico.png)

#2 Qual comando mostra as últimas 20 linhas do arquivo acesso.log?
#tail -20 acesso.log

#3 Qual comando exibe em tempo real as últimas linhas de um arquivo em crescimento, 
#como servidor.log?
#tail -f servidor.log

#4 Qual sintaxe aplica negrito em um texto no Markdown?
#**texto**


#5 No diretório atual, você deseja contar quantos arquivos .csv existem. Qual comando 
#é adequado?
#ls *.csv | wc -l

#6 Qual é a forma correta de criar uma lista numerada em Markdown?
#1. Item 1 2. Item 2 3. Item 3

#7Você criou uma nova branch chamada feature-login para desenvolver uma funcionalidade. 
#Como você muda para essa branch?
#git checkout feature-login

#8 Um colega enviou o arquivo dados.csv compactado como dados.csv.gz. Para descompactá-lo 
#mantendo o original, qual comando deve ser usado?
#gunzip -k dados.csv.gz

#9 Durante o trabalho em grupo, outro aluno fez alterações na branch main. Antes de enviar 
#seu código, você quer garantir que não haja conflitos. Qual comando deve ser usado para 
#atualizar sua branch local com as alterações remotas?
#git fetch seguido de git merge origin/main

#10 Depois de fazer o commit, você quer enviar suas alterações para o repositório remoto. 
#Qual comando usar?
#git push origin feature-login

#11 Você quer criar um commit mas deseja que ele seja em um commit amend para alterar o 
#último commit. Qual comando usar?
#git commit --amend

#12 Como navegar do diretório /home/usuario/ até /home/usuario/projetos/analise/?
#cd projetos/analise/cd projetos/analise/

#13 Para monitorar em tempo real as tentativas de login registradas em /var/log/auth.log, 
#qual comando é adequado?
#tail -f /var/log/auth.log

#14 Você precisa saber rapidamente o tipo de arquivo dados.bin (se é texto, binário, imagem 
#etc.). Qual comando usar?
#file 

#15 Você tem um arquivo nomes.txt com uma lista de nomes, mas alguns aparecem repetidos. Para 
#exibir apenas os nomes únicos em ordem alfabética, qual comando usar?
#sort nomes.txt | uniq

#16 Você deseja renomear a branch atual de feature-login para login-system. Qual comando usar?
#git branch -m login-system

#17 Em uma atividade de programação, você quer mostrar o comando ls -l dentro de uma frase. 
#Como fazer isso em Markdown?
#`ls -l`

#18 Como inserir um link em Markdown com o texto “Google” apontando para https://www.google.com?
#[Google](https://www.google.com)

#19 Qual comando lista arquivos ocultos em um diretório?
#ls -a

#20 Você quer criar um repositório Git local e vinculá-lo a um remoto no GitHub. Qual sequência 
#está correta?
#git init, git add ., git commit -m "first", git remote add origin <url>, git push -u origin main

#21 Você quer que o título “Resultados” seja um subtítulo de nível 2. Qual comando usar?
### Resultados

#22 Você clonou um repositório remoto no GitHub para sua máquina local usando git clone. Qual 
#comando você usaria para ver todas as branches disponíveis localmente e remotamente?
#git branch -a

#23 Você precisa atualizar sua branch local com as alterações mais recentes do repositório remoto. 
#Qual comando é usado?
#git pull

#24 Qual comando altera o dono de um arquivo relatorio.txt para o usuário ana?
#chown ana relatorio.txt

#25 Você está preparando um README e precisa mostrar um trecho de código em Python. Qual é a 
#sintaxe correta para criar um bloco de código?
#```python print(“Olá”) ```

#26 Você está criando documentação e precisa incluir uma imagem externa hospedada em 
#https://site.com/img.png. Qual sintaxe usar?
#![Figura](https://site.com/img.png)

#27 Você está escrevendo um README para um projeto no GitHub e precisa criar um título principal 
#“Análise de Dados”. Qual sintaxe deve ser usada?
## Análise de Dados

#28 Você quer buscar todas as alterações do repositório remoto sem fazer merge automático. 
#Qual comando usar?
#git fetch

#29 Você quer ver o histórico de commits com detalhes sobre autor, data e mensagens. 
#Qual comando usar?
#git log

#30 Qual a sintaxe correta para criar um título de nível 1 em Markdown?
## Título














