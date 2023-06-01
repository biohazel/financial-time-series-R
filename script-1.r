---
title: "Aula_1"
author: "Andreza Palma & Renan Alves"
output:
  html_document: default
  pdf_document: default
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r install, include=FALSE}
#install.packages('knitr')
#install.packages("rmarkdown")
#install.packages("dplyr")
#install.packages("tidyverse")
#install.packages("caTools1.14")

library(knitr)
library(rmarkdown)
library(dplyr)
library(tidyverse)
#library(caTools1.14)


```

Os exemplos a seguir estão baseados principalmente no livro "The Book of R: A First Course in Programming and Statistics", de Tilman M. Davies.

# R como calculadora

Vamos comecar com alguns comandos basicos de algebra no R. Soma, subtracão, multiplicação, divisao, logaritmo.


```{r}
2+3
14/6
14/6+5
14/(6+5)
3^2
2^3

```

# Resumo de operadores matemáticos no R:

- Soma: +
- Subtração: -
- Multiplicação: *
- Divisão: /
- Exponenciação: ^
- logaritmo: log()
- Resto da divisão: %%


# Resumo de operadores de comparação:

- Igualdade: ==
- Diferença !=
- Maior: >
- Maior ou igual: >=
- Menor: <
- Menor ou igual: <=
- Subconjunto: %in% 
- Negação: !

# Resumo de operadores lógicos:

- Verdadeiro: TRUE, ou simplesmente T
- Falso: FALSE, ou simplesmente F

# Resumo de definições especiais: 
- Pi: pi
- Infinito: Inf
- Infinito Negativo: -Inf
- Valor Indefinido (Not a Number): NaN
- Valor omisso (Missing Data): NA

# Vamos praticar:


```{r}
# Vamos calcular as raizes quadradas agora usando a funcao sqrt() do R
sqrt(x=9)
sqrt(36)
sqrt(x = 5.311)
```

Vamos agora calcular algumas expressoes algebricas no R.
$$10^2 + \frac{3*60}{8} - 3 $$
```{r}
10^2+3*60/8-3
```

$$\frac{5^3*(6-2)}{61 - 3 +4} $$
```{r}
5^3*(6-2)/(61-3+4)
```

$$2^{2+1} - 4 + 64^{-2^{2.25}-1/4} $$
```{r}
2^(2+1) - 4 + 64^((-2)^(2.25-1/4))
```

$$\left( \frac{0.44*(1-0.44)}{34}  \right)^{1/2} $$
```{r}
(0.44*(1-0.44)/34)^(1/2)
```

```{r}
log(x=243, base=3)
```


```{r}
exp(x=3)
exp(1)
log(20.08554)
```

O R apresenta até 7 casas depois da vírgula. Na programacao em geral, e comum escrever o e-notation, e expressar um numero x como sendo $xey$ que e representado como $x*10^{y}$. Simplificando, para uma potencia positiva + y, a notacao eletronica pode ser interpretada como "mova as casas decimais y para a direita". Para uma potencia negativa -y, a interpretacao
e "mova as posicoes do ponto decimal y para a esquerda".

```{r}
2342151012900
0.0000002533

```

# Armazenando o valor em uma variável
Duas formas de fazer isso no R. Usando a notacao de seta (<-) ou o sinal de igual (=). Eu prefiro o segundo.
```{r}
x <- 5 # criando uma variavel x cujo valor e igual a 5

# Se eu digitar x no workspace, o R retornará o valor da variável:
x

y = 5 # criando uma variavel y cujo valor e igual a 5

z = x + y # criando uma variavel z que e a soma de x mais y ou seja 5 + 5 = 10

w <- x + y # criando uma variavel z que e a soma de x mais y ou seja 5 + 5 = 10

mynumber = 45.2

v = mynumber*x

x = x + 1 # Estou criando uma nova variavel que se chama x, cuJo valor é o x (anterior = 5) somada com 1, logo x = x + 1 = 5 +1 = 6.

ls()   # vai mostrar todas as variaveis criadas no R, pelo usuário, salvas no workspace

teste = (3^2)*(4^(1/8))

