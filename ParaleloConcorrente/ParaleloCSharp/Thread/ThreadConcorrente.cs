namespace ParaleloConcorrente.Examples.Threading;

public class ThreadConcorrente
{
    static int counter = 0;
    static object lockObject = new object();

    public void ExecutarConcorrencia()
    {
        Thread t1 = new Thread(() => {
            Console.WriteLine("Iniciando Execução THREAD 1");
            IncrementCounter("THREAD 1");
        });

        Thread t2 = new Thread(() => {
            Console.WriteLine("Iniciando Execução THREAD 2");
            IncrementCounter("THREAD 2");
        });

        Thread t3 = new Thread(() => {
            Console.WriteLine("Iniciando Execução THREAD 3");
            IncrementCounter("THREAD 3");
        });

        t1.Start();
        t2.Start();
        t3.Start();

        t1.Join();
        t2.Join();
        t3.Join();

        Console.WriteLine("Contador: " + counter);
        Console.ReadLine();
    }

    private static void IncrementCounter(string nomeThread)
    {
        for (int i = 0; i < 10; i++)
        {
            lock(lockObject)
            {
                Console.WriteLine($"EXECUTANDO: {nomeThread} => Contador: {counter}");
                counter++;
            }
        }
    }

}
