using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tienda
{
    public class GBDatos
    {         // Gestion Base Datos

        #region ATRIBUTOS
        private SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaOnlineConnectionString"].ConnectionString); // usando la ConnectionString del Web.config
        private SqlCommand comando; // representa a un procedimiento almacenado o una instrucción SELECT de Transact-SQL que se establece como la propiedad SelectCommand de SqlDataAdapter.
        private SqlDataAdapter adaptador; // Inicializa una nueva instancia de la clase SqlDataAdapter con una propiedad SelectCommand y un objeto SqlConnection.
        private DataSet contenido; // conjunto de datos, colección de datos habitualmente tabulada. Representa una caché de datos en memoria.
        private DataTable tabla;

        #region Encapsulado
        public SqlConnection Conexion { get => conexion; set => conexion = value; }
        public SqlCommand Comando { get => comando; set => comando = value; }
        public SqlDataAdapter Adaptador { get => adaptador; set => adaptador = value; }
        public DataSet Contenido { get => contenido; set => contenido = value; }
        public DataTable Tabla { get => tabla; set => tabla = value; }
        #endregion
        #endregion

        #region CONSTRUCTORES

        #endregion

        #region CRUD USUARIO ADMIN
        public bool CrearUsuario(string nombre, string apellido, string email, string contraseña)
        {
            bool ok = true;

            // Crear la Query SQL
            string query = "INSERT INTO USUARIO VALUES (@nombre, @apellido, @email, @contraseña)";

            // Crear el Comando y asignar la cadena de conexion 
            Comando = new SqlCommand(query, Conexion);

            // Crear Parámetro
            SqlParameter nomb = new SqlParameter("@nombre", SqlDbType.VarChar, 50);
            SqlParameter apell = new SqlParameter("@apellido", SqlDbType.VarChar, 50);
            SqlParameter mail = new SqlParameter("@email", SqlDbType.VarChar, 50);
            SqlParameter contras = new SqlParameter("@contraseña", SqlDbType.VarChar, 50);

            // Agregar el parametro al comando
            Comando.Parameters.Add(nomb);
            Comando.Parameters.Add(apell);
            Comando.Parameters.Add(mail);
            Comando.Parameters.Add(contras);

            try
            {
                // Abrir la Conexion
                Conexion.Open();

                // Asignar un valor al parámetro
                Comando.Parameters["@nombre"].Value = nombre;
                Comando.Parameters["@apellido"].Value = apellido;
                Comando.Parameters["@email"].Value = email;
                Comando.Parameters["@contraseña"].Value = contraseña;

                // Ejecutar el Comando
                Comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                ok = false;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }

        public DataTable ObtenerUsuario(int id)
        {
            Comando = new SqlCommand("spUsuarioObtener", Conexion)
            {
                CommandType = CommandType.StoredProcedure
            };
            Comando.Parameters.Add("@Id_Usuario", SqlDbType.Int).Value = id;
            Tabla = GenerarDataTable(Comando);
            return Tabla;
        }

        public bool ActualizarUsuario(int id, string nombre, string apellido, string email, string contraseña)
        {
            bool ok = true;

            // Decalarar el comando con procedimiento almacenado y cadana deconexion
            Comando = new SqlCommand("spUsuarioActualizar", Conexion)
            {
                CommandType = CommandType.StoredProcedure
            }; 

            // Declarar Parametros del comando y asignar valor
            Comando.Parameters.Add("@Id_Usuario", SqlDbType.Int).Value = id;
            Comando.Parameters.Add(new SqlParameter("@Nombre", SqlDbType.VarChar, 50)).Value = nombre; // = VARCHAR(50)
            Comando.Parameters.Add(new SqlParameter("Apellido", SqlDbType.VarChar, 50)).Value = apellido;
            Comando.Parameters.Add(new SqlParameter("Email", SqlDbType.VarChar, 50)).Value = email;
            Comando.Parameters.Add(new SqlParameter("Contraseña", SqlDbType.VarChar, 50)).Value = contraseña;

            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                ok = false;
                //throw;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }

        public bool VerificarUsuario(string usr, string clv)
        {
            string query = "SELECT * FROM USUARIO WHERE Email='" + usr + "' AND Contraseña ='" + clv + "'";
            Tabla = GenerarDataTable(query);

            if (Tabla.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        #region CRUD PRODUCTO
        public bool CrearProducto(string nombre, string descripcion, string precio, string stock, string marca, string categoria)
        {
            bool ok = true;
            string query = "INSERT INTO PRODUCTO (Nombre, Descripcion, Precio_Venta, Stock_Actual, Id_Marca, Id_Categoria) VALUES ('" + nombre + "','" + descripcion + "'," + precio + "," + stock + "," + marca + "," + categoria + ")";
            Comando = new SqlCommand(query, Conexion);
            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch
            {
                ok = false;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }

        public DataTable ObtenerProducto(string id)
        {
            string query = "Select * From Producto Where Id_Producto = " + id;
            Tabla = GenerarDataTable(query);
            return Tabla;
        }

        public bool ActualizarProducto(string id, string nombre, string descripcion, string precio, string stock, string marca, string categoria)
        {
            bool ok = true;
            string query = "UPDATE PRODUCTO SET Nombre ='" + nombre + "', Descripcion = '" + descripcion + "', Precio_Venta = " + precio + ", Stock_Actual= " + stock + ", Id_Marca = " + marca + ", Id_Categoria = " + categoria + " WHERE Id_Producto =" + id;
            Comando = new SqlCommand(query, Conexion);
            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch
            {
                ok = false;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }

        public bool EliminarProducto(string id)
        {
            bool ok = true;
            string query = "DELETE FROM PRODUCTO WHERE Id_Producto =" + id;
            Comando = new SqlCommand(query, Conexion);
            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch
            {
                ok = false;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }
        #endregion

#region CRUD MARCA
        public bool CrearMarca(string marca)
        {
            bool ok = true;
            Comando = new SqlCommand("spMarcaCrear", Conexion)
            {
                CommandType = CommandType.StoredProcedure
            };
            Comando.Parameters.AddWithValue("@Marca", marca);

            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch (Exception)
            {
                ok = false;
            }
            finally
            {
                Conexion.Close();
            }
            return ok;
        }

        public DataSet ObtenerMarcas()
        {
            string query = "SELECT * FROM MARCA ORDER BY Marca ASC";
            Contenido = GenerarDataSet(query);
            return Contenido;
        }
        #endregion

        #region CRUD CATEGORIA
        public DataSet ObtenerCategoria()
        {
            string query = "SELECT * FROM CATEGORIA ORDER BY Categoria ASC";
            Contenido = GenerarDataSet(query);
            return Contenido;
        }
        #endregion

        #region Métodos Privados
        private DataSet GenerarDataSet(string query)
        {
            Comando = new SqlCommand(query, Conexion);
            Adaptador = new SqlDataAdapter(Comando);
            Contenido = new DataSet();
            try
            {
                Conexion.Open();
                Adaptador.Fill(Contenido);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Conexion.Close();
                Adaptador.Dispose(); // limpia el DataAdapter...
            }
            return Contenido;
        }

        private DataTable GenerarDataTable(string query)
        {
            Comando = new SqlCommand(query, Conexion);
            Adaptador = new SqlDataAdapter(Comando);
            Tabla = new DataTable();
            try
            {
                Conexion.Open();
                Adaptador.Fill(Tabla);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Conexion.Close();
                Adaptador.Dispose();
            }
            return Tabla;
        }

        // recibe un comando con procedimiento almacenado
        private DataTable GenerarDataTable(SqlCommand spQuery)
        {
            Adaptador = new SqlDataAdapter(spQuery);
            Tabla = new DataTable();
            try
            {
                Conexion.Open();
                Adaptador.Fill(Tabla);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Conexion.Close();
                Adaptador.Dispose();
            }
            return Tabla;
        }
        #endregion

        /*
        * Todos los tipos y miembros de tipo tienen un nivel de accesibilidad que controla si se pueden usar desde otro código del ensamblado u otros 
        * ensamblados. Use los modificadores de acceso siguientes para especificar la accesibilidad de un tipo o miembro cuando lo declare:
        * 
        ** public: Puede obtener acceso al tipo o miembro cualquier otro código del mismo ensamblado o de otro ensamblado que haga referencia a éste.
        ** private: solamente el código de la misma class o struct puede acceder al tipo o miembro.
        ** protected: solamente el código de la misma class, o bien de una class derivada de esa class, puede acceder al tipo o miembro.
        ** internal: Puede obtener acceso al tipo o miembro cualquier código del mismo ensamblado, pero no de un ensamblado distinto.
        ** protected internal: cualquier código del ensamblado en el que se ha declarado, o desde una class derivada de otro ensamblado, puede acceder al tipo o miembro.
        ** private protected: el código de la misma class, o de un tipo derivado de esa class, puede acceder al tipo o miembro solo dentro de su ensamblado de declaración.
         */
    }
}