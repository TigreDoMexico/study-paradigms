# Paradigma Procedural

Este código pega uma lista de números dentro de um arquivo txt e salva em outra lista dentro de um txt

## Como rodar o código (LINUX)
Instalar compilador Fortran
`sudo apt install gfortran`

Compilar o código em Fortran
`gfortran -o index index.f90`

Rodar o código
`./index`

## Como rodar o código (WINDOWS)
Gerar imagem do Docker
`docker build -t nacyot/fortran-gfortran:apt .`

Rodar docker e usar terminal
`docker run --rm -i -t -v ${pwd}:/source nacyot/fortran-gfortran:apt`

Compilar o código em Fortran (Via Terminal do Docker)
`gfortran -o index index.f90`

Rodar o código (Via Terminal do Docker)
`./index`