using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace He_thong_ho_tro_y_te.Common
{
    [Serializable]
    public class UserLogin
    {
        public long UserID { set; get; }
        public string UserName { set; get; }
        public string GroupID { set; get; }
    }
}