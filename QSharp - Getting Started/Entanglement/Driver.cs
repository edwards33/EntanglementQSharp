using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Entanglement
{
    class Driver
    {
        static void Main(string[] args)
        {
            var ones = 0;
            var equal = 0;
            using (var qsim = new QuantumSimulator())
            {
                for (int index = 0; index < 1000; index++)
                {
                    var (qubitOneState, qubitTwoState) = Entanglement.Run(qsim).Result;
                    if (qubitOneState == Result.One)
                    {
                        ones++;
                    }

                    if (qubitOneState == qubitTwoState)
                    {
                        equal++;
                    }
                }
            }

            Console.WriteLine("Entanglement Results: ");
            Console.WriteLine($"\t   One: {ones}");
            Console.WriteLine($"\t  Zero: {1000-ones}");
            Console.WriteLine($"\t Equal: {equal/1000*100}%");
            Console.ReadKey();
        }
    }
}