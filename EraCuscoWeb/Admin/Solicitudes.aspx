<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Solicitudes.aspx.cs" Inherits="EraCuscoWeb.Admin.Solicitudes" %>

<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    Solicitudes
</asp:Content>

<asp:Content ID="Descripcion" ContentPlaceHolderID="Descripcion" runat="server">
    Aquí podrás gestionar las adopciones realizadas y registrar nuevas adopciones de las mascotas
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>

    </script>

    <%--Botonera y acciones--%>
    <div class="d-flex flex-wrap justify-content-center">

        <asp:Linkbutton id="btNuevaSolicitud" runat="server" class="btn btn-primary mx-1">
            <i class="fas fa-plus"></i>
            Registrar una adopción
        </asp:Linkbutton>

        <asp:Linkbutton id="btActualizar" runat="server" class="btn btn-outline-primary mx-1">
            <i class="fas fa-sync-alt"></i>
            Actualizar lista
        </asp:Linkbutton>

        <div class="d-flex mx-1 col-md-4">
            <asp:TextBox id="tbBusqueda" runat="server" class="form-control me-sm-2" placeholder="Busca algo aquí"/>
            <asp:Linkbutton runat="server" class="btn btn-secondary" type="submit">
                <i class="fas fa-search"></i>
            </asp:Linkbutton>
        </div>

        <%--Tabla--%>
        <div class="d-flex flex-wrap justify-content-center">
            <div class="card p-3 my-5 carta">
                <table id="tbSolicitudes" class="table">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Mascota</th>
                            <th>Adoptante</th>
                            <th>DNI</th>
                            <th>Vivienda</th>
                            <th>Tiene otras mascotas</th>
                            <th>Esterilización</th>
                            <th>Fecha</th>

                            <th>Usuario adoptante</th>
                            <th>Solicitud</th>
                            <th>Trabajador</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- El Modal -->
        <div class="modal" id="modalAgregarMascota">
        <form>
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Agregar Mascota</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <!-- Modal body -->
              <div class="modal-body">
                
                    <div class="form-group row">
					    <label for="ddEspecie" class="col-sm-2 col-form-label">Tipo</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddEspecie" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="perro"> Perro </asp:ListItem>
							    <asp:ListItem Value="gato"> Gato </asp:ListItem>
                                <asp:ListItem Value="conejo"> Conejo </asp:ListItem>
                                <asp:ListItem Value="ave"> Ave </asp:ListItem>
                                <asp:ListItem Value="hamster"> Hamster </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
					<div class="form-group row">
						<label for="tbNombre" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-10">
                            <asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbNombre"
                                placeholder="Nombre de la mascota"></asp:TextBox>
						</div>
					</div>
					<div class="form-group row">
					    <label for="ddSexo" class="col-sm-2 col-form-label">Sexo</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddSexo" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="Hembra"> Hembra </asp:ListItem>
							    <asp:ListItem Value="Macho"> Macho </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
                    <div class="form-group row">
					    <label for="ddEtapaVida" class="col-sm-2 col-form-label">Etapa de vida</label>
					    <div class="col-sm-10">
						    <asp:DropDownList ID="ddEtapaVida" runat="server" class="col-sm-4 form-control" aria-label="Seleccion de sexo">
							    <asp:ListItem Selected="True" Value="bebe"> Bebé </asp:ListItem>
							    <asp:ListItem Value="joven"> Joven </asp:ListItem>
                                <asp:ListItem Value="adulto"> Adulto </asp:ListItem>
                                <asp:ListItem Value="adulto_mayor"> Adulto mayor </asp:ListItem>
						    </asp:DropDownList>
					    </div>
                    </div>
                    <div class="form-group row">
						<label for="tbRaza" class="col-sm-2 col-form-label">Raza</label>
						<div class="col-sm-10">
							<asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbRaza"
                                placeholder="Raza ejm. Cocker, Pastor Alemán, Angora..."></asp:TextBox>
						</div>
					</div>
                    <div class="form-group row">
						<label for="caFechaNacimiento" class="col-sm-2 col-form-label">Fecha. de Nacimiento</label>
						<div class="col-sm-10">
						    <input type="date" runat="server" ID="caFechaNacimiento"/>
                        </div>
					</div>
                    <div class="form-group row">
						<label for="tbDescripcion" class="col-sm-2 col-form-label">Descripción</label>
						<div class="col-sm-10">
							<asp:TextBox type="text" class="form-control" runat="server"
                                ID="tbDescripcion"
                                placeholder="Escriba una descripción de la mascota"></asp:TextBox>
						</div>
					</div>
                    <div class="form-group row">
						<label for="tbDescripcion" class="col-sm-2 col-form-label">Disponibilidad</label>
						<div class="col-sm-10">
                            <asp:RadioButton runat="server" GroupName="rbDisponibilidad" Text="Disponible"/>
                            <asp:RadioButton runat="server" GroupName="rbDisponibilidad" Text="No disponible"/>
                        </div>
                    </div>
                    
				
              </div>
              <!-- Modal footer -->
              <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button type="button" class="btn btn-success" ID="btAgregarMascota" runat="server" Text="Agregar Mascota" />
              </div>
            </div>
          </div>
        </form>
        </div>

        <%--Librería datatables--%>
        <script>
            $(document).ready(function () {
                $('#tbSolicitudes').DataTable();
            });
        </script>
    </div>
</asp:Content>