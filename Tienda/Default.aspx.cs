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
            GBDatos datos = new GBDatos();
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