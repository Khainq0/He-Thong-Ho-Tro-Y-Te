namespace He_thong_ho_tro_y_te.Models.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DetailBill")]
    public partial class DetailBill
    {
        [Key]
        
        public int IdBill { get; set; }

        public int? IdProduct { get; set; }

        public string NameProduct { get; set; }

        public int? NumberProduct { get; set; }

        
        public double TotalMoney { get; set; }

        public virtual Bill Bill { get; set; }
    }
}
