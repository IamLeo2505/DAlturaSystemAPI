using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using D_AlturaSystemAPI.Modelos;

using System.Data;
using System.Data.SqlClient;


namespace D_AlturaSystemAPI.Controllers
{ 
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : Controller
    {
        private readonly string ConnectSQL;

        public ProductoController(IConfiguration configuration)
        {
            ConnectSQL = configuration.GetConnectionString("ConnectSQL");
        }


        [HttpGet]
        [Route("Listado")]
        public IActionResult Lista()
        {
            List<Producto> listado = new List<Producto>();

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_lista_productos", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            listado.Add(new Producto()
                            {
                                idproducto = Convert.ToInt32(rd["idproducto"]), 
                                codigo = Convert.ToInt32(rd["codigo"]),
                                nombre = rd["nombre"].ToString(),
                                descripcion = rd["descripcion"].ToString(),
                                f_ingreso = Convert.ToDateTime(rd["f_ingreso"]),
                                f_vencimiento = Convert.ToDateTime(rd["f_vencimiento"]),
                                stock = Convert.ToInt32(rd["stock"]),
                                precio_compra = Convert.ToDecimal(rd["precio_compra"]),
                                precio_venta = Convert.ToDecimal(rd["precio_venta"]),
                                estado = rd["estado"].ToString()

                            });
                        }
                    }

                }
                {

                }
                return StatusCode(StatusCodes.Status200OK, new { message = "ok", response = listado });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message, response = listado });
            }
        }

        [HttpGet]
        [Route("Obtener/{idproducto:int}")]

        public IActionResult Obtener(int idproducto)
        {
            List<Producto> listado = new List<Producto>();
            Producto producto = new Producto();

            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_lista_productos", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            listado.Add(new Producto()
                            {
                                idproducto = Convert.ToInt32(rd["idproducto"]),
                                codigo = Convert.ToInt32(rd["codigo"]),
                                nombre = rd["nombre"].ToString(),
                                descripcion = rd["descripcion"].ToString(),
                                f_ingreso = Convert.ToDateTime(rd["f_ingreso"]),
                                f_vencimiento = Convert.ToDateTime(rd["f_vencimiento"]),
                                stock = Convert.ToInt32(rd["stock"]),
                                precio_compra = Convert.ToDecimal(rd["precio_compra"]),
                                precio_venta = Convert.ToDecimal(rd["precio_venta"]),
                                estado = rd["estado"].ToString()

                            });
                        }
                    }

                }
                producto = listado.Where(item => item.idproducto == idproducto).FirstOrDefault();
                return StatusCode(StatusCodes.Status200OK, new { message = "ok", response = listado });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message, response = listado });
            } 
        }

        [HttpPost]
        [Route("Guardar")]

        public IActionResult Guardar([FromBody] Producto objeto)
        {
            
            try
            {

                using (var connection = new SqlConnection(ConnectSQL))
                {
                    connection.Open();
                    var cmd = new SqlCommand("pA_guardar_productos", connection);
                    cmd.Parameters.AddWithValue("codigo", objeto.codigo);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var rd = cmd.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            listado.Add(new Producto()
                            {
                                idproducto = Convert.ToInt32(rd["idproducto"]),
                                codigo = Convert.ToInt32(rd["codigo"]),
                                nombre = rd["nombre"].ToString(),
                                descripcion = rd["descripcion"].ToString(),
                                f_ingreso = Convert.ToDateTime(rd["f_ingreso"]),
                                f_vencimiento = Convert.ToDateTime(rd["f_vencimiento"]),
                                stock = Convert.ToInt32(rd["stock"]),
                                precio_compra = Convert.ToDecimal(rd["precio_compra"]),
                                precio_venta = Convert.ToDecimal(rd["precio_venta"]),
                                estado = rd["estado"].ToString()

                            });
                        }
                    }

                }
                producto = listado.Where(item => item.idproducto == idproducto).FirstOrDefault();
                return StatusCode(StatusCodes.Status200OK, new { message = "ok", response = listado });

            }
            catch (Exception error)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = error.Message, response = listado });
            }
        }
    }
}
