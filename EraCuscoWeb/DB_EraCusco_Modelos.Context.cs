﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EraCuscoWeb
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BD_EraCuscoEntities1 : DbContext
    {
        public BD_EraCuscoEntities1()
            : base("name=BD_EraCuscoEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Adopcion> Adopcion { get; set; }
        public virtual DbSet<Mascota> Mascota { get; set; }
        public virtual DbSet<Solicitud> Solicitud { get; set; }
        public virtual DbSet<UsuarioAdoptante> UsuarioAdoptante { get; set; }
        public virtual DbSet<UsuarioAlbergue> UsuarioAlbergue { get; set; }
    }
}