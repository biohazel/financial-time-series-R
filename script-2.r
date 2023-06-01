---
title: "Manipulação/Transformação de dados usando dplyr"
author: "Andreza Palma"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

```


Nessa aula, iremos aprender como manipular /transformar dados usando dplyr, que é a GRAMÁTICA PARA MANIPULAÇÃO DE DADOS. Iremos usar um conjunto de dados dentro do próprio R,  nycflights13, que contém informações sobre vôos partindo de Nova York no ano de 2013. 

Essa costuma ser a tarefa mais árdua e demorada para o pesquisador. Porém é essencial para o sucesso das aplicações. Nessa aula inicial, certifique-se que domina as operações básicas aprendidas.

Nós usaremos os pacotes nycflights13 para a base de dados e o pacote dplyr. Lembre-se que o dplyr está dentro do tidyverse. Portanto, se você instalou o tidyverse, pode também carregar via library(tidyverse). Para instalar os pacotes, lembre se tirar o sinal de comentário da frente do comando (#). O  meu está comentando por que eu já instalei no meu computador!

```{r}
#install.packages('nycflights13')
library(nycflights13)
library(dplyr)
nycflights13::flights
```
Nós iremos usar a variável  nycflights13::flights, que contém todos os 336776 vôos que partiram de NY em 2013. 

No ambiente dplyr, existem 4 principais verbos: **FILTER, ARRANGE, SELECT, MUTATE**. Veremos como usar cada um deles. Novamente, certifique-se que entendeu o que faz cada um. 


# Filter()

Este comando permite filtrar um subconjunto de observações de acordo com seus valores, ou seja, faz uma seleção por linhas. 

Se quisermos filtrar todos os  vôos de 01/01/2013, vamos usar:

```{r}
ex1=filter(flights, month == 1, day == 1)
ex1
```

______________________________________________________________________________
# Arrange()

ordena as linhas de acordo com alguma regra. O argumento desc= pode ser utilizado para gerar uma ordem decrescente.

```{r}
arrange(flights, desc(dep_delay))
```

Se vc usar váris colunas em arrange(), cada coluna adicional é usada para desempate nas colunas anteriores. 

```{r}
arrange(flights, year, month, day)

```

# Select() 

seleciona um subconjunto de variáveis (por colunas)

```{r}
select(flights, year, month, day)
```


# Mutate()

adiciona novas colunas que sejam funções de colunas existentes. Nesse caso, vamos criar as variáveis ganho (subtração entre duas variáveis) e velocidade (divisão entre distância e tempo no ar vezes 60)

```{r}
mutate(flights,
  ganho = dep_delay - arr_delay,
  velocidade = distance / air_time * 60)
```

# PIPE %>%

o operador PIPE (%>%) é muito importante, como veremos a seguir. Ele usa o resultado do argumento que está a direita como argumento do que está do lado esquerdo. Vejamos os mesmos exemplos acima usando PIPE. 

Filtrar usando PIPE:
```{r}
ex2= flights %>% filter(month == 1, day == 1)
ex2

```

Ordenar usando PIPE:

```{r}
flights%>%arrange(desc(dep_delay))
```

E assim sucessivamente. **Certifique-se de ter entendido a função do PIPE.** 

# summarise() e group_by()

Além dos 4 verbos principais, temos também os verbos **summarise()** e **group_by()**. Summarise() sozinho não é muito útil, pois retorna um valor (resumo de valores). No entanto, quando usado com group_by() passa a ser bastante útil, uma vez que retornará os resumos agrupados. 

No exemplo abaixo, usamos summarise() e group_by() para obter a média de atrasos por data. 

```{r}
atraso_data <- group_by(flights, year, month, day)
summarise(atraso_data, atrasos = mean(dep_delay, na.rm = TRUE))
```

Note que **na.rm** é utilizado para evitar *missing values* antes do cálculo. Verifique o que acontece se não usarmos esse argumento. 

# Comentários finais

Para ver mais detalhes sobre qualquer um dos verbos, use ? seguido do verbo desejado. Por exemplo, mais detalhes sobre select, ?select. 



Além disso, os operadores de comparação são muito úteis (> , >= : maior e maior igual; < , <= : menor e menor igual). Destaque para os que geram confusão abaixo:

i) != : **diferente**;

ii) == : **igual**.

Os operadores lógicos também são muito úteis. Consulte o card do R para dplyr a fim de ver todas as opções. 