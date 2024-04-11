using ParaleloConcorrente.Examples.Threading;

Console.WriteLine("Exemplo Paralelo Concorrente");

var concorrente = new ThreadConcorrente();
concorrente.ExecutarConcorrencia();

var paralelo = new ThreadParalela();
paralelo.ExecutarParaleloComThread();