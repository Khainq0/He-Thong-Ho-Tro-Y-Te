using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Models.DB;
using System.IO;
using He_thong_ho_tro_y_te.Models.DTO;

namespace He_thong_ho_tro_y_te.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        
        public ActionResult Index(string searchString,string searchString2, string searchString3, string searchString4, string searchString5, string searchCat, int categoryID = 0, int PageNum = 1, int PageSize = 15)
        {
            var dao = new ProductDAO();
            
            var model = dao.lstjoin(searchString, searchString2, searchString3, searchString4, searchString5, searchCat, PageNum, PageSize);
            CategoryDAO dao2 = new CategoryDAO();
            ViewBag.cat = dao2.ListCate();
            ViewBag.SearchString = searchString;
            ViewBag.SearchString = searchString;
            ViewBag.SearchString2 = searchString2;
            ViewBag.SearchString3 = searchString3;
            ViewBag.SearchString4 = searchString4;
            ViewBag.SearchString5 = searchString5;
            ViewBag.SearchCat = searchCat;

            return View(model);
        }
        public ActionResult Detail(int id)
        {
            Product product = new ProductDAO().Detail(id);
            ProductDTO productDTO = new ProductDTO(product.Id, product.Name, product.Price, product.Amount, product.Image, product.CategoryID);
            return View(productDTO);
        }
        [HttpPost]
        public ActionResult Detail(int id, int sl)
        {
            ProductDAO dao = new ProductDAO();
            Product product = dao.getById(id);
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            if (gio == null)
                gio = new GioHangHoa();
            //truy van tu csdl
            HangHoaBan hangHoa = new HangHoaBan(id, sl, product.Name, Convert.ToInt32(product.Price), product.Image, product.Describe);
            gio.addHangHoa(hangHoa);
            Session["cart"] = gio;
            return Redirect(Request.UrlReferrer.ToString());
        }

        public ActionResult Add(int id)
        {
            ProductDAO dao = new ProductDAO();
            Product product = dao.getById(id);
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            if (gio == null)
                gio = new GioHangHoa();
            //truy van tu csdl
            HangHoaBan hangHoa = new HangHoaBan(id,1,product.Name,Convert.ToInt32(product.Price),product.Image,product.Describe);
            gio.addHangHoa(hangHoa);
            Session["cart"] = gio;
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult Delete(int id)
        {
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            
            gio.deleteHangHoa(id);
            Session["cart"] = gio;
            if (gio.getSL() == 0)
                //gio = new GioHangHoa();
                return RedirectToAction("GioHangRong","Shop");
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult Update(int id, int sl)
        {
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            HangHoaBan hangHoa = new HangHoaBan(id,sl,"0",0,"0","0");
            gio.updateHangHoa(hangHoa);
            Session["cart"] = gio;
            if (gio.getSL() == 0)
                //gio = new GioHangHoa();
                return RedirectToAction("GioHangRong", "Shop");
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult ViewCount()
        {
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            if (gio == null)
                ViewBag.count = 0;
            else
                ViewBag.count = gio.getSL();
            return View();
        }
        public ActionResult TotalMoney()
        {
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            if (gio == null)
                ViewBag.totalmoney = 0;
            else
                ViewBag.totalmoney = gio.getTongTien();
            return View();
        }
        
        public ActionResult GioHang()
        {
            List<HangHoaBan> listHangHoa = new List<HangHoaBan>();
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            if (gio ==null)
                return Redirect("~/Shop/GioHangRong");
            else
            {
                if (gio.getSL() == 0)
                    return Redirect("~/Shop/GioHangRong");
                else
                listHangHoa = gio.returnTable();
                return View(listHangHoa);
            }


        }
        public ActionResult GioHangRong()
        {

            return View();

        }
        [HttpGet]
        public ActionResult CheckOut()
        {
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            List<HangHoaBan> listHangHoa = new List<HangHoaBan>();

            if (gio == null)
                return Redirect("GioHangRong");
            else
                listHangHoa = gio.returnTable();
                return View(listHangHoa);
        }
        [HttpPost]
        public ActionResult CheckOut(string name, string email, string address, string phone, string ghichu,string deliverytime)
        {
            
            GioHangHoa gio = (GioHangHoa)Session["cart"];
            List<HangHoaBan> listHangHoa = new List<HangHoaBan>();
            if (gio == null)
                return View();
            else
            {
                if (ModelState.IsValid)
                {
                    listHangHoa = gio.returnTable();
                    Bill order = new Bill();
                    BillDAO dao = new BillDAO();
                    order.CreatedDate = Convert.ToString(DateTime.Now);
                    order.Name = name;
                    order.Email = email;
                    order.DeliveryAddress = address;
                    order.Phone = phone;
                    order.GhiChu = ghichu;
                    order.DeliveryTime = deliverytime;
                    order.TotalMoney = gio.getTongTien();
                    dao.Add(order);
                    dao.DetailBill(listHangHoa);
                    listHangHoa.Clear();
                    return Redirect("Success");

                }
                else return View();
                    
            }
        }
        public ActionResult Success()
        {
            return View();
        }

    }
}