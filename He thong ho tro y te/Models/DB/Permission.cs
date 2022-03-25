namespace He_thong_ho_tro_y_te.Models.DB
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Permission")]
    [Serializable]
    public partial class Permission
    {
        //public UserGroup()
        //{
        //    UserGroups = new HashSet<User>();
        //}
        [Key]
        
        [StringLength(20)]
        public string UserGroupID { get; set; }

        [StringLength(20)]
        public string RoleID { get; set; }
    }
}
