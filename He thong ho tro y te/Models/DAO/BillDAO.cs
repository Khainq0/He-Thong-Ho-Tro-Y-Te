using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using He_thong_ho_tro_y_te.Models.DB;

using PagedList;
namespace He_thong_ho_tro_y_te.Models.DAO
{
    public class BillDAO
    {
        private static YTeDbContext db;

        public BillDAO()
        {
            db = new YTeDbContext();
        }

        public void Add(Bill lh)
        {
            db.Bills.Add(lh);
            db.SaveChanges();
        }
        public Bill Detail(int id)
        {
            return db.Bills.Find(id);

        }
        public void Delete(int id)
        {
            Bill pro = db.Bills.Find(id);
            if (pro != null)
            {
                db.Bills.Remove(pro);
                db.SaveChanges();
            }
        }
        public Bill getById(int id)
        {
            return db.Bills.Single(i => i.IdBill == id);
        }
        public List<Bill> ListBill(int Pagenum, int Pagesize)
        {
            return db.Bills.Skip((Pagenum - 1) * Pagesize).Take(Pagesize).ToList();
        }
        public IEnumerable<Bill> ListBillPage(string searchString, string searchString2, string searchString3, string searchString4, string searchString5,string searchCat,string searchDuyet, int Pagenum, int Pagesize)
        {
            IQueryable<Bill> lst = db.Bills;

            if (!string.IsNullOrEmpty(searchString))
            {
                lst = lst.Where(x => x.Name.Contains(searchString) || x.TotalMoney.ToString().Contains(searchString) || x.GhiChu.Contains(searchString) || x.DeliveryAddress.ToString().Contains(searchString));

            }
            if (!string.IsNullOrEmpty(searchString2))
            {
                int tu = Int32.Parse(searchString2);
                lst = lst.Where(x => x.TotalMoney >= tu);
            }
            if (!string.IsNullOrEmpty(searchString3))
            {
                int mau = Int32.Parse(searchString3);
                lst = lst.Where(x => x.TotalMoney <= mau);
            }
            //if (!string.IsNullOrEmpty(searchString4))
            //{
            //    int tu2 = Int32.Parse(searchString4);
            //    lst = lst.Where(x => x.CreatedDate >= tu2);
            //}
            //if (!string.IsNullOrEmpty(searchString5))
            //{
            //    int mau2 = Int32.Parse(searchString5);
            //    lst = lst.Where(x => x.CreatedDate <= mau2);
            //}
            if (!string.IsNullOrEmpty(searchDuyet))
            {
                bool myBool = bool.Parse(searchDuyet);
                if(myBool == true)
                {
                    lst = lst.Where(x => x.Duyet == myBool);
                }
                else if (myBool == false)
                {
                    lst = lst.Where(x => x.Duyet == myBool || x.Duyet == null);
                }
                

            }
            return lst.OrderByDescending(x => x.IdBill).ToPagedList(Pagenum, Pagesize);
        }

        public static void Duyet(int id)
        {
            var duyet = from p in db.Bills
                        where p.IdBill == id
                        select p;
            foreach (var item in duyet)
            {
                item.Duyet = true;
            }
            db.SaveChanges();
        }
        public void DetailBill(List<HangHoaBan> Hanghoa)
        {   
            var hoaDon = (from h in db.Bills orderby h.IdBill descending select h).FirstOrDefault();
            foreach (var item in Hanghoa)
            {
                DetailBill ct = new DetailBill();
                ct.IdBill = hoaDon.IdBill;
                ct.NameProduct= item.name;
                ct.NumberProduct = item.sl;
                ct.TotalMoney = hoaDon.TotalMoney;
                db.DetailBills.Add(ct);
                db.SaveChanges();
            }
        }

        public List<DetailBill> ShowDetailOrder(int id)
        {
            List<DetailBill> listHangHoa = new List<DetailBill>();
            foreach (var item in db.DetailBills.ToList())
            {
                if (item.IdBill == id) listHangHoa.Add(item);
                
            }
            return listHangHoa;
        }
        public bool checkDuyet(int id)
        {
            foreach (var i in db.Bills.ToList())
            {
                if (id == i.IdBill && i.Duyet == true)
                {
                    
                    return true;
                }

                
            }
            return false;
        }
    }
}
