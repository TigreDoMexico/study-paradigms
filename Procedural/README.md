# Paradigma Procedural

Este código pega uma lista de números dentro de um arquivo txt e salva em outra lista dentro de um txt

## Como rodar o código (LINUX)
Instalar compilador Fortran \
`sudo apt install gfortran`

Compilar os módulos \
`gfortran -c formatter.f90` \
`gfortran -c salario.f90`

Compilar o index com os módulos \
`gfortran index.f90 formatter.o salario.o -o index`

Rodar o código \
`./index`

## Como rodar o código (DOCKER)
Gerar imagem do Docker \
`docker build -t tigredomexico/fortran-gfortran:1.0 .`

Rodar docker para abrir o terminal do container (na pasta que quer compilar) \
`docker run --rm -i -t -v ${pwd}:/source tigredomexico/fortran-gfortran:1.0`

Compilar os módulos (Via Terminal Docker) \
`gfortran -c formatter.f90` \
`gfortran -c salario.f90`

Compilar o index com os módulos (Via Terminal Docker) \
`gfortran index.f90 formatter.o salario.o -o index`

Rodar o código (Via Terminal Docker)\
`./index`