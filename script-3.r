---
title: 'Aula: Visualizando dados com ggplot2'
author: "Andreza Palma"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
O pacote ggplot foi desenvolvido por Hadley Wickham a partir de sua tese de doutorado "The Grammar of Graphics". Construíremos gráficos a partir de cada um dos seus componentes. A gramática vem das múltiplas camadas de um gráfico. 

Para começar, vamos instalar e carregar o pacote ggplot2 (o ggplot 2 está dentro do tidyverse. Portanto, vc pode instalar e carregar o tidyverse que automaticamente carregará o ggplot2.)

```{r}
#install.packages{"ggplot2"}
library(ggplot2)
```

Além disso, vamos usar um conjunto de dados que já está carregado no R (aprenderemos a importar dados nas próximas aulas). Para carregar os dados que iremos usar:

```{r}
data("mtcars")
```

Trata-se de um banco de dados com características de diferentes modelos de automóveis.  Consiste de dados com 32 observações em 11 variáveis (numéricas), descritas abaixo:

mgp: milhas/galão (EUA)

cyl: Número de cilindros

disp: Deslocamento (cu.in.)

hp: Potência bruta

drat: Relação do eixo traseiro

wt: Peso (1000 lbs)

qsec: 1/4 milha hora

vs: Motor (0 = em forma de V, 1 = em linha reta)

am: Transmissão (0 = automático, 1 = manual)

gear: Número de marchas para frente

carb: Número de carburadores

Para visualizar as primeiras linhas deste banco de dados,  podemos usar o comando head:

```{r}
head(mtcars)
```

Para construir um gráfico usando ggplot, vamos partir do princípio que os gráficos são constituídos por camadas (layers). 

Para ver como funciona, vamos fazer o exemplo abaixo, relacionando consumo, potência e tipo de câmbio:

```{r}
# Inicia o plot
g <- ggplot(mtcars)
# Adicionar pontos (geom_point) e
# vamos mapear variáveis a elementos estéticos dos pontos
# Size = 3 define o tamanho de todos os pontos
g <- g +
geom_point(aes(x = hp, y = mpg, color = factor(am)),
size = 3)
# Altera a escala de cores
g <- g +
scale_color_manual("Automatic",
values = c("red", "blue"),
labels = c("No", "Yes"))
# Rótulos (títulos)
g <- g +
labs(title = 'Relação entre consumo, potência e tipo de câmbio',
y = 'Consumo',
x = 'Potência')
g
```


Vamos analisar o código que usamos para fazer o gráfico acima 

Primeiro, passamos um conjunto de dados para o ggplot usando ggplot(mtcars)
 
Depois, adicionamos uma camada de pontos, para as variáveis hp e mpg, com as posições de cada ponto nos eixos x e y e uma variável am para a cor de cada ponto

geom_point(aes(x = hp, y = mpg, color = factor(am)),
size = 3) +
scale_color_manual("Automatic",
values = c("red", "blue"),
labels = c("No", "Yes"))   

 Em seguida, alteramos a escala de cor, definindo seu título, os rótulos (labels) e os valores
(values) para as cores. Por fim, definimos os títulos/rótulos do gráfico.

```{r}
ggplot(mtcars) +
geom_point(aes(x = hp, y = mpg, color = factor(am)),
size = 3) +
scale_color_manual("Automatic",
values = c("red", "blue"),
labels = c("No", "Yes")) +
labs(title = 'Relação entre consumo, potência e tipo de câmbio',
y = 'Consumo',
x = 'Potência')
```

Todo gráfico tem 3 conjuntos de elementos:
I) conjunto de dados (data)
II)Sistema de coordenadas (mapping)
III) conjunto de figuras geométricas que caracteriza o gráfico (geom)

________________________________________________________
Mapeamento Estético: características visuais  dos objetos geométricos  (pontos, barras, linhas, etc). Usamos pra isso a função aes(). No nosso exemplo, usamos 3 características visuais : posição x, posição y e cor. 

Objetos geométricos começam com a expressão geom_ e serão seguidos pelo tipo de objeto. Abaixo alguns exemplos:

Dispersão: geom_point()

Barras: geom_bar()

Histograma: geom_histogram()

Boxplot: geom_boxplot()

Densidade: geom_density()

Linhas: geom_line()

NOTE QUE AS CAMADAS SÃO UNIDAS COM UM SINAL DE +


Vamos treinar criando um novo gráfico de dispersão (pontos) para o nosso conjunto de dados. Podemos acrescentar uma terceira camada ao gráfico, gerando a reta y = x. se = false RETIRA O intervalo de confiança. Vejamos. 



```{r}
g1 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point()+geom_smooth(se = FALSE, method = "lm")
g1
```


Agora vejamos como fica com o intervalo de confiança:


```{r}
g1 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point()+geom_smooth(method = "lm")
g1
```


Podemos também mudar as cores dos pontos. Basta escolher a cor em geom_point(color=red). Vejamos: 


```{r}
g3 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point(color = 'red')+geom_smooth(se = FALSE, method = "lm")
g3
```

Podemos também ter diferentes cores para diferentes categorias de cilindros (variável cyl do banco de dados). Vejamos:


```{r}
mtcars$cyl=as.factor(mtcars$cyl)
g4 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point(aes(color=cyl))
g4
```

Ou diferentes formas para diferentes categorias de cilindros (grupos):

```{r}
g5 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point(aes(shape = cyl, color=cyl))
g5
```

Também é possível modificar a forma e o tamanho do ponto. Vejamos:

```{r}
g6 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point(shape=8, color='steelblue', size=5)
g6
```

Para mudar o preenchimento da figura usamos fill:

```{r}
g7 <- ggplot(mtcars, aes(y = mpg, x = disp)) +
geom_point(shape=23, fill = "blue", color='darkred', size=3)
g7

```