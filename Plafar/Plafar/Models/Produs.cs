using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Plafar.Models
{
    [Table("Produs")]
    public class Produs
    {
        [Key]
        public int Id { get; set; }
        
        public string Cod { get; set; }

        public string Denumire { get; set; }
        
        public string Descriere { get; set; }
    }
}