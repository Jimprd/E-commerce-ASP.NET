using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Tienda
{
    public class GestionBaseDatos
    {
        private SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-6H1TIS7\\SQLEXPRESS;Initial Catalog=TiendaOnline;Integrated Security=True"); //representa la conexión
        private SqlCommand comando; // representa a un procedimiento almacenado o una instrucción SELECT de Transact-SQL que se establece como la propiedad SelectCommand de SqlDataAdapter.
        private SqlDataAdapter adaptador; // Inicializa una nueva instancia de la clase SqlDataAdapter con una propiedad SelectCommand y un objeto SqlConnection.
        private DataSet contenido; // conjunto de datos, colección de datos habitualmente tabulada. Representa una caché de datos en memoria.


        public bool CrearProducto(string nombre, string descripcion, decimal precio, int stock)
        {
            bool ok = true;

            /*Procedimiento Almacenado
            * InsertarProducto
            * @Nombre = 'Perro4', @Descripcion = 'Es marron', @Precio_Venta = 300.05, @Stock_Actual = 5
            */
            try
            {
                conexion.Open();
                comando.CommandText = "INSERT INTO PRODUCTO VALUES ('" + nombre + "','" + descripcion + "'," + precio + "," + stock + ")";
                comando.Connection = conexion;
                comando.ExecuteNonQuery();

                conexion.Close();
            }
            catch
            {
                ok = false;
            }

            return ok;
        }

        public DataTable ObtenerProducto(string id)
        {
            string query = "Select * From Producto Where Id_Producto = " + id;
            conexion.Open();
            comando.CommandText = query;
            comando.Connection = conexion;
            adaptador = new SqlDataAdapter(comando);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            conexion.Close();
            adaptador.Dispose(); // limpia el adaptador

            return tabla;
        }

        public bool ActualizarProducto(string id, string nombre, string descripcion, decimal precio, int stock)
        {
            bool ok = true;

            try
            {
                conexion.Open();    // UPDATE PRODUCTO SET Nombre ='   pato'       , Descripcion = 'es naranja',Precio_Venta = 500,Stock_Actual= 7 WHERE Id_Producto =17
                comando.CommandText = "UPDATE PRODUCTO SET Nombre ='" + nombre + "', Descripcion = '" + descripcion + "', Precio_Venta = " + precio + ", Stock_Actual= " + stock + " WHERE Id_Producto =" + id;
                comando.Connection = conexion;
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch
            {
                ok = false;
            }

            return ok;
        }


    }
}