using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using System.Windows.Forms;
using Newtonsoft.Json;


namespace ProjetEurial
{
    public partial class Data : System.Web.UI.Page
    {
        string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=Test_Eurial;Integrated Security=True";
        private string filePathUser = "user.json";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData(new bool[] { true, true, true, true, true, true});
            }
        }

        protected void CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            bool[] showColumns = new bool[] { CheckBox1.Checked, CheckBox2.Checked, CheckBox3.Checked, CheckBox4.Checked, CheckBox5.Checked, CheckBox6.Checked };
            BindData(showColumns);
        }

        private void BindData(bool[] showColumns)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=Test_Eurial;Integrated Security=True";

            string query = "SELECT ";

            bool isFirst = true;
            for (int i = 0; i < showColumns.Length; i++)
            {
                if (showColumns[i])
                {
                    if (!isFirst)
                    {
                        query += ", ";
                    }

                    switch (i)
                    {
                        case 0:
                            query += "id";
                            break;
                        case 1:
                            query += "name";
                            break;
                        case 2:
                            query += "email";
                            break;
                        case 3:
                            query += "phone";
                            break;
                        case 4:
                            query += "address";
                            break;
                        case 5:
                            query += "created_at";
                            break;
                    }

                    isFirst = false;

                }
            }

            query += " FROM clients";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open ();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                GridView1.DataSource = table;
                GridView1.DataBind();

                connection.Close();
            }
        }


        protected void ExportButton_Click(object sender, EventArgs e)
        {
            // Spécifier les informations de connexion à la base de données
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=Test_Eurial;Integrated Security=True";

            // Spécifier le nom de la table à exporter
            string tableName = "clients";

            // Spécifier le nom du fichier CSV de destination
            string fileName = "C:\\TMP\\myData.csv";

            // Appeler la fonction d'exportation des données dans un fichier CSV
            ExportDataToCsv(tableName, connectionString, fileName);

            // Télécharger le fichier CSV généré
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.TransmitFile(fileName);
            Response.End();
        }

        public void ExportDataToCsv(string tableName, string connectionString, string fileName)
        {
        // Ouvrir la connexion à la base de données
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Créer la requête SQL pour récupérer toutes les données de la table spécifiée
            string query = "SELECT * FROM " + tableName;

            // Exécuter la requête et récupérer les données dans un DataReader
            using (SqlCommand command = new SqlCommand(query, connection))
            using (SqlDataReader reader = command.ExecuteReader())
            {
                // Ouvrir le fichier en écriture
                using (StreamWriter writer = new StreamWriter(fileName))
                {
                    // Écrire les noms de colonnes dans le fichier
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        writer.Write(reader.GetName(i));

                        // Ajouter une virgule si ce n'est pas la dernière colonne
                        if (i < reader.FieldCount - 1)
                        {
                            writer.Write(",");
                        }
                    }

                    // Passer à la ligne suivante
                    writer.WriteLine();

                    // Écrire les données dans le fichier
                    while (reader.Read())
                    {
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            // Échapper les virgules dans les données
                            string data = reader.GetValue(i).ToString().Replace(",", "\\,");

                            writer.Write(data);

                            // Ajouter une virgule si ce n'est pas la dernière colonne
                            if (i < reader.FieldCount - 1)
                            {
                                writer.Write(",");
                            }
                        }

                        // Passer à la ligne suivante
                        writer.WriteLine();
                    }
                    }
                }
            }
        }

        


        

    }
}