using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using He_thong_ho_tro_y_te.Models.DB;

namespace He_thong_ho_tro_y_te.Models.DAO
{
    public class CategoryDAO
    {
        YTeDbContext db;
        public CategoryDAO()
        {
            db = new YTeDbContext();
        }
        public List<Category> ListCate()
        {
            return db.Categories.ToList();
        }
        public Category getById(int id)
        {
            return db.Categories.Single(i => i.CategoryID == id);
        }
        public void Add(Category pro)
        {
            db.Categories.Add(pro);
            db.SaveChanges();

        }
        public void Edit(Category pro)
        {
            Category product = getById(pro.CategoryID);
            if (product != null)
            {
                product.CategoryName = pro.CategoryName;
                
                db.SaveChanges();
            }
        }
        public void Delete(int id)
        {
            Category pro = db.Categories.Find(id);
            if (pro != null)
            {
                db.Categories.Remove(pro);
                db.SaveChanges();
            }
        }
        public IEnumerable<Category> ListCategoryPage(string searchString, int Pagenum, int Pagesize)
        {
            IQueryable<Category> model = db.Categories;

            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.CategoryName.Contains(searchString) );
            }
            
            return model.OrderByDescending(x => x.CategoryID).ToPagedList(Pagenum, Pagesize);
        }
    }
}