---
title: 'Aula 3: Visualizando dados com ggplot2'
author: "Andreza Palma"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Nessa aula, iremos explorar o conjunto de dados mpg disponível no R. Esse conjunto de dados nos ajuda a responder a seguinte questão: carros com motores maiores utilizam mais combustível do que carros com motores menores? Essa aula é baseada no livro "R para Data Sciente".

Para começar, devemos explorar este conjunto de dados. Você pode fazer isso da mesma forma mostrada nas aulas anteriores. 

```{r}
library(ggplot2)
data(mpg)
head(mpg)
tail(mpg)
summary(mpg)

```

Utilize a ajuda do R para explorar as variáveis deste banco de dados. 

```{r, eval=FALSE}
?mpg
```

Para responder a nossa pergunta inicial, vamos começar fazendo um gráfico de dispersão entre as variáveis displ (tamanho do motor de um carro em litros) x hwy (eficiência do combustível de um carro na estrada em milhas por galão).

Lembrando que para começar um gráfico sempre usamos a função ggplot(), que vai criar um sistema de coordenadas onde poderemos adicionar camadas. E o primeiro argumento dessa função é o conjunto de dados que iremos usar no gráfico. Após isso, iremos completar o gráfico adicionando camadas de pontos, no caso do gráfico de dispersão, geom_point(). 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

O gráfico nos mostra uma possível relação negativa entre eficiência e tamanho do motor.  Porém, temos um conjunto de pontos discrepantes, que parecem estar longe de uma reta negativamente inclinada traçada para esse conjunto de pontos. Lembram-se como podemos inserir essa reta? Vejamos abaixo:

{r}
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point()+geom_smooth(method = "lm")
```

OBSERVAÇÃO IMPORTANTE: Note que o aes() está sendo usado diretamente na função ggplot() e não no objeto geométrico. Que o mapeamento estético definido na função ggplot() é global. Ou seja, é aplicado para todos os objetos geométricos daquele gráfico, a menos que seja explicitado novamente em alguma camada.


Uma possível explicação para isso pode ser a existência de modelos híbridos no banco de dados. A variável class desse conjunto de dados classifica os carros em : compacto, médio e SUV. Como na época desse conjunto de dados, apenas carros pequenos eram híbridos, podemos usar essa variável para verificar a hipótese. Vamos então usar a variável class diferenciando os pontos por cores de acordo com essa variável. Note que fazemos isso usando dentro da função aes() o argumento color = class. 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

Podemos também usar o comando alpha = class para diferenciar as classes usando a transparência dos pontos (o que não é uma boa idéia quando temos muitas classes):

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
```


Ou ainda pelo formato dos pontos, usando shape= class:

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
```

De acordo com os gráficos, os pontos "aberrantes" não parecem ser híbridos, mas sim esportivos. 
_____________________________________________________________________

O recurso FACETS:

gráficos construídos sobre um mesmo data frame mas separados por variáveis categóricas

Podemos dividir os nossos gráficos em "facetas" ou subplots. Para fazer isso, podemos usar facet_wrap(), que criará subplots a partir de uma única variável, que deve ser discreta. Vamos fazer vários gráficos de dispersão para cada conjunto de classe de carros. Portanto, usaremos facet_wrap(~class). Podemos também definir quantas linhas serão usadas, ou quantas colunas. Vamos acrescentar nrow=2, para que os subplots sejam divididos em duas linhas. 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```

Se quisermos duas colunas, substituímos por ncol=2:

```{r}
ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
     facet_wrap(~ class, ncol=2)
```

Para criar facetas (subplots) a partir de duas variáveis, usamos facet_grid(). Nesse caso, é preciso indicar duas variáveis para fazer o grid. 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
```

______________________________________________
TEMAS

Através da função theme() podemos modificar a aparência de um gráfico. Vamos usar o theme_dark(). 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl) + theme_dark()

```

E agora theme_linedraw(). Vc pode explorar os diferentes temas disponíveis. 

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +  theme_linedraw()

```
_____________________________________________________________


MÚLTIPLOS GRÁFICOS POR PÁGINAS

Diferente do comando facets(), agora nosso objetivo é colocar vários gráficos indepenentes separados em subplots e não dividí-los de acordo com uma variável categórica. Fora do ggplot, faríamos isso usando layout() e mfrow(). No ggplot, faremos usando da função grid.arrange(). Precisaremos instalar e carregar o pacote gridExtra.

```{r}
#install.packages("gridExtra")
library(gridExtra)
```

Agora faremos 3 gráficos 
```{r}
p1 <- ggplot(data=mpg, aes(x=displ)) + geom_bar(fill='blue')
p2 <- ggplot(data=mpg, aes(x=displ)) + geom_boxplot() 
p3 <- ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point(color="red")
grid.arrange(p1, p2, p3, ncol=2)

```


