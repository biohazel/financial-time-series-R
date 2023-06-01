---
title: 'Aula 2: Visualizando dados com ggplot2'
author: "Andreza Palma"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Vamos usar um banco de dados que já está no R, USArrests, que consiste de variáveis sobre a taxa de criminalidade para cada 100 mil habitantes por estado americano. Vamos carregar esse banco de dados e verificar algumas informações simples. 

```{r}
#install.package{"ggplot2"}
library(ggplot2)
#carregar conjunto de dados USArrests
data(USArrests)
mydata = USArrests
#ver a dimensão do banco de dados
dim(mydata)
head(mydata) #seis primeiras linhas
tail(mydata) #seis últimas linhas
summary(mydata) # sumário estatístico do conjunto de dados
names(mydata) #nomes das variáveis
row(mydata) #nomes dos estados norte-americanos
```

Você já sabe, mas vamos relembrar, que para saber mais sobre o banco de dados, basta usar o comando help(USArrests).

```{r eval=FALSE}
help(USArrests)
```

Temos um conjunto de dados em cross-section (ou seja, observações de várias unidades - estados em único período de tempo, 1973). Nesse caso, podemos fazer um gráfico de distribuição de frequência, ou seja, um histograma. Podemos ver, por exemplo, a frequência de assassinatos por estado. Já vimos que ggplot funciona em camadas e nesse caso iremos usar geom_hist() para contar as frequências. 

```{r}
g1 = ggplot(data = mydata) +
geom_histogram(mapping = aes(x = Murder))
g1
```

Gráfico de densidade usando kernel gaussiano:

```{r}
g2 = ggplot(data = mydata) +
geom_density(mapping = aes(x = Murder), kernel = 'gaussian')
g2
```

Diagrama de caixa ou box-plot (quartis da distribuição, onde podemos analisar a dispersão da variável)

```{r}
g3 = ggplot(data = mydata) +
geom_boxplot(mapping = aes(x = 1, y = Murder))
g3
```

Temos também o violin-plot, que segue o mesmo princípio do box-plot, mas é uma combinação deste com um gráfico de densidade. 

```{r}
ggplot(data = mydata) +
geom_violin(mapping = aes(x = 1, y = Murder))
```

Podemos também facilmente colocar títulos, subtítulos, etc nos nossos gráficos. Vejamos como fazer isso através do exemplo a seguir. Vamos construir o histograma agora para a variável assaltos (Assault), adicionando os títulos:

```{r}
ggplot(data = USArrests) +
geom_histogram(mapping = aes(x = Assault), bins = 10) +
labs(x = 'Assaltos para cada 100 mil habitantes',
y = 'Frequencia',
title = 'Assaltos em Estados Americanos')
```


Podemos também alterar as cores das barras, usando o comando fill dentro de geom_histogram. Vejamos:

```{r}
ggplot(data = USArrests) +
geom_histogram(mapping = aes(x = Assault), bins = 10, fill ='blue') +
labs(x = 'Assaltos para cada 100 mil habitantes',
y = 'Frequencia',
title = 'Assaltos em Estados Americanos')
```

Para mudar as cores das bordas, usamos o comando color:

```{r}
ggplot(data = USArrests) +
geom_histogram(mapping = aes(x = Assault), bins = 10, fill ='blue', color='black') +
labs(x = 'Assaltos para cada 100 mil habitantes',
y = 'Frequencia',
title = 'Assaltos em Estados Americanos')
```

Podemos também alterar o número de barras usando o comando bins (o default é 30):

```{r}
ggplot(data = USArrests) +
geom_histogram(mapping = aes(x = Assault), bins = 4, fill ='blue', color='black') +
labs(x = 'Assaltos para cada 100 mil habitantes',
y = 'Frequencia',
title = 'Assaltos em Estados Americanos')
```

Se usarmos o comando fill = rainbow, teremos as barras preenchidas com 4 cores do arco-íris. Vejamos:

```{r}
ggplot(data = USArrests) +
geom_histogram(mapping = aes(x = Assault), bins = 4, fill =rainbow(4), color='black') +
labs(x = 'Assaltos para cada 100 mil habitantes',
y = 'Frequencia',
title = 'Assaltos em Estados Americanos')
```
______________________________________________________

Podemos personalizar também o box-plot que fizemos para asssassinatos. Novamente, colour muda a cor do contorno e fill muda a cor do preenchimento. 

```{r}
ggplot(data = USArrests) +
geom_boxplot(mapping = aes(x = 1, y = Murder), color = 'red', fill = 'pink')
```
____________________________________________________________


Para terminar, vamos fazer um gráfico de dispersão a fim de verificar como o nível de assassinatos se relaciona com o tamanho da população urbana. 
```{r}
ggplot(mydata, aes(x = UrbanPop, y = Murder)) +
geom_point(color='blue', size=4) +
labs(y = "Assassinatos",
x = "População Urbana",
title = "Relação entre assassinatos e População Urbana") 

```
 