```

# Removendo objetos


Para remover objetos utilizamos  rm(). O nome dessa função vem exatamente de "remove". Para remover o objeto x:



```{r}
x <- 1
rm(x)
```

Podemos também remover mais de um objeto por vez:

```{r}
x <- 1
y <- 2
rm(x,y)
```

# Vetores
A funcao que cria um vetor é a funcao c (de concatenar):

```{r}
myvec = c(1,3,1,42)
myvec
```

Podemos juntar uma variável a um vetor:
```{r}
foo = 32.1
myvec2 = c(3,-3,2,3.45,1e+03,64^0.5,2+(3-1.1)/9.44,foo)
myvec2
```

Ou juntar dois vetores:
```{r}
myvec3 = c(myvec,myvec2)
# guarda no vetor myvec34 os vetores myvec e myvec2
myvec3
```

# Sequencias, repeticoes, ordenacoes e tamanhos:

Alguns comandos de vetores, para criar, ordenar, calcular tamanho

Criando vetor (ou sequência) usando o comando ":"
```{r}
3:27 #fará uma sequência de 3 até 27, de 1 em 1. 

#3:1:27

```


Criando vetor (ou sequência) usando o comando do R "seq"
```{r}
seq(from=3,to=27,by=3)
```

```{r}
seq(from=3,to=27,length.out = 40)
```

```{r}
foo = 5.3
myseq = seq(from=foo,to=(-47+1.5),by=-2.4)
myseq
```

```{r}
myseq2 = seq(from=foo,to=(-47+1.5),length.out = 5)
myseq2
```

Criar uma sequência (ou vetor) usando o comando rep
```{r}
rep(x=1, times=4)

```

```{r}
rep(x=c(3,62,8.3), times=3)
#time repete o vetor
```
```{r}
rep(x=c(3,62,8.3), each=2)
#each repete os elementos do vetor
```

```{r}
rep(x=c(3,62,8.3), times=3, each=2)
```


```{r}
foo = 4
c(3,8.3,rep(x=32,times=foo),seq(from=-2,to=1,length.out = foo+1))
```

Ordenar um vetor. Do maior para o menor elemento ou do menor para o maior elemento. Usaremos o comando sort

```{r}
sort(x=c(2.5,-1,-10,3.44),decreasing = FALSE)
```


```{r}
sort(x=c(2.5,-1,-10,3.44),decreasing = TRUE)
```

```{r}
foo = seq(from=4,to=5.5,length.out = 8)
foo
```

```{r}
bar = sort(x=foo,decreasing = FALSE)
bar
```

Encontrar o tamanho do vetor. Determinar quantos elementos estao dentro do vetor
```{r}
x = c(3,2,8,1)
length(x)
```

```{r}
length(x = 5:13)
```

```{r}
foo = 4
bar=c(3,8.3,rep(x=32,times=foo),seq(from=-2,to=1,length.out = foo+1))
length(x=bar)
```


# Extraindo subelementos de um vetor. 
```{r}
myvec = c(5,-2.3,4,4,4,6,8,10,40221,-8)
length(x=myvec)
```
Quem e o primeiro elemento de myvec?
```{r}
myvec[1]
```

Quem e o segundo elemento de myvec?
```{r}
foo = myvec[2]
foo
```

```{r}
myvec[length(x=myvec)]
```

```{r}
myvec.len = length(x=myvec)
bar = myvec[myvec.len-1]
bar
```

```{r}
1:myvec.len
```

Excluir um elemento do vetor, usando a versao negativa do indice.
```{r}
myvec[-1]  #ira excluir o primeiro elemento do vetor
```

```{r}
baz = myvec[-2]
baz
```

```{r}
qux = myvec[-(myvec.len-1)]
qux
```

Vamos juntar os pedacos de myvec com qux e bar
```{r}
c(qux[-length(x=qux)],bar,qux[length(x=qux)])
```

```{r}
myvec[c(1,3,5)]
# retorna o primeiro, terceiro e quinta elementos do vetor myvec
```

```{r}
1:4
foo = myvec[1:4]
foo
```


```{r}
indexes = c(4,rep(x=2,times=3),1,1,2,3:1)
indexes
```


```{r}
foo[indexes]
```

Reescrever certos elementos do vetor.
```{r}
bar = c(3,2,4,4,1,2,4,1,0,0,5)
bar
```

```{r}
bar[1] = 6   #Definindo o primeiro elemnto do vetor como sendo o numero 6

bar
```

```{r}
bar[c(2,4,6)] = c(-2,-0.5,-1)
bar
#substitui o segundo, quarto e sexto elemnto
```

```{r}
bar[7:10] = 100
bar
```

# Operacoes com vetores

```{r}
foo = 5.5:0.5
foo
```
```{r}
foo - c(2,4,6,8,10,12)

