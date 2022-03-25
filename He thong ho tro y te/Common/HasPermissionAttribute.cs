using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Common;
namespace He_thong_ho_tro_y_te.Common
{
    public class HasPermissionAttribute : AuthorizeAttribute
    {
        public string RoleID { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[Common.CommonConstants1.USER_SESSION];
            //if (session == null)
            //{
            //    return false;
            //}

            List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.UserName); // Call another method to get rights of the user from DB

            if (privilegeLevels.Contains(this.RoleID) || session.GroupID == CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Areas/Admin/Views/Shared/Bug.cshtml"
            };
        }
        private List<string> GetCredentialByLoggedInUser(string userName)
        {
            var credentials = (List<string>)HttpContext.Current.Session[Common.CommonConstants1.SESSION_PERMISSIONS];
            return credentials;
        }
    }
}