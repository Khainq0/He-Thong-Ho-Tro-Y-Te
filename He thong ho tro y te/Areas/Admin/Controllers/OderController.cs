using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Models.DB;

namespace He_thong_ho_tro_y_te.Areas.Admin.Controllers
{
    public class OderController : Controller
    {
        // GET: Admin/Oder
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List(string searchString, string searchString2, string searchString3, string searchCat, int PageNum = 1, int PageSize = 5)
        {
            var model = new BillDAO();
            return View(model.ListBillPage(searchString, searchString2, searchString3, searchCat, PageNum, PageSize));
        }
        public ActionResult Delete(int id)
        {
            BillDAO dao=new BillDAO();
            dao.Delete(id);
            return Redirect(Request.UrlReferrer.ToString());
        }
        [HttpGet]
        public ActionResult Duyet(int id)
        {
            BillDAO.Duyet(id);
            return RedirectToAction("List");
        }
        public ActionResult ShowDetailOrder(int id)
        {
            List<DetailBill> listHangHoa = new List<DetailBill>();
            BillDAO dao = new BillDAO();
            listHangHoa = dao.ShowDetailOrder(id);
            return View(listHangHoa); 
           
        }
    }
}