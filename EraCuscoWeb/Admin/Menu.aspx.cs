using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EraCuscoWeb.Admin
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (!IsPostBack)
            {

            }*/
        }

        public JArray obtenerMascotas()
        {
            List<Mascota> listaMascotas = new List<Mascota>();
            JArray jsonMascotas = new JArray(); // Por defecto se tiene una lista vacia

            using (BD_EraCuscoEntities2 datos = new BD_EraCuscoEntities2())
            {
                listaMascotas = datos.Mascota.ToList();
               
                for(int i = 0; i < listaMascotas.Count; i++){
                    Mascota m = listaMascotas[i];


                    JObject mascota = new JObject(
                        new JProperty("id", m.id),
                        new JProperty("nombre", m.nombre),
                        new JProperty("descripcion", m.descripcion),
                        new JProperty("etapaVida", m.etapaVida),
                        new JProperty("fechaRegistro", m.fechaRegistro),
                        new JProperty("tipo", m.tipo + " - " + m.raza),
                        new JProperty("estado", m.estado),
                        new JProperty("rutaFoto", m.rutaFoto),
                        new JProperty("usuarioAlbergue",    $"{m.UsuarioAlbergue1.nombre} " +
                                                            $"{m.UsuarioAlbergue1.aPaterno} " +
                                                            $"{m.UsuarioAlbergue1.aMaterno}")
                                                            );
                    jsonMascotas.Add(mascota);
                }
            }
            return jsonMascotas;
        }

        protected void btNuevaMascota_Click(object sender, EventArgs e)
        {

        }
    }
}
