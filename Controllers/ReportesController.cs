using AspNetCore.Reporting;
using Microsoft.AspNetCore.Mvc;
using D_AlturaSystemAPI.Servicios;
using Microsoft.AspNetCore.Http;

namespace D_AlturaSystemAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportesController : ControllerBase
    {
        private readonly ServiciosBD serviceBD;

        public ReportesController(ServiciosBD serviciosBD)
        {
            serviceBD = serviciosBD;
        }

        [HttpGet("Proveedores")]

        public IActionResult ObtenerDatosProveedores()
        {
            var dt = serviceBD.ObtenerDatosProveedor();

            string path = Path.Combine(Directory.GetCurrentDirectory(), "Reportes", "Proveedores.rdlc");

            LocalReport report = new LocalReport(path);
            report.AddDataSource("dtProveedor", dt);

            var result = report.Execute(RenderType.Pdf);

            return File(result.MainStream, "application/pdf", "reporte.pdf");
        }
    }
}
