using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Models.DB;

namespace He_thong_ho_tro_y_te.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Admin/Category

        public ActionResult Index(string searchString, int PageNum = 1, int PageSize = 5)
        {
            // var dao = new ProductDAO();
            //var model = dao.ListProductPage(searchString,searchString2,searchString3, searchCat,PageNum, PageSize);

            CategoryDAO dao2 = new CategoryDAO();
            var model = dao2.ListCategoryPage(searchString, PageNum, PageSize);
            ViewBag.SearchString = searchString;

            return View(model);
        }
        public ActionResult Add()
        {
            
            return View();
        }
        [HttpPost]
        public ActionResult Add(string name)
        {

            Category product = new Category();

            product.CategoryName = name;

            if (ModelState.IsValid)
            {

                CategoryDAO dao = new CategoryDAO();
                dao.Add(product);

                return RedirectToAction("Index");
            }
            else
            {
                return View(product);
            }
        }
        public ActionResult Edit(int id)
        {
            List<Category> ls = new List<Category>();
            CategoryDAO dao = new CategoryDAO();
           
            ViewBag.cat = dao.getById(id);
           
            return View();
        }
        [HttpPost]
        public ActionResult Edit(int id, string name)
        {
           
            CategoryDAO dao = new CategoryDAO();
            Category product = dao.getById(id);
            
            product.CategoryName = name;
            
            if (ModelState.IsValid)
            {
                
                dao.Edit(product);
                
                return RedirectToAction("Index");
            }
            else
            {
                return View(product);
            }
        }
        
        
        public ActionResult Delete(int id)
        {
            CategoryDAO dao = new CategoryDAO();
            dao.Delete(id);
            return Redirect("~/Admin/Category/Index");
        }
    }
}