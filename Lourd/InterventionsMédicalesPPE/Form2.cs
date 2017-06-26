using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Dapper;
using System.Windows.Forms;

namespace InterventionsMédicalesPPE
{
    public partial class Form2 : Form
    {
        public Form2(int idIntervention)
        {
            InitializeComponent();
            idInter = idIntervention;
        }

        sqlQuerry sql = new sqlQuerry();
        public int idInter = 0;
        public int idPatient = 0;

        // Affiche le personnel dans le listView1
        private void afficherPersMed()
        {
            listView1.Items.Clear();
            comboBoxPoste.ValueMember = "pos_id";

            string querryAfficherPersMed = "SELECT * FROM personnelMedical WHERE pem_posteId = @idposte";

            int idposte = Convert.ToInt32(comboBoxPoste.SelectedValue);

            //retrait du personnel présent dans la listview2 :
            for (int i = 0; i < listView2.Items.Count; i++)
            {
                querryAfficherPersMed += " and pem_id <> " + listView2.Items[i].Tag.ToString();
            }

            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<personnelMedical> pers = connection.Query<personnelMedical>((querryAfficherPersMed), new { idposte }); // envoyer la requete et la stocker dans pers

                //pour chaque personnel medical dans pers
                foreach (personnelMedical pem in pers)
                {
                    string[] arrayInter = new string[] { pem.pem_nom, pem.pem_prenom };
                    ListViewItem itm;
                    itm = new ListViewItem(arrayInter);
                    itm.Tag = pem.pem_id;
                    listView1.Items.Add(itm);
                }//Affichage du nom et prénom

            }
        }

        // Initialise les comboBoxes
        private void setComboBoxes()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<salleIntervention> salle = connection.Query<salleIntervention>("SELECT * FROM salleIntervention ORDER BY sai_libelle");
                IEnumerable<typeIntervention> typeInt = connection.Query<typeIntervention>("SELECT * FROM typeIntervention ORDER BY tin_libelle");
                IEnumerable<poste> poste = connection.Query<poste>("SELECT * FROM poste ORDER BY pos_libelle");


                //J'utilise les Datatables : salle et typeInt
                ComboBoxSalle.DataSource = salle;
                ComboBoxTypeInterv.DataSource = typeInt;

                foreach (salleIntervention sai in salle)
                {
                    //J'associe un ID à ce que j'affiche (libelle)
                    ComboBoxSalle.ValueMember = "sai_id";
                    ComboBoxSalle.DisplayMember = "sai_libelle";
                }

                foreach (typeIntervention tin in typeInt)
                {
                    //J'associe un ID à ce que j'affiche (libelle)
                    ComboBoxTypeInterv.ValueMember = "tin_id";
                    ComboBoxTypeInterv.DisplayMember = "tin_libelle";
                }

