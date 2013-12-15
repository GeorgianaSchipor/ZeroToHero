using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    //inversion of control
    public class DispecerA
    {
        ISursaDeDate sursaDeDate;
        IPersonInitialization personInitialization;

        public DispecerA(ISursaDeDate sursaDeDate, IPersonInitialization personInitialization)
        {
            this.sursaDeDate = sursaDeDate;
            this.personInitialization = personInitialization;
        }        

        public void Add() 
        {
            var person = personInitialization.CreatePerson();

            if (person.Varsta < 18)
                throw new Exception("Varsta este sub 18 ani !");
           
           
            if(String.Compare(person.Nume,"Anonim")==0)
                throw new Exception("Trebuie sa va dati numele!");
            
            sursaDeDate.Add(person);
        }

        public IList<Persoana> ReadAll() 
        {
            return sursaDeDate.ReadAll();
        }

        public IList<Persoana> ReadByNume(String name) 
        {
            return sursaDeDate.ReadByName(name);
        }
    }

    public class PersonInitialization : IPersonInitialization
    {
        public Persoana CreatePerson()
        {
            String nume, prenume;
            int varsta;
            Console.WriteLine("Nume: ");
            nume = Console.ReadLine();
            Console.WriteLine("Prenume: ");
            prenume = Console.ReadLine();
            Console.WriteLine("Varsta: ");
            varsta = int.Parse(Console.ReadLine());

            return new Persoana
            {
                Nume = nume,
                Prenume = prenume,
                Varsta = varsta
            };
        }

    }

    public interface IPersonInitialization{
        Persoana CreatePerson();
    }
}