```

```{r}
baz = c(1,-1,0.5,-0.5)
foo*baz
```

```{r}
qux =3
foo + qux
```

Mesma coisa de fazer:
```{r}
foo + rep(x=3,times=length(x=foo))
```

A soma de todos os elementos do vetor
```{r}
sum(foo)
```

Produto de todos os elementos do vetor
```{r}
prod(foo)
```

#  Matrizes e Arrays.

```{r}
A = matrix(data=c(-3,2,893,0.17),nrow=2,ncol=2)
A
```

```{r}
A = matrix(data=c(-3,2,893,0.17),2,2)
A
```

Observe que o R montou a matriz coluna por coluna quando leu os dados, da esquerda para direita. Podemos fazer o R preencher linha por linha, utilizando o comando byrow

```{r}
matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=FALSE)
```

```{r}
matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=TRUE)
```

Se voce tiver varios vetores de comprimento igual, podera criar rapidamente uma matriz ligando esses vetores usando as funcoes internas do R rbind e cbind. Tratando cada vetor como uma linha (rbind) ou tratando cada vetor como coluna (cbind)

```{r}
rbind(1:3,4:6)
```

```{r}
cbind(1:3,4:6)
```

Calcular a dimensao da matriz. Numero de linhas e colunas de uma matriz.

```{r}
mymat = rbind(c(1,3,4),5:3,c(100,20,90),11:13)
mymat
```

```{r}
dim(mymat) #retorna numero de linhas e colunas da matriz

nrow(mymat) #retorna o numero de linhas da matriz

ncol(mymat) #retorna o numero de colunas

dim(mymat)[2]  #retorna o numero de colunas
```

Extraindo um subelemento de uma matriz.

```{r}
A = matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)
A
```

```{r}
A[3,2] #elemento da terceira linha e segunda coluna
```

```{r}
A[,2]  #extrai a segunda coluna inteira
```


```{r}
A[1,]  #extrai a primeira linha inteira
```

```{r}
A[2:3,] #extraindo a segunda e terceira linhas 
```

```{r}
A[,c(3,1)] #extraindo a terceira e priemira colunas
```

```{r}
A[c(3,1),2:3] #extraindo a terceira e primeira linha das colunas 2 e 3
```

```{r}
diag(x=A)   #pega a diagonal da matriz
```

Deletar ou omitir elementos de uma matriz.

```{r}
A[,-2] #exclui a segunda coluna
```

```{r}
A[-1,3:2] 
```

```{r}
A[-1,-2] 
```

```{r}
A[-1,-c(2,3)]
```

```{r}
B = A
B
```

```{r}
B[2,] = 1:3
B
```

```{r}
B[c(1,3),2] = 900
B
```

```{r}
B[,3] = B[3,]
B
```

```{r}
B[c(1,3),c(1,3)] = c(-7,7)
B
```

```{r}
B[c(1,3),2:1] = c(65,-65,88,-88)
B
```

```{r}
diag(x=B) = rep(x=0,times=3)
B
```

# Algebra Matricial

Transposicao de Matriz

```{r}
A = rbind(c(2,5,2),c(6,1,4))
A
```

```{r}
t(A)
```

```{r}
t(t(A))
```

Matriz identidade. Matriz de um na diagonal principal e zero nos demais elementos.

```{r}
A = diag(x=3)
A
```

Multiplicacao de um escalar

```{r}
A = rbind(c(2,5,2),c(6,1,4))
a =2
a*A
```

Adicao e Subtracao de matrizes.
```{r}
A = cbind(c(2,5,2),c(6,1,4))
B = cbind(c(-2,3,6),c(8.1,8.2,-9.8))
A
B
```

```{r}
A-B
```

Multiplicacao de matriz
```{r}
A = rbind(c(2,5,2),c(6,1,4))
dim(A)
```

```{r}
B = cbind(c(3,-1,1),c(-3,1,5))
dim(B)
```

```{r}
A%*%B
```

```{r}
B%*%A
```

Inversa de matriz
```{r}
A = matrix(data=c(3,4,1,2),2,2)
A
```

```{r}
solve(A)
```

```{r}
A%*%solve(A)
```

Multidimensional array

```{r}
AR = array(data=1:24,dim=c(3,4,2))
AR
```

```{r}
BR = array(data=rep(1:24,times=3),dim=c(3,4,2,3))
BR
```

```{r}
AR[2,,2]
```

```{r}
AR[2,c(3,1),2]
```

```{r}
AR[1,,]
```


# Valores nao numericos

Valores Logicos no R podem ser TRUE ou FALSE. Abreviacoes T ou F.

```{r}
foo = TRUE
foo
```

```{r}
bar = F
bar
```

```{r}
baz = c(T,F,F,F,T,F,T,T,T,F,T,F)
baz
```

```{r}
qux = matrix(data=baz,3,4,byrow=foo)
qux
```

```{r}
1 == 2
```

```{r}
1>2
```

```{r}
(2-1)<=2
```

```{r}
1!=(2+3)  #!= significa nao e igual
```

```{r}
foo = c(3,2,1,4,1,2,1,-1,0,3)
bar = c(4,1,2,1,1,0,0,3,0,4)
length(x=foo)==length(x=bar)
```

```{r}
foo==bar
```

```{r}
foo<bar
```

```{r}
foo<=bar
```

```{r}
foo<=(bar+10)
```

```{r}
baz = foo[c(10,3)]
baz
```

```{r}
foo>baz
```

```{r}
foo<3
```

```{r}
foo.mat = matrix(foo,5,2)
foo.mat
```

```{r}
bar.mat = matrix(bar,5,2)
bar.mat
```

```{r}
foo.mat <= bar.mat
```

```{r}
foo.mat<3
```

```{r}
qux = foo ==bar
qux
```

```{r}
any(qux) #retorna TRUE e pelo menos um vlaor logico e TRUE
```

```{r}
all(qux) #retorna TRUE se todos os valores logicos sao TRUE
```

# Trabalhar com os condicionantes AND(&) e OR (|)

```{r}
(6<4)||(3!=1)
```

TRUE e tratado como tendo valor igual a 1. E FALSE como tendo valor igual a 0

```{r}
myvec = c(5,-2.3,4,4,4,6,8,10,40221,-8)
myvec
```

```{r}
myvec[(myvec>0)&(myvec<1000)] 
```

```{r}
myvec[(myvec>0)&(myvec<1000)] 
```

```{r}
myvec[myvec<0]  = -200
myvec
```

A funcao which toma um vetor logical como um argumento x e retorna o indice correspondente a posicao de qualquer ou todos os elementos TRUE

```{r}
which(x=c(T,F,F,T,T))
```

```{r}
which(x=myvec<0)
```

```{r}
myvec[-which(x=myvec<0)]
```

```{r}
A = matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)

A
```

```{r}
A[c(T,F,F),c(F,T,T)]
```

```{r}
A<1
```

```{r}
A[A<1] = -1
A
```

```{r}
A>25
```

Which serve para identificar indices numericos ou logicos. Por exemplo, os elementos da matriz A que sao maiores do que 25.

```{r}
which(x=A>25)
```

```{r}
which(x=c(A[,1],A[,2],A[,3])>25)
```


# Caracteres no R. Tipo string (texto).
Vamos criar um string

```{r}
foo = "This is a character string "
foo
length(foo)
```

R trata tipo string como um vetor unitario. Contar o numero de caracteres individuais.

```{r}
nchar(foo)
```

```{r}
bar = "23.3"
bar
```

```{r}
"alpha"=="alpha"

"alpha"!="beta"

c("alpha","beta","gamma")=="beta"
```

Como fazer para concatenar um texto. O R tem duas opcoes, usando o comando cat ou o paste

```{r}
qux = c("Programacao","R","e")

length(qux)

qux
```

```{r}
cat(qux[1],"em",qux[3],qux[1],"legal!")
```


```{r}
paste(qux[1],"em",qux[3],qux[1],"legal!")
```

```{r}
a = 3
b = 4.4
```

```{r}
cat("o valor guardado em 'a' e ",a,".",sep="")
```

```{r}
paste("O valor guardado em 'b' e ",b,".",sep="")
```

```{r}
cat("aqui e um string\nsplit\tto neww\b\n\n\tlines")
```

```{r}
cat("I really want a blackslash: \\\nand a double quote: \"")
```


# Lists e Dataframes

Como guardar mais um tipo de dado. Vetores e matrizes guardam apenas um tipo. Vamos trabalhar agora com objetos do tipo Lists e Data Frames.

Primeiro, trabalharemos com tipo Lists. Criar uma lista e como criar um vetor. Voce fornece os elementos que deseja incluir na funcao de lista, separados por virgulas.

```{r}
foo = list(matrix(data=1:4,2,2),c(T,F,T,T),"hello")
foo
```


```{r}
length(foo)
```

```{r}
foo[[1]]
```

```{r}
foo[[3]]
```

```{r}
foo[[1]] + 5.5
```

```{r}
foo[[1]][1,2]
```

```{r}
cat(foo[[3]],"you!")
```

```{r}
foo[[3]] = paste(foo[[3]],"you!")
foo
```

```{r}
foo[[c(2,3)]]
```

```{r}
bar = foo[c(2,3)]
bar
```

E possivel dar nome ao elementos da list
```{r}
names(foo) = c("minhamtriz","minhalogica","meustring")
foo
```

Agora podemos chamar pelos nomes usando o comando com o $

```{r}
foo$minhamtriz
```

```{r}
foo$minhalogica
```

```{r}
all(foo$minhamtriz[,2]==foo[[1]][,2])
```

```{r}
baz = list(tom=c(foo[[2]],T,T,T,F),dick="g'day mate",harry=foo$meustring)
baz
```

```{r}
names(baz)
```

Vamos juntar uma list com outra list.

```{r}
baz$bobby = foo
baz
```

```{r}
baz$bobby$minhalogica[1:3]
```


Agora, olharemos Data Frame. Forma mais comum de apresentar dados no R. Muito utilizado. Usa o comando data.frame, com dados agrupados, com mesmo tamanho.

```{r}
mydata = data.frame(Nome=c("Luis","Helena","Paulo","Catarina","Sara"),
                    idade=c(42,40,17,14,1),sex=factor(c("M","F","F","M","M")))
mydata
```

```{r}
mydata[2,2]
```

```{r}
mydata[3:5,3]
```

```{r}
mydata[,c(3,1)]
```

```{r}
mydata$age
```

```{r}
mydata$age[2]
```


```{r}
nrow(mydata)

ncol(mydata)

dim(mydata)
```

```{r}
mydata$person
```

```{r}
mydata = data.frame(person=c("Peter","Lois","Meg","Chris","Stewie"),
                    age=c(42,40,17,14,1),sex=factor(c("M","F","F","M","M")),
                    stringsAsFactors = FALSE)
mydata
```

```{r}
mydata$Nome
```

Adicionando dados ao data.frame
```{r}
newrecord = data.frame(person="Brian",age=7,sex=factor("M",levels=levels(mydata$sex)))
newrecord
```

```{r}
mydata = rbind(mydata,newrecord)
mydata
```

```{r}
funny = c("High","High","Low","Med","High","Med")
funny = factor(x=funny,levels=c("Low","Med","High"))
funny
```

```{r}
mydata = cbind(mydata,funny)
mydata
```

```{r}
mydata$age.mon = mydata$age*12
mydata
```

```{r}
mydata$sex=="M"
```

```{r}
mydata[mydata$sex=="M",]
```

```{r}
mydata[mydata$age>15,]
```

# LOOPS NO R:

Usado para repetir uma operação para um conjunto de valores. No R, um loop tem a seguinte estrutura básica:

for(i in conjunto_de_valores){
  # comandos que 
  # serão repetidos
}

Ou seja, iniciamos o loop com o comando for, seguio de parênteses e chaves. Dentro do parênteses, indicamos os valores que serão usados durante o loop, ou seja, um conjunto de valores que será iterado. Para cada elemento i contido no conjunto de valores, iremos executar os comandos que estão dentro das chaves. 
Vejamos um exemplo simples, que imprime na tela os números de 1 a 10:


```{r}
for(i in 1:10){
  print(i)
}
```

Agora, vamos imprimir na tela as 5 primeiras letras do alfabeto. O R tem um vetor com as letras do alfabeto: letters (que retorna 26 letras do alfabeto). Vejamos:

```{r}
for(i in 1:5){
  print(letters[i])
}
```

Suponha agora que vc queira imprimir a seguinte frase "Este é o ano de ..." para um conjunto de anos entre 2015 e 2020. Podemos contar com a ajuda do loop para tanto. Vejamos:


```{r}
for (i in 2015:2020){
  print(paste("Este é o ano de ", i))
}
```

Agora vamos fazer um loop para imprimir todos os números que não sejam pares entre 1 e 10. Para isso, vamos usar o comando next. Se o valor de i tem um resto diferente de zero quando dividido por 2 (ou seja, se ele é par), ele não entrará no condicional "if". O operador %% divide o primeiro número pelo segundo e retorna o resto. Veja abaixo. 

```{r}
for (i in 1:10) {
  if (!i %% 2){
    next
  }
    print(i)
}
```

# Observações finais:

Para determinar um diretório onde trabalhar no R é preciso trocar a barra. Usar essa barra / ao invés dessa "\". Ou então usar ""\\" (barra dupla).
