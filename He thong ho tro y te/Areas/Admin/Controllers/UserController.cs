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
    public class UserController : Controller
    {
        // GET: Admin/User
        [HasPermission(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            UserDAO dao = new UserDAO();
            dao.Delete(id);
            return Redirect("~/Admin/User/Index");
        }
        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Detail(int id)
        {
            var user = new UserDAO().Detail(id);

            return View(user);
        }
        [HasPermission(RoleID = "ADD_USER")]
        public ActionResult Add()
        {
            List<UserGroup> ls = new List<UserGroup>();
            UserGroupDAO dao = new UserGroupDAO();
            return View(dao.ListGroup());
        }
        [HasPermission(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            List<UserGroup> ls = new List<UserGroup>();
            UserGroupDAO dao = new UserGroupDAO();
            UserDAO proDao = new UserDAO();
            ViewBag.group = dao.ListGroup();
            ViewBag.user = proDao.getById(id);
            return View();
        }

        [HttpPost]
        [HasPermission(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id, string groupid,  string name, string username, string password,string describe, HttpPostedFileBase image)
        {
            var img = Path.GetFileName(image.FileName);
            UserDAO dao = new UserDAO();
            User user = dao.getById(id);
            user.UserName = username;
            user.Password= password;
            user.Name = name;
            
            user.GroupID = groupid;
            user.Address = describe;
            if (ModelState.IsValid)
            {
                if (image != null && image.ContentLength > 0)
                {
                    var path = Path.Combine(Server.MapPath("~/Asset/Photo/"),
                                            System.IO.Path.GetFileName(image.FileName));
                    image.SaveAs(path);

                    user.ModifiedBy = image.FileName;
                    dao.Edit(user);
                }
                return RedirectToAction("Index");
            }
            else
            {
                return View(user);
            }
        }

        [HttpPost]
        [HasPermission(RoleID = "ADD_USER")]
        public ActionResult Add( string groupid, string name, string username, string password,string describe, HttpPostedFileBase image)
        {
            
            var img = Path.GetFileName(image.FileName);
           
            User user = new User();
            user.UserName = username;
            user.Password = password;
            user.Name = name;
            user.GroupID = groupid;
            user.Address = describe;
            if (ModelState.IsValid)
            {
                if (image != null && image.ContentLength > 0)
                {
                    var path = Path.Combine(Server.MapPath("~/Asset/Photo/"),
                                            System.IO.Path.GetFileName(image.FileName));
                    image.SaveAs(path);
                     user.ModifiedBy = image.FileName;
                    UserDAO dao1 = new UserDAO();
                    dao1.Add(user);
                   
                }
                return RedirectToAction("Index");
            }
            else
            {
                return View(user);
            }
        }


        //public ActionResult Index(string searchString, int PageNum = 1, int PageSize = 2)
        //{
        //    var dao = new UserDAO();
        //  var model = dao.ListUserPage(searchString, PageNum, PageSize);
        //   ViewBag.SearchString = searchString;
        //   return View(model);
        //}

        [HasPermission(RoleID = "VIEW_USER")]
        public ActionResult Index(string searchString, int groupid = 0, int PageNum = 1, int PageSize = 5)
        {
            var dao = new UserDAO();
            var model = dao.ListUserPage(searchString, PageNum, PageSize);

            ViewBag.SearchString = searchString;

            return View(model);
        }
        [HttpGet]
        public ActionResult Duyet(int id)
        {
            UserDAO.Duyet(id);
            return RedirectToAction("Index");
        }
    }
}