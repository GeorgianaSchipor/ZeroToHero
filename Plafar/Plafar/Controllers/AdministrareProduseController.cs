using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Plafar.Models;

namespace Plafar.Controllers
{
    public class AdministrareProduseController : Controller
    {
        private PlafarContext db = new PlafarContext();

        //
        // GET: /AdministrareProduse/

        public ActionResult Index()
        {
            return View(db.Produse.ToList());
        }

        //
        // GET: /AdministrareProduse/Details/5

        public ActionResult Details(int id = 0)
        {
            Produs produs = db.Produse.Find(id);
            if (produs == null)
            {
                return HttpNotFound();
            }
            return View(produs);
        }

        //
        // GET: /AdministrareProduse/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AdministrareProduse/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Produs produs)
        {
            if (ModelState.IsValid)
            {
                db.Produse.Add(produs);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(produs);
        }

        //
        // GET: /AdministrareProduse/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Produs produs = db.Produse.Find(id);
            if (produs == null)
            {
                return HttpNotFound();
            }
            return View(produs);
        }

        //
        // POST: /AdministrareProduse/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Produs produs)
        {
            if (ModelState.IsValid)
            {
                db.Entry(produs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(produs);
        }

        //
        // GET: /AdministrareProduse/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Produs produs = db.Produse.Find(id);
            if (produs == null)
            {
                return HttpNotFound();
            }
            return View(produs);
        }

        //
        // POST: /AdministrareProduse/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Produs produs = db.Produse.Find(id);
            db.Produse.Remove(produs);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}