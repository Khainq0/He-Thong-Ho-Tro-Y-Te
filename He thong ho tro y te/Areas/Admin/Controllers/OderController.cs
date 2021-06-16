using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;

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

        [HttpGet]
        public ActionResult Duyet(int id)
        {
            BillDAO.Duyet(id);
            return RedirectToAction("List");
        }
    }
}