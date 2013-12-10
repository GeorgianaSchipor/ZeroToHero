using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Plafar.Models
{
    public class PlafarContext : DbContext
    {
        public PlafarContext()
            : base("DefaultConnection")
        {

        }

        public DbSet<Produs> Produse { get; set; }
    }
}