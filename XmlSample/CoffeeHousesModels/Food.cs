namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Food
    {
        public Food()
        {
        }

        public string Id { get; set; }

        [Required]
        [StringLength(13)]
        public string food_type { get; set; }

        [Required]
        [StringLength(120)]
        public string food_name { get; set; }

        public virtual Product Product { get; set; }

    }
}
