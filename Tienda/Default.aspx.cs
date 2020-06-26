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

            }
        }

        protected void BtnCrearCuenta_Click(object sender, EventArgs e)
        {
            CrearCuenta();
        }

        public void CrearCuenta()
        {
            GestionBaseDatos datos = new GestionBaseDatos();
            bool ok = datos.CrearUsuario(this.TBNombreUsuario.Text.Trim(), this.TBApellido.Text.Trim(), this.TBEmail.Text.Trim(), this.TBContraseña.Text.Trim());
            if (ok)
            {

            }
            else
            {

            }
        }
    }
}