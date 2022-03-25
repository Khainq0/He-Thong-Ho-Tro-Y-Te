using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Models.DB;
using System.IO;
using He_thong_ho_tro_y_te.Common;

namespace He_thong_ho_tro_y_te.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        // GET: Admin/News
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Delete(int id)
        {
            NewsDAO dao = new NewsDAO();
            dao.Delete(id);
            return Redirect("~/Admin/News/Index");
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Detail(int id)
        {
            News product = new NewsDAO().Detail(id);
           
            return View(product);
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Add()
        {
            
            return View();
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Edit(int id)
        {
            
            NewsDAO proDao = new NewsDAO();
        
            ViewBag.pro = proDao.getById(id);
            return View();
           
        }
        [HasPermission(RoleID = "VIEW_USER")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, string name, string detail, HttpPostedFileBase image)
        {
            var img = Path.GetFileName(image.FileName);
            NewsDAO dao = new NewsDAO();
            News ne = dao.getById(id);
        
            ne.Name = name;
            ne.Detail = detail;
          
            if (ModelState.IsValid)
            {
                if (image != null && image.ContentLength > 0)
                {
                    var path = Path.Combine(Server.MapPath("~/Asset/Photo/"),
                                            System.IO.Path.GetFileName(image.FileName));
                    image.SaveAs(path);

                    ne.Image = image.FileName;

                    dao.Edit(ne);
                }
                return RedirectToAction("Index");
            }
            else
            {
                return View(ne);
            }
        }
        [HasPermission(RoleID = "VIEW_USER")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(string name, string detail, HttpPostedFileBase image)
        {
            var img = Path.GetFileName(image.FileName);
            News ne = new News();
         
            ne.Name = name;
            ne.Detail = detail;
            ne.CreatedDate = DateTime.Now;
            ne.CreatedBy = Session["username"].ToString();
            if (ModelState.IsValid)
            {
                if (image != null && image.ContentLength > 0)
                {
                    var path = Path.Combine(Server.MapPath("~/Asset/Photo/"),
                                            System.IO.Path.GetFileName(image.FileName));
                    image.SaveAs(path);

                    ne.Image = image.FileName;
                    NewsDAO dao = new NewsDAO();
                    dao.Add(ne);
                }
                return RedirectToAction("Index");
            }
            else
            {
                return View(ne);
            }
        }



        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Index(string searchString,  int PageNum = 1, int PageSize = 5)
        {
            // var dao = new ProductDAO();
            //var model = dao.ListProductPage(searchString,searchString2,searchString3, searchCat,PageNum, PageSize);
            var dao = new NewsDAO();
            var model = dao.ListNewsPage(searchString,  PageNum, PageSize);
        
           
            ViewBag.SearchString = searchString;
            
         

            return View(model);
        }
    }
}