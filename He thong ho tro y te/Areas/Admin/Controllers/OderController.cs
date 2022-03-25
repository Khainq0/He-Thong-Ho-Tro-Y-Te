using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Common;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Models.DB;

namespace He_thong_ho_tro_y_te.Areas.Admin.Controllers
{
    public class OderController : Controller
    {
        // GET: Admin/Oder
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Index()
        {
            return View();
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult List(string searchString, string searchString2, string searchString3, string searchString4, string searchString5, string searchCat,string searchDuyet, int PageNum = 1, int PageSize = 5)
        {
            var model = new BillDAO();
            CategoryDAO dao2 = new CategoryDAO();
            ViewBag.cat = dao2.ListCate();
            ViewBag.SearchString = searchString;
            ViewBag.SearchString2 = searchString2;
            ViewBag.SearchString3 = searchString3;
            ViewBag.SearchString4 = searchString4;
            ViewBag.SearchString5 = searchString5;
            ViewBag.SearchCat = searchCat;
            ViewBag.SearchDuyet = searchDuyet;
            return View(model.ListBillPage(searchString, searchString2, searchString3, searchString4, searchString5, searchCat,searchDuyet, PageNum, PageSize));
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Delete(int id)
        {
            BillDAO dao=new BillDAO();
            bool checkPro = dao.checkDuyet(id);
            if (checkPro == true)
            {
                TempData["msg"] = "<script>alert('Xóa thất bại!! Bạn chưa duyệt đơn hàng này');</script>";

            }
            else
            {
                dao.Delete(id);

            }
            return Redirect(Request.UrlReferrer.ToString());
           
        }
        [HttpGet]
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Duyet(int id)
        {
            BillDAO.Duyet(id);
            return RedirectToAction("List");
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult ShowDetailOrder(int id)
        {
            List<DetailBill> listHangHoa = new List<DetailBill>();
            BillDAO dao = new BillDAO();
            listHangHoa = dao.ShowDetailOrder(id);
            return View(listHangHoa); 
           
        }
    }
}