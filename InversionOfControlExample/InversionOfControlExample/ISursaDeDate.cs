using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InversionOfControlExample
{
    public interface ISursaDeDate
    {
        void Add(Persoana persoana);

        IList<Persoana> ReadAll();

        IList<Persoana> ReadByName(String name);
    }
}
