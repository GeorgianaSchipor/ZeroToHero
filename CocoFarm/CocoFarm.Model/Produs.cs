using CocoFarm.DataAccess;

namespace CocoFarm.Models
{
    public class Produs : IEntityWithId
    {
        public int Id { get; set; }
        public string Denumire { get; set; }
        public string Cod { get; set; }
        public string Descriere { get; set; }
    }
}