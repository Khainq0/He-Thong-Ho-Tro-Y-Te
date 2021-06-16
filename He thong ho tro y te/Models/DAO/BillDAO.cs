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
        public IEnumerable<Bill> ListBillPage(string searchString, string searchString2, string searchString3, string searchCat, int Pagenum, int Pagesize)
        {
            IQueryable<Bill> model = db.Bills;

            //if (!string.IsNullOrEmpty(searchString))
            //{
            //    model = model.Where(x => x.Name.Contains(searchString) || x.Price.ToString().Contains(searchString));
            //}
            //else if (!string.IsNullOrEmpty(searchString2) && !string.IsNullOrEmpty(searchString3))
            //{
            //    int tu = Int32.Parse(searchString2);
            //    int mau = Int32.Parse(searchString3);
            //    model = model.Where(x => x.Amount >= tu || x.Amount <= mau);

            //}
            //else if (!string.IsNullOrEmpty(searchCat))
            //{
            //    model = model.Where(x => x.Name.Contains(searchCat));


            //}
            return model.OrderByDescending(x => x.IdBill).ToPagedList(Pagenum, Pagesize);
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
    }
}
