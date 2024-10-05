using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using D_AlturaSystemAPI.Modelos;

using System.Data;
using System.Data.SqlClient;

namespace D_AlturaSystemAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class DevolucionesController : Controller
    {

        private readonly string ConnectSQL, ConnectSQLTwo, ConnectSQLThree;

        public DevolucionesController(IConfiguration configuration)
        {
            ConnectSQL = configuration.GetConnectionString("ConnectSQL");
            ConnectSQLTwo = configuration.GetConnectionString("ConnectSQLTwo");
            ConnectSQLThree = configuration.GetConnectionString("ConnectSQLThree");
        }


        [HttpGet]
        [Route("Lista de Devoluciones")]
        public IActionResult Listado()
        {
            List<devolución> listado = new List<devolución>();

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_lista_devolucion", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            listado.Add(new devolución()
                            {
                                IdDevolución = Convert.ToInt32(rd["IdDevolución"]),
                                FechaDevolución = Convert.ToDateTime(rd["FechaDevolución"])
                                Motivo = rd["Motivo"].ToString()                              
                            });
                        }
                    }

                }
                return StatusCode(StatusCodes.Status200OK, new { message = "Correcto.", response = listado });
            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message, response = listado });
            }
        }


        [HttpGet]
        [Route("Obtener/{IdDevolución:int}")]

        public IActionResult Obtener(int IdDevolución)
        {          
            List<devolución> listado = new List<devolución>();
            devolución Devolución = new devolución();

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_lista_devolucion", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            listado.Add(new devolución()
                            {
                                IdDevolución = Convert.ToInt32(rd["IdDevolución"]),
                                FechaDevolución = Convert.ToDateTime(rd["FechaDevolución"])
                                Motivo = rd["Motivo"].ToString()
                            });
                        }
                    }

                }
                empleado = listado.Where(item => item.idempleado == idempleado).FirstOrDefault();
                return StatusCode(StatusCodes.Status200OK, new { message = "Correcto.", response = empleado });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message, response = empleado });
            }
        }

        [HttpPost]
        [Route("Guardar Cambios")]

        public IActionResult Guardar([FromBody] Empleado objeto)
        {

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_guardar_empleado", connection);
                    IdDevolución = Convert.ToInt32(rd["IdDevolución"]),
                    FechaDevolución = Convert.ToDateTime(rd["FechaDevolución"])
                    Motivo = rd["Motivo"].ToString(),
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }

                return StatusCode(StatusCodes.Status200OK, new { message = "Correcto." });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message });
            }
        }

        [HttpPut]
        [Route("EditarDatos")]

        public IActionResult EditarDatos([FromBody] Empleado objeto)
        {

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_editar_empleado", connection);
                    IdDevolución = Convert.ToInt32(rd["IdDevolución"]),
                    FechaDevolución = Convert.ToDateTime(rd["FechaDevolución"])
                                Motivo = rd["Motivo"].ToString(),
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }

                return StatusCode(StatusCodes.Status200OK, new { message = "Datos editados." });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message });
            }
        }

        [HttpDelete]
        [Route("EliminarDatos/{idempleado:int}")]

        public IActionResult EliminarDatos(int idempleado)
        {

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_eliminar_empleado", connection);
                    cmd.Parameters.AddWithValue("idempleado", idempleado);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }

                return StatusCode(StatusCodes.Status200OK, new { message = "Dato eliminado." });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message });
            }
        }
    }
}
