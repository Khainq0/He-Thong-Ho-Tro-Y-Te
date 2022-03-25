using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using He_thong_ho_tro_y_te.Models.DB;
using He_thong_ho_tro_y_te.Models.DAO;
using He_thong_ho_tro_y_te.Common;

namespace He_thong_ho_tro_y_te.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            //UserDAO dao = new UserDAO();

            //if (dao.checkLogin(username, password))
            //{
            //    Session["username"] = username;
            //    return Redirect("~/Home/Index");

            //}
            //else return Redirect("Login");
            if (ModelState.IsValid)
            {
                UserDAO dao = new UserDAO();
                var result = dao.checkLogin2(username, password);
                var userSession = new UserLogin();
                
                
                
                if (result == 1)
                {
                    Session["username"] = username;
                    Session["groupid"] = "ADMIN";
                    userSession.UserName = username;
                    userSession.GroupID = "ADMIN";
                    var listPermission = dao.GetListPermissions(username);
                    Session.Add(CommonConstants1.SESSION_PERMISSIONS, listPermission);
                    Session.Add(CommonConstants1.USER_SESSION, userSession);
                    return Redirect("~/Home/Index");

                }
                else if (result == 2)
                {
                    Session["groupid"] = "DOCTOR";
                    Session["username"] = username;
                    userSession.GroupID = "DOCTOR";
                    var listPermission = dao.GetListPermissions(username);
                    Session.Add(CommonConstants1.SESSION_PERMISSIONS, listPermission);
                    Session.Add(CommonConstants1.USER_SESSION, userSession);
                    return Redirect("~/Home/Index");
                }
                else ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
            }
            return View();
            
        }
        public ActionResult Logout()
        {
            Session["username"] = null;
            return Redirect("~/Home/Index");
        }
        
        public ActionResult Register()
        {
            List<UserGroup> ls = new List<UserGroup>();
            UserGroupDAO dao = new UserGroupDAO();
            return View(dao.ListGroup());
        }

        [HttpPost]
        public ActionResult Register(string username, string password, string repassword, string name, string email, string phone, string groupid)
        {
            List<UserGroup> ls = new List<UserGroup>();
            UserGroupDAO dao = new UserGroupDAO();
            if (ModelState.IsValid)
            {
                if(repassword != password)
                {
                    ModelState.AddModelError("", "Nhập lại mật khẩu không chính xác");
                }
                else
                {
                    User user = new User();
                    user.UserName = username;
                    user.Password = password;
                    user.Name = name;
                    user.GroupID = groupid;
                    user.Phone = phone;
                    user.Email = email;
                    UserDAO dao1 = new UserDAO();
                    dao1.Add(user);
                    return RedirectToAction("Login");
                }
            }

            return View(dao.ListGroup());

        }
    }
}