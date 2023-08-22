# Paradigma Funcional

Este código pega uma lista de números dentro de um arquivo txt e salva em outra lista dentro de um txt

## Como rodar o código (LINUX)
Em desenvolvimento

## Como rodar (DOCKER)
Criar imagem \
`docker build -t tigredomexico/haskell:1.0 .` \
\
Rodar terminal docker \
`docker run --rm -i -t -v $(pwd):/source tigredomexico/haskell:1.0`

### Comandos Haskell
Compilar arquivo para rodar no terminal \
`ghci -> :l calcula_salario` \
\
Compilar arquivo para gerar o executável \
`ghc calcula_salario.hs`