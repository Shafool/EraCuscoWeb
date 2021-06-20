<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Adopciones.aspx.cs" Inherits="EraCuscoWeb.Admin.Adopciones" %>

<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
Adopciones
</asp:Content>

<asp:Content ID="Descripcion" ContentPlaceHolderID="Descripcion" runat="server">
Aquí podrás gestionar las adopciones realizadas y registrar nuevas adopciones de las mascotas
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--Botonera y acciones--%>
    <div class="d-flex flex-wrap justify-content-center">  

        <asp:Linkbutton id="btNuevaAdopcion" runat="server" class="btn btn-primary mx-1">
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
            <asp:GridView id="gridView" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>