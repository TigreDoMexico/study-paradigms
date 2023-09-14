var lista = [1, 2, 3, 4, 5, 6]
var multiplicador = 3

/* 
Função Impura
- Utiliza elementos externos dentro dela
- Nem sempre dado uma entrada ela terá a mesma saída
*/
var funcaoImpura = () => lista.map(el => el * multiplicador)

console.log(funcaoImpura())

/* 
Função Pura
- Não depende de ninguém externo a ela para funcionar
- Dado uma entrada, ela tera sempre a mesma saída
*/
var funcaoPura = (numeros, multipl) => numeros.map(el => el * multipl)

console.log(funcaoPura(lista, multiplicador))


/*
Multiples Responsabilities
- Tendem a ser mais complicadas de testar e fazer manutenção
*/

var funcaoMultipleResponsabilities = (lista) => {
    var resultado1 = lista.filter(el => el % 2 == 0) // Filtra números pares

    if(resultado1.length == 0) {
        console.log('Lista sem números pares') // Informa o usuário caso não tenha pares
        return
    }

    var resultado2 = resultado1.map(el => el / 2) // Divide os números por 2
    return resultado2.map(el => el === 1 ? true : false) // Retorna uma lógica 
}

console.log(funcaoMultipleResponsabilities(lista))


/*
Single Responsabilities
- Ter uma responsabilidades ajuda nos testes
- Um deles será responsável por orquestrar o fluxo
*/

var funcaoFiltrarPares = list => list.filter(el => el % 2 == 0)

var funcaoInformarUsuario = list => {
    if(list.length == 0) {
        console.log('Lista sem números pares')
        return
    }
}

var funcaoDividirPorDois = list => list.map(el => el / 2)

var funcaoAplicarLogica = list => list.map(el => el === 1 ? true : false)

var funcaoOrquestrador = (lista) => {
    var resultado1 = funcaoFiltrarPares(lista)

    funcaoInformarUsuario(lista)

    var resultado2 = funcaoDividirPorDois(resultado1)
    return funcaoAplicarLogica(resultado2)
}

console.log(funcaoOrquestrador(lista))


/*
High Order Functions
- Funções que recebem outras funções como parâmetro ou retornam outras funcoes criadas
*/


var funcaoHighOrder1 = (filtrar, informar, dividir, logica, lista) => {
    var resultado1 = filtrar(lista)

    informar(resultado1)

    var resultado2 = dividir(lista)
    return logica(lista)
}

console.log(funcaoHighOrder1(funcaoFiltrarPares, funcaoInformarUsuario, funcaoDividirPorDois, funcaoAplicarLogica, lista))



var funcaoHighOrder2 = (comparador, resultado1, resultado2) => {
    return elemento => elemento === comparador ? resultado1 : resultado2
}


var novaFuncaoCriada = funcaoHighOrder2(1, true, false)

console.log(novaFuncaoCriada(5))
console.log(novaFuncaoCriada(1))


var segundaNovaFuncaoCriada = funcaoHighOrder2(5, 'É CINCO', 'NÃO É CINCO')

console.log(segundaNovaFuncaoCriada(5))
console.log(segundaNovaFuncaoCriada(1))

