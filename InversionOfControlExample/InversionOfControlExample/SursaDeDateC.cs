using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    //inversion of control
    class SursaDeDateC : ISursaDeDate 
    {
        List<Persoana> persoaneXML;

        public SursaDeDateC() 
        {
            persoaneXML = new List<Persoana>();
        }

        public void Add(Persoana persoana)
        {
            persoaneXML.Add(persoana);
        }

        public IList<Persoana> ReadAll()
        {
            return persoaneXML;
        }


        public IList<Persoana> ReadByName(string name)
        {
            return persoaneXML.Where(p => p.Nume.Equals(name)).ToList<Persoana>();
        }
    }
}
