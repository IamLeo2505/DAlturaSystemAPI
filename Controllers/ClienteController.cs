using Microsoft.AspNetCore.Mvc;

namespace D_AlturaSystemAPI.Controllers
{
    public class ClienteController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
