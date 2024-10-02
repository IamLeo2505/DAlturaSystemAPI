using D_AlturaSystemAPI.Modelos;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace D_AlturaSystemAPI.Controllers
{
    public class MarcaController : Controller
    {
        public IActionResult index()
        {
            return View();
        }
    }
}

