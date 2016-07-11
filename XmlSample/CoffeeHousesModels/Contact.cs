namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Contact
    {
        public Contact()
        {
            CoffeeHouses = new HashSet<CoffeeHouse>();
        }
        [StringLength(10)]
        public string Id { get; set; }

        [StringLength(13)]
        public string phone { get; set; }

        [StringLength(30)]
        public string email { get; set; }

        [StringLength(30)]
        public string website { get; set; }

        public Location Locations { get; set; }

        public virtual ICollection<CoffeeHouse> CoffeeHouses { get; set; }
    }
}
