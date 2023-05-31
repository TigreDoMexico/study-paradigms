namespace ParaleloConcorrente.Examples.Threading
{
    public class ThreadParalela
    {
        private readonly int NUMERO_THREADS = 3;
        private readonly int[] NUMEROS = { 4, 6, 18, 70, 4, 13, 75, 1, 8 };

        public void ExecutarParaleloComThread()
        {
            int[] resultados = new int[NUMERO_THREADS];
            WaitHandle[] threads = new WaitHandle[NUMERO_THREADS];
            
            for(int i = 0; i < NUMERO_THREADS; i++)
            {
                int tamanho = NUMEROS.Length / NUMERO_THREADS;
                int[] sublista = NUMEROS.Skip(i * tamanho).Take(tamanho).ToArray();

                var handle = new EventWaitHandle(false, EventResetMode.ManualReset);
                var thread = criarThread(sublista, i, handle, resultados); 

                threads[i] = handle;
                thread.Start();
            }

            WaitHandle.WaitAll(threads);
            Console.WriteLine($"Lista Resultados: {resultados}");
            Console.WriteLine($"Resultado Final: {encontraMaior(resultados)}");
        }

        private Thread criarThread(int[] lista, int numeroThread, EventWaitHandle handle, int[] resultados) =>
            new(() => {
                    Console.WriteLine($"INICIANDO THREAD {numeroThread}");
                    var result = encontraMaior(lista);

                    resultados[numeroThread] = result;

                    Console.WriteLine("Chamando Handle SET");        
                    handle.Set();
                });

        private static int encontraMaior(int[] numeros)
        {
            int maior = numeros[0];

            for(int i = 1; i < numeros.Length; i++)
            {
                if(numeros[i] > maior)
                    maior = numeros[i];
            }

            return maior;
        }
    }
}