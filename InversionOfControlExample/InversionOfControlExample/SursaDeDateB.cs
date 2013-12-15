using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    //inversion of control
    public class SursaDeDateB : ISursaDeDate
    {
        List<Persoana> persoaneDB;

        public SursaDeDateB() 
        {
            persoaneDB = new List<Persoana>();
        }

        public void Add(Persoana persoana)
        {
            persoaneDB.Add(persoana);
        }

        public IList<Persoana> ReadAll()
        {
            return persoaneDB;
        }


        public IList<Persoana> ReadByName(string name)
        {
            return persoaneDB.Where(p => p.Nume.Equals(name)).ToList<Persoana>();
        }
    }
}
