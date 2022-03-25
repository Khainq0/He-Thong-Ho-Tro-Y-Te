using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;
namespace He_thong_ho_tro_y_te.Areas.Patient.Controllers
{
    public class BillController : Controller
    {
        // GET: Patient/Bill
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List(string searchString, string searchString2, string searchString3, string searchString4, string searchString5, string searchCat, string searchDuyet, int PageNum = 1, int PageSize = 5)
        {
            var model = new BillDAO();
            return View(model.ListBillPage(searchString, searchString2, searchString3, searchString4, searchString5, searchCat, searchDuyet, PageNum, PageSize));
        }

        [HttpGet]
        public ActionResult Duyet(int id)
        {
            BillDAO.Duyet(id);
            return RedirectToAction("List");
        }
    }
}