                comboBoxPoste.DataSource = poste;
                foreach (poste pos in poste)
                {
                    comboBoxPoste.ValueMember = "pos_id";
                    comboBoxPoste.DisplayMember = "pos_libelle";
                }
            }
        }

        private void setPatient()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<interventionMedicale> idpatient = connection.Query<interventionMedicale>(("select int_patId from interventionMedicale where int_id = @idInter"), new { idInter });
                foreach (interventionMedicale inter in idpatient)
                {
                    idPatient = inter.int_patId;
                    IEnumerable<patient> patnom = connection.Query<patient>(("select pat_nom, pat_prenom from patient where pat_id = @idPatient"), new { idPatient });
                    foreach (patient pat in patnom)
                    {
                        labelPatient.Text = pat.pat_nom + " " +pat.pat_prenom;
                    }
                }
            }
        }

        private void afficherPersMedParticipant()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                if (idInter != 0)
                {

                    string querryAfficherPersMed = "SELECT pem_id, pem_nom, pem_prenom, pem_posteId FROM personnelMedical where 0=1 ";
                    string querryAfficherPersMedOrder = " order by pem_posteId, pem_nom, pem_prenom";


                    IEnumerable<personnelIntervention> Pers = connection.Query<personnelIntervention>(("select * from personnelIntervention where intervention_id = @interventionId"), new { interventionId = idInter });
                    foreach (personnelIntervention pers in Pers)
                    {
                        querryAfficherPersMed += " or pem_id = " + pers.personnelMedical_id;
                    }

                    IEnumerable<personnelMedical> persMedi = connection.Query<personnelMedical>(querryAfficherPersMed + querryAfficherPersMedOrder);
                    foreach (personnelMedical pem in persMedi)
                    {
                        string pemPosteId = pem.pem_posteId.ToString();
                        IEnumerable<poste> post = connection.Query<poste>(("SELECT * FROM poste WHERE pos_id = @pemPosteId"), new { pemPosteId });
                        foreach (poste pos in post)
                        {
                            string[] arrayPersMedParticipant = new string[] { pem.pem_nom, pem.pem_prenom, pos.pos_code };
                            ListViewItem itm;
                            itm = new ListViewItem(arrayPersMedParticipant);
                            itm.Tag = pem.pem_id;
                            listView2.Items.Add(itm);
                        }
                    }
                }
                else
                {
                    //erreure
                }
            }
        }

        private void pickComboBoxes()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<interventionMedicale> intMedi = connection.Query<interventionMedicale>(("select int_type, int_salleId from interventionMedicale where int_id = @idInter"), new { idInter });
                foreach (interventionMedicale inter in intMedi)
                {
                    IEnumerable<salleIntervention> salle = connection.Query<salleIntervention>(("SELECT * FROM salleIntervention where sai_id = @salleid"), new { salleid = inter.int_salleId });
                    IEnumerable<typeIntervention> typeInt = connection.Query<typeIntervention>(("SELECT * FROM typeIntervention where tin_id = @typeid"), new { typeid = inter.int_type});

                    foreach (salleIntervention sai in salle)
                    {
                        ComboBoxSalle.SelectedIndex = ComboBoxSalle.FindStringExact(sai.sai_libelle);
                    }

                    foreach (typeIntervention tin in typeInt)
                    {
                        ComboBoxTypeInterv.SelectedIndex = ComboBoxTypeInterv.FindStringExact(tin.tin_libelle);
                    }
                }

            }
        }

        private void setDateTimePickers()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<interventionMedicale> intMedi = connection.Query<interventionMedicale>(("select int_date, int_heureEntree, int_heureSortie from interventionMedicale where int_id = @idInter"), new { idInter });
                foreach (interventionMedicale inter in intMedi)
                {
                    dateTimePickerDate.Value = inter.int_date; 
                    dateTimePickerHeure.Value = Convert.ToDateTime(inter.int_heureEntree.ToString());
                    dateTimePickerHeureFin.Value = Convert.ToDateTime(inter.int_heureEntree.ToString());
                }
                }
        }


        private void Form2_Load(object sender, EventArgs e)
        {
            setComboBoxes();
            afficherPersMedParticipant();
            afficherPersMed();
            setPatient();
            pickComboBoxes();
            setDateTimePickers();
        }

        private void AjouterButton_Click(object sender, EventArgs e)
        {

            if (listView1.SelectedItems.Count == 1)
            {
                string selectedId = listView1.SelectedItems[0].Tag.ToString();


                using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
                {
                    IEnumerable<personnelMedical> persMedi = connection.Query<personnelMedical>(("SELECT * FROM personnelMedical WHERE pem_id = @selectedId ORDER BY pem_nom"), new { selectedId });


                    foreach (personnelMedical pem in persMedi)
                    {
                        string pemPosteId = pem.pem_posteId.ToString();
                        IEnumerable<poste> post = connection.Query<poste>(("SELECT * FROM poste WHERE pos_id = @pemPosteId"), new { pemPosteId });

                        foreach (poste pos in post)
                        {
                            string[] arrayInter = new string[] { pem.pem_nom, pem.pem_prenom, pos.pos_code };
                            ListViewItem itm;
                            itm = new ListViewItem(arrayInter);
                            itm.Tag = pem.pem_id;
                            listView2.Items.Add(itm);
                        }
                    }
                }

                afficherPersMed();


            }
            else
            {
                MessageBox.Show("Personne n'a été selectionné.", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void RetirerButton_Click(object sender, EventArgs e)
        {
            if (listView2.SelectedItems.Count >= 1)
            {
                for (int x = listView2.SelectedIndices.Count - 1; x >= 0; x--)
                {
                    int idx = listView2.SelectedIndices[x];
                    listView2.Items.RemoveAt(idx);
                }
                afficherPersMed();
            }
            else
            {
                MessageBox.Show("Personne n'a été selectionné.", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }

        private void buttonValider_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Etes vous sûr de vouloir modifier cette intervention ?", "Etes vous sûr ?", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                bool err = false;
                string erreur = "";

                if (listView2.Items.Count == 0)
                {
                    err = true;
                }

                if (err) //Si il y a une erreur
                {
                    erreur = "Vous n'avez pas sélectionné de personnel.";
                    MessageBox.Show(erreur, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    //Je récupère les données "date et heure"
                    DateTime dateInter = dateTimePickerDate.Value;
                    string heureInter = dateTimePickerHeure.Text.ToString() + ":00";

                    //Je récupère l'ID de chaque champs selectionné en fonction de son libelle et l'id du patient
                    int typeId = Convert.ToInt32(ComboBoxTypeInterv.SelectedValue);
                    int salleId = Convert.ToInt32(ComboBoxSalle.SelectedValue); ;
                    int patId = idPatient;

                    using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
                    {
                        //suppression de l'intervention
                        connection.Query((sql.supprimerPersonnelIntervention), new { idInter });
                        connection.Query((sql.supprimerIntervention), new { idInter });

                        //création d'une nouvelle intervention
                        var intId = connection.Query<int>(sql.CreationIntervention, new { dateInter, heureInter, typeId, salleId, patId }).Single();
                        for (int i = 0; i < listView2.Items.Count; i++)
                        {
                            int persId = Convert.ToInt32(listView2.Items[i].Tag);
                            connection.Execute((sql.CreationInterventionPatient), new { intId, persId });
                        }
                    }
                    MessageBox.Show("Intervention Modifiée !", "Felicitation", MessageBoxButtons.OK);
                    Form1 form1 = new Form1();
                    form1.Show();
                    this.Hide();

                }
            }
            else
            {
                MessageBox.Show("L'intervention n'a pas été modifiée", "Intervention non modifiée", MessageBoxButtons.OK);
            }
        }

        private void listView2_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            RetirerButton_Click(this, new EventArgs());
        }

        private void listView1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            AjouterButton_Click(this, new EventArgs());
        }

        private void comboBoxPoste_SelectedIndexChanged(object sender, EventArgs e)
        {
            afficherPersMed();
        }

    }
}
