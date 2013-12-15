using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    //inversion of control
    public class Persoana
    {
        public String Nume { get; set; }

        public String Prenume { get; set; }

        public int Varsta { get; set; }

        public String ToString() {
            return Nume + " " + Prenume + " " + Varsta;
        }
    }
}
