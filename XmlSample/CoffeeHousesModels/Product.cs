namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Product
    {
        public Product()
        {
            CoffeeHouses = new HashSet<CoffeeHouse>();
            Coffees = new HashSet<Coffee>();
            Foods = new HashSet<Food>();
        }

        [Required]
        public string Id { get; set; }

        [Required]
        [StringLength(13)]
        public string price { get; set; }

        [StringLength(120)]
        public string product_name { get; set; }

        [StringLength(1000)]
        public string description { get; set; }

        public virtual ICollection<Food> Foods { get; set; }

        public virtual ICollection<Coffee> Coffees { get; set; }

        public virtual ICollection<CoffeeHouse> CoffeeHouses { get; set; }
    }
}
