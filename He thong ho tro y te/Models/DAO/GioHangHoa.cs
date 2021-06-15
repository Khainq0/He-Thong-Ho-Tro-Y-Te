using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace He_thong_ho_tro_y_te.Models.DAO
{
    public class GioHangHoa
    {
        private List<HangHoaBan> listHangHoa = new List<HangHoaBan>();
        public GioHangHoa()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public void addHangHoa(HangHoaBan tmp)
        {   
            bool co = false;
            foreach (HangHoaBan i in listHangHoa)
                if (i.id == tmp.id)
                {
                    i.sl += tmp.sl;
                    co = true;
                    break;
                }
            if (!co)
                listHangHoa.Add(tmp);
        }
        public void updateHangHoa(HangHoaBan tmp)
        {
            foreach (HangHoaBan i in listHangHoa)
                if (i.id == tmp.id)
                {
                    i.sl = tmp.sl;
                    if (tmp.sl == 0)
                        listHangHoa.Remove(tmp);
                    return;
                }
        }
        public void deleteHangHoa(int id)
        {
            foreach (HangHoaBan i in listHangHoa.ToList())
                if (i.id == id)
                {
                    listHangHoa.Remove(i);
                }
                    

        }

        public int getSL()
        {
            int sll = 0;
            foreach (HangHoaBan i in listHangHoa)
                sll += i.sl;
            return sll;

        }
        public double getTongTien()
        {
            double tong = 0;
            foreach (HangHoaBan i in listHangHoa)
                tong += i.sl * i.price;
            return tong;
        }

        public List<HangHoaBan> returnTable()
        {
            return listHangHoa;
        }
    }
}
