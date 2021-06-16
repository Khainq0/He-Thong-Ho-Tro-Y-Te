namespace He_thong_ho_tro_y_te.Models.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [Key]
        
        public int IdBill { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(15)]
        public string Phone { get; set; }

        public string DeliveryAddress { get; set; }

        [StringLength(50)]
        public string DeliveryTime { get; set; }

        public double TotalMoney { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string CreatedDate { get; set; }
        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        public bool? Duyet { get; set; }

        public virtual DetailBill DetailBill { get; set; }
    }
}
