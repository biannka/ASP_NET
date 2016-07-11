namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Coffee
    {
        public Coffee()
        {
           // Products = new HashSet<Product>();
           // Supplements = new HashSet<Supplement>();
        }

        public string Id { get; set; }

        [StringLength(13)]
        public string drink_type { get; set; }

        [StringLength(50)]
        public string coffee_type { get; set; }

        [StringLength(50)]
        public string supplement_type { get; set; }

        [StringLength(50)]
        public string supplement_price { get; set; }

        [Required]
        [StringLength(50)]
        public string coffee_name { get; set; }

        public virtual Product Product { get; set; }

    }
}
