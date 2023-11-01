using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello world!");

            PrimeNumberGenerator generator = new SieveOfEratosthenesGenerator(5);
            PrimeNumberGeneratorFactory factory = new PrimeNumberGeneratorFactory();
            Factorization factorization = new Factorization(factory);
            LCM lcm = new LCM(factorization);

            Console.WriteLine(lcm.Calculate(9, 18));
            Console.WriteLine(lcm.Calculate(8, 5));
            Console.WriteLine(lcm.Calculate(17, 11));

        }
    }

    interface PrimeNumberGenerator
    {
        int Next();
        int[] AsArray();
    }

    class SieveOfEratosthenesGenerator : PrimeNumberGenerator
    {
        int index;
        int[] primes;

        public SieveOfEratosthenesGenerator(int boundary)
        {
            bool[] sieve = new bool[boundary + 1];

            for (int index = 1; index <= boundary; index++)
            {
                sieve[index] = true;
            }

            for (int index = 2; index <= Math.Floor(Math.Sqrt(boundary)); index++)
            {
                if (sieve[index] == true)
                {
                    int innerIndex = index * index;
                    while (innerIndex < boundary)
                    {
                        sieve[innerIndex] = false;
                        innerIndex = innerIndex + index;
                    }
                }
            }

            int primeCount = 0;
            for (int index = 1; index <= boundary; index++)
            {
                if (sieve[index] == true)
                {
                    primeCount = primeCount + 1;
                }
            }

            primes = new int[primeCount];

            int primeIndex = 0;
            for (int index = 1; index <= boundary; index++)
            {
                if (sieve[index] == true)
                {
                    primes[primeIndex] = index;
                    primeIndex++;
                }
            }
            index = 0;
        }

        public int Next()
        {
            if (index <= primes.Length - 1)
            {
                index = index + 1;
                return primes[index - 1];
            }

            throw new Exception("end of the line");
        }

        public int[] AsArray()
        {
            return primes;
        }
    }

    class PrimeNumberGeneratorFactory
    {
        public PrimeNumberGenerator Generate(int boundary)
        {
            return new SieveOfEratosthenesGenerator(boundary);
        }
    }

    class Factorization
    {
        PrimeNumberGeneratorFactory factory;

        public Factorization(PrimeNumberGeneratorFactory factory)
        {
            this.factory = factory;
        }

        public int[] Calculate(int number)
        {
            int[] primes = factory.Generate(number).AsArray();
            List<int> factors = new List<int>();

            int current = number;
            foreach(int prime in primes)
            {
                if (prime < 2)
                {
                    continue;
                }

                while (true)
                {
                    long remainder;
                    long quotient = Math.DivRem(current, prime, out remainder);

                    // Console.WriteLine("{0} div {1} = {2} {3}", current, prime, quotient, remainder); 

                    if (remainder == 0 || remainder == prime)
                    {
                        factors.Add(prime);
                        current = (int) quotient;

                        continue;
                    }

                    break;
                }
            }

            return factors.ToArray();
        }
    }

    class LCM
    {
        Factorization factorization;

        public LCM(Factorization factorization)
        {
            this.factorization = factorization;
        }

        public int Calculate(int left, int right)
        {
            int[] leftFactorization = factorization.Calculate(left);
            int[] rightFactorization = factorization.Calculate(right);

            int leftIndex = 0;
            int rightIndex = 0;

            int lcm = 1;

            while (leftIndex < leftFactorization.Length && rightIndex < rightFactorization.Length)
            {
                int leftValue = leftFactorization[leftIndex];
                int rightValue = rightFactorization[rightIndex];

                if (leftValue == rightValue)
                {
                    lcm = lcm * leftValue;
                    leftIndex++;
                    rightIndex++;
                }
                else if (leftValue < rightValue)
                {
                    lcm = lcm * leftValue;
                    leftIndex++;
                }
                else
                {
                    lcm = lcm * rightValue;
                    rightIndex++;
                }
            }

            for (int index = leftIndex; index < leftFactorization.Length; index++)
            {
                lcm = lcm * leftFactorization[index];
            }

            for (int index = rightIndex; index < rightFactorization.Length; index++)
            {
                lcm = lcm * rightFactorization[index];
            }

            return lcm;
        }
    }
}
