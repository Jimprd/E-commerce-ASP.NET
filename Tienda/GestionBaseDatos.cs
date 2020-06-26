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

        public bool CrearUsuario(string nombre, string apellido, string email, string contraseña)
        {
            bool ok = true;

            try
            {
                string query = "INSERT INTO USUARIO VALUES ('" + nombre + "','" + apellido + "','" + email + "','" + contraseña + "')";
                conexion.Open();
                comando = new SqlCommand(query, conexion);
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception)
            {

                ok = false;
            }

            return ok;
        }





        public bool CrearProducto(string nombre, string descripcion, string precio, string stock)
        {
            bool ok = true;
            /*Procedimiento Almacenado
            * InsertarProducto
            * @Nombre = 'Perro4', @Descripcion = 'Es marron', @Precio_Venta = 300.05, @Stock_Actual = 5
            */
            try
            {
                string query = "INSERT INTO PRODUCTO VALUES ('" + nombre + "','" + descripcion + "'," + precio + "," + stock + ")";
                conexion.Open();
                comando = new SqlCommand(query, conexion);
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
            comando = new SqlCommand(query, conexion);
            adaptador = new SqlDataAdapter(comando);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            conexion.Close();
            adaptador.Dispose(); // limpia el adaptador
            return tabla;
        }

        public bool ActualizarProducto(string id, string nombre, string descripcion, string precio, string stock)
        {
            bool ok = true;
            try
            {
                string query = "UPDATE PRODUCTO SET Nombre ='" + nombre + "', Descripcion = '" + descripcion + "', Precio_Venta = " + precio + ", Stock_Actual= " + stock + " WHERE Id_Producto =" + id;
                conexion.Open();
                comando = new SqlCommand(query, conexion);
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch
            {
                ok = false;
            }
            return ok;
        }

        public bool EliminarProducto(string id)
        {
            bool ok = true;
            try
            {
                string query = "DELETE FROM PRODUCTO WHERE Id_Producto =" + id;
                conexion.Open();
                comando = new SqlCommand(query, conexion);
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch
            {
                ok = false;
            }
            return ok;
        }

        public DataSet ObtenerMarcas()
        {
            string query = "SELECT * FROM MARCA";
            conexion.Open();
            comando = new SqlCommand(query, conexion);
            adaptador = new SqlDataAdapter(comando);
            contenido = new DataSet();
            adaptador.Fill(contenido);
            comando.ExecuteNonQuery();
            conexion.Close();
            return contenido;
        }
    }
}