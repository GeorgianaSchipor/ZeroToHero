using CocoFarm.DataAccess;
using CocoFarm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CocoFarm.Controllers
{
    public class CatalogProduseController : Controller
    {
        private IDataStore<Produs> store;
        public CatalogProduseController(IDataStore<Produs> store)
        {
            this.store = store;
        }

        public ActionResult Index()
        {
            IEnumerable<Produs> produse = store.GetAll();
            return View(produse);
        }

        public ActionResult Details(int id)
        {
            var produs = store.GetById(id);
            return View(produs);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Produs produs)
        {
            try
            {
                store.Create(produs);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Edit(int id)
        {
            var produs = store.GetById(id);
            return View(produs);
        }

        [HttpPost]
        public ActionResult Edit(Produs produs)
        {
            try
            {
                store.Update(produs);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(produs);
            }
        }

        public ActionResult Delete(int id)
        {
            var produs = store.GetById(id);
            return View();
        }

        [HttpPost]
        public ActionResult Delete(Produs produs)
        {
            try
            {
                store.Delete(produs.Id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
