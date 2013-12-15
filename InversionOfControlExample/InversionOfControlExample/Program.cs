using Autofac;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    class Program
    {
        static void Main(string[] args)
        {
            //inversion of control
            //SursaDeDateB B = new SursaDeDateB();
            //DispecerA A = new DispecerA(B);           

            //dependency injection
            IContainer container = GetContainer();

            ISursaDeDate sursaDeDate = GetObjectInstance<ISursaDeDate>(container);
            IPersonInitialization personInit = GetObjectInstance<IPersonInitialization>(container);

            var A = new DispecerA(sursaDeDate,personInit);

            A.Add();
            A.Add();

            foreach (Persoana pers in A.ReadAll())
            {
                //Console.WriteLine(pers.ToString());
                Console.WriteLine(string.Format("Nume: {0}, Prenume {1}, Varsta {2}", pers.Nume, pers.Prenume, pers.Varsta));
            }

            //inversion of control
            //SursaDeDateC C = new SursaDeDateC();
            //DispecerA AA = new DispecerA(C);

            //AA.Add();
            //AA.Add();

            //foreach (Persoana pers in AA.ReadAll())
            //{
            //    Console.WriteLine(pers.ToString());
            //    //Console.WriteLine(string.Format("Nume: {0}, Prenume {1}, Varsta {2}", pers.Nume, pers.Prenume, pers.Varsta));
            //}
        }


        //autofac
        private static IContainer GetContainer()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<SursaDeDateC>().As<ISursaDeDate>();
            builder.RegisterType<PersonInitialization>().As<IPersonInitialization>();

            var container = builder.Build();

            return container;
        }

        //functie generica
        private static T GetObjectInstance<T>(IContainer container)
        {
            T resultObject;

            using (var scope = container.BeginLifetimeScope())
            {
                resultObject = scope.Resolve<T>();
            }

            return resultObject;
        }

        //functie veche
        //private static ISursaDeDate GetSursaDeDate(IContainer container)
        //{
        //    ISursaDeDate sursaDeDate;
        //
        //    using (var scope = container.BeginLifetimeScope())
        //    {
        //        sursaDeDate = scope.Resolve<ISursaDeDate>();
        //    }
        //    return sursaDeDate;
        //}        
    }
}
