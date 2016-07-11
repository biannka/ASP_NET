namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Gift
    {
        public Gift()
        {
            CoffeeHouse = new HashSet<CoffeeHouse>();
        }

        public string Id { get; set; }

        [StringLength(30)]
        public string gift_name { get; set; }

        [StringLength(120)]
        public string gift_type { get; set; }

        [StringLength(100)]
        public string gift_reason { get; set; }

       public virtual ICollection<CoffeeHouse> CoffeeHouse { get; set; }
    }
}
