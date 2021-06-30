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
        Dictionary<string, int> etapas = new Dictionary<string, int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            etapas.Add("Bebe", 1);
            etapas.Add("Joven", 2);
            etapas.Add("Adulto", 3);
            etapas.Add("Anciano", 4);

            /*
            if (!IsPostBack)
            {

            }*/
        }

        public JArray obtenerMascotas()
        {
            List<Mascota> listaMascotas = new List<Mascota>();
            JArray jsonMascotas = new JArray(); // Por defecto se tiene una lista vacia

            using (Entidades datos = new Entidades())
            {
                listaMascotas = datos.Mascota.ToList();

                for (int i = 0; i < listaMascotas.Count; i++)
                {
                    Mascota m = listaMascotas[i];
                    JObject mascota = new JObject(
                        new JProperty("id", m.id),
                        new JProperty("nombre", m.nombre),
                        new JProperty("descripcion", m.descripcion),
                        new JProperty("etapaVida", m.etapaVida),
                        new JProperty("fechaRegistro", m.fechaRegistro),
                        new JProperty("tipo", m.tipo),
                        new JProperty("raza", m.raza),
                        new JProperty("estado", m.estado),
                        new JProperty("rutaFoto", m.rutaFoto),
                        new JProperty("usuarioAlbergue", m.rutaFoto),
                        new JProperty("usuarioNombre", $"{m.UsuarioAlbergue1.nombre} " +
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

        protected void btConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            int codigo = int.Parse(tbCodigoEliminar.Text.Trim());
            using (Entidades datos = new Entidades())
            {
                Mascota m = datos.Mascota.Find(codigo);
                datos.Mascota.Remove(m);
                datos.SaveChanges();
            }
        }


        
        protected void btAgregarMascota_Click(object sender, EventArgs e)
        {
            string nombre = tbNombre.Text.Trim();
            string descripcion = tbDescripcion.Text.Trim();
            int etapaVida = ddEtapaVida.SelectedIndex + 1;
            string tipo = ddTipo.SelectedValue;
            string raza = tbRaza.Text.Trim();
            DateTime localDate = DateTime.Now;

            using (Entidades datos = new Entidades())
            {
                if (tbModo.Text == "editar")
                {
                    int codigo = int.Parse(tbId.Text.Trim());
                    Mascota m = datos.Mascota.Find(codigo);
                    if (m != null)
                    {
                        m.nombre = nombre;
                        m.descripcion = descripcion;
                        m.etapaVida = etapaVida;
                        m.fechaRegistro = localDate;
                        m.tipo = tipo;
                        m.raza = raza;
                        datos.SaveChanges();
                    }
                }
                else if (tbModo.Text == "crear")
                {
                    Mascota m = new Mascota();
                    m.nombre = nombre;
                    m.descripcion = descripcion;
                    m.etapaVida = etapaVida;
                    m.fechaRegistro = localDate;
                    m.tipo = tipo;
                    m.raza = raza;
                    m.estado = 1;
                    m.rutaFoto = "https://www.randomdoggiegenerator.com/randomdoggie.php";
                    m.usuarioAlbergue = 1;

                    datos.Mascota.Add(m);
                    datos.SaveChanges();

                }
            }
        }
    }
}