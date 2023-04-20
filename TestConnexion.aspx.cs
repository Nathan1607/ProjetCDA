using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetEurial
{
    public partial class TestConnexion : System.Web.UI.Page
    {
        private object txtName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                /*string name = ((TextBox)txtName).Text;*/
                string name = "nathan"
                SaveNameToJson(name);

                lblMessage.InnerText = "Le nom a été enregisré avec succès";
            }
            else
            {
                lblMessage.InnerText = "Le nom n'a pas été enregistrer";
            }
        }

        protected void SaveNameToJson(string name)
        {
            Person person = new Person { Name = name };

            string json = JsonConvert.SerializeObject(person);

            string filePath = @"C:\Users\Shadow\Documents\ProjetEurial\ProjetEurial\user.json";
            File.WriteAllText(filePath, json);
        }

        public class Person
        {
            public string Name { get; set; }
        }

        
    }
}