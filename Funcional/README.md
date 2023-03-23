# Paradigma Funcional

Este código pega uma lista de números dentro de um arquivo txt e salva em outra lista dentro de um txt

## Como rodar o código (LINUX)
Em desenvolvimento

## Como rodar o código (WINDOWS)
Gerar imagem do Docker
`docker build -t nacyot/haskell-ghc:apt .`

Rodar docker e usar terminal
`docker run -i -t -v ${pwd}:/source nacyot/haskell-ghc:apt`

Compilar o módulo dentro do GHCI (Via Terminal do Docker)
`:l modulo_salario`