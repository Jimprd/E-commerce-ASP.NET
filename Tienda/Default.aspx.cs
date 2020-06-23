using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Tienda
{
    public partial class Default : System.Web.UI.Page
    {
        private SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-6H1TIS7\\SQLEXPRESS;Initial Catalog=TiendaOnline;Integrated Security=True"); //representa la conexión
        private SqlCommand comando = new SqlCommand(); // representa a un procedimiento almacenado o una instrucción SELECT de Transact-SQL que se establece como la propiedad SelectCommand de SqlDataAdapter.
        private SqlDataAdapter adaptador; // Inicializa una nueva instancia de la clase SqlDataAdapter con una propiedad SelectCommand y un objeto SqlConnection.
        private DataSet contenido = new DataSet(); // conjunto de datos, colección de datos habitualmente tabulada. Representa una caché de datos en memoria.

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // MostrarProductos(); //El GridView carga él solo los datos, por eso comenté esta linea. 
                VerMarcas();
            }
        }

        protected void BtnCrearCuenta_Click(object sender, EventArgs e)
        {
            conexion.Open();
            comando.CommandText = "INSERT INTO USUARIO VALUES ('" + TBNombreUsuario.Text.ToString().Trim() + "','" + TBApellido.Text.ToString().Trim() + "','" + TBEmail.Text.ToString().Trim() + "','" + TBContraseña.Text.ToString().Trim() + "')";
            comando.Connection = conexion;
            adaptador = new SqlDataAdapter(comando);
            contenido = new DataSet();
            adaptador.Fill(contenido); // Rellena un objeto DataSet o un objeto DataTable.
            comando.ExecuteNonQuery();
            conexion.Close();
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
           
            //MostrarProductos();
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            BorrarProducto();
            //MostrarProductos();
            VerMarcas();
        }


        #region MÉTODOS CRUD 



        public void MostrarProductos()
        {
            conexion.Open();
            comando.CommandText = "SELECT * FROM PRODUCTO";
            comando.Connection = conexion;
            adaptador = new SqlDataAdapter(comando);
            contenido = new DataSet(); // Se rellena con tablas de datos mediante DataAdapter.
            adaptador.Fill(contenido);
            comando.ExecuteNonQuery();
            //GVProductos.DataSource = contenido;
            //GVProductos.DataBind();
            conexion.Close();
        }

        public void ActualizarProducto()
        {
            /* https://docs.microsoft.com/es-es/office/vba/access/concepts/structured-query-language/insert-update-and-delete-records-from-a-table-using-access-sql#update-records-in-a-table */
            // comando.CommandText = "UPDATE PRODUCTO SET Nombre = 'pato' WHERE Nombre = 'H-34A Pirate /UH-34D U.S. Marines'" + TBNombre.Text.ToString() + "'";
            comando.CommandText = "UPDATE PRODUCTO SET Nombre = 'pato' WHERE Nombre = 'H-34A Pirate /UH-34D U.S. Marines'" + TBNombre.Text.ToString() + "'";
            comando.Connection = conexion;
            comando.ExecuteNonQuery(); // Ejecuta una instrucción de Transact-SQL en la conexión y devuelve el número de filas afectadas.
        }

        public void BorrarProducto()
        {
            comando.CommandText = "DELETE FROM PRODUCTO WHERE Nombre = '" + TBNombre.Text.ToString() + "'";
            comando.Connection = conexion;
            comando.ExecuteNonQuery();
            conexion.Close();
        }

        public void VerMarcas()
        {
            conexion.Open();
            comando.CommandText = "SELECT * FROM MARCA";
            comando.Connection = conexion;
            adaptador = new SqlDataAdapter(comando);
            contenido = new DataSet();
            adaptador.Fill(contenido);
            comando.ExecuteNonQuery();
            conexion.Close();

            CargarDDList(contenido, DDLMarcas, "Id_Marca", "Nombre");
        }

        /// <summary>
        /// Rellena un Drop Down List
        /// </summary>
        /// <param name="ds">DataSet con la fuente de datos para .DataSource </param>
        /// <param name="DDL">El Objeto de tipo Drop Down List a rellenar</param>
        /// <param name="valor">Propiedad .DataValueField del DDList</param>
        /// <param name="campo">Propiedad .DataTextField del DDList</param>
        private void CargarDDList(DataSet ds, DropDownList DDL, string valor, string campo)
        {
            DDL.DataSource = ds;
            DDL.DataValueField = valor;
            DDL.DataTextField = campo;
            DDL.DataBind(); // enlazar datos de un origen a un control de servidor, generalemtente después de recuperar un conjunto de datos a través de una consulta de base de datos. La mayoría de los controles lo hacen automáticamente, por lo que normalmente no es necesario llamarlo explícitamente.
            DDL.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }
        #endregion


    }
}