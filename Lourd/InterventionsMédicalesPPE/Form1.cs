using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Dapper;

namespace InterventionsMédicalesPPE
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();


        }

        sqlQuerry sql = new sqlQuerry();

        //classe pour comboboxItem
        public class ComboboxItem
        {
            public string Text { get; set; }
            public object Value { get; set; }

            public override string ToString()
            {
                return Text;
            }
        }

        // Affiche le personnel dans le listView1
        private void afficherPersMed()
        {
            listView1.Items.Clear();
            comboBoxPoste.ValueMember = "pos_id";

            string querryAfficherPersMed = "SELECT pem_id, pem_nom, pem_prenom, pem_posteId FROM personnelMedical WHERE pem_posteId = @idposte";
            string querryAfficherPersMedOrder = " ORDER BY pem_nom, pem_prenom"; 
            int idposte = Convert.ToInt32(comboBoxPoste.SelectedValue);

            //retrait du personnel présent dans la listview2 :
            for (int i = 0; i < listView2.Items.Count ; i++)
            {
                querryAfficherPersMed += " and pem_id <> " + listView2.Items[i].Tag.ToString();
            }

            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<personnelMedical> pers = connection.Query<personnelMedical>((querryAfficherPersMed + querryAfficherPersMedOrder), new { idposte }); // envoyer la requete et la stocker dans pers

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
        
        // Retourne l'adresse complete en string
        private string GetAdresse(int idPatient)
        {
            string adresseStr = "";
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<patient> adrPat = connection.Query<patient>(("SELECT pat_adrId FROM patient WHERE pat_id = @idpatient"), new { idPatient });
                foreach (patient patadr in adrPat) 
                {
                    IEnumerable<adresse> AdressePat = connection.Query<adresse>(("SELECT * FROM adresse where adr_id = @idAdrPat"), new { idAdrPat = patadr.pat_adrId } ); 
                    foreach (adresse adr in AdressePat)
                    {
                        adresseStr = adr.adr_ligne1 + ", ";
                        adresseStr += adr.adr_cp.ToString() + ", ";
                        adresseStr += adr.adr_ville + ".";
                    }
                }
            }
            return adresseStr;
        }

        // Affiche les patients suivant la requette listview3
        private void afficherPatients(string requette = "SELECT pat_id, pat_nom, pat_prenom, pat_adrId, pat_ddn FROM patient ORDER BY pat_nom, pat_prenom")
        {
            listView3.Items.Clear();

            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<patient> patient = connection.Query<patient>(requette);

                foreach (patient pat in patient)
                {
                    string[] arrayPatients = new string[] { pat.pat_nom, pat.pat_prenom, GetAdresse(pat.pat_id), pat.pat_age().ToString() };
                    ListViewItem itm;
                    itm = new ListViewItem(arrayPatients);
                    itm.Tag = pat.pat_id;
                    listView3.Items.Add(itm);
                }
            }
            if (listView3.Items.Count==0 )
            {
                listView3.Items.Add("AUCUN RESULTAT !");
            }
        }
        
        // Remplie les comboBox du tab Créer une Intervention
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

        // Met les dateTimePicker a la date/heure d'aujourd'hui
        private void setDateTimePickers()
        {
            dateTimePicker1.Value = DateTime.Today;
            dateTimePicker2.Value = DateTime.Today;
            dateTimePicker3.Value = DateTime.Today;
        }


        // Affiche les interventions médicales
        private void afficherInterMed(bool date=false)
        {        
            string salleinter = "";
            string strtypeinter = "";
            string nomComplet = "";

            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                string interMedStringQuerry = sql.interMed;
                string interMedStringOrderQuerry = sql.orderInterMed;

                listViewInter.Items.Clear();
                if (date)
                {
                    string dtpkr = dateTimePicker3.Value.ToString("yyyy-MM-dd");
                    interMedStringQuerry += "WHERE int_date = '" + dtpkr + "' ";
                }

                IEnumerable<interventionMedicale> intMedi = connection.Query<interventionMedicale>(interMedStringQuerry + interMedStringOrderQuerry);
                IEnumerable<patient> patient = connection.Query<patient>(sql.Patient + sql.orderPatient);
                IEnumerable<salleIntervention> salle = connection.Query<salleIntervention>(sql.salleInter);
                IEnumerable<typeIntervention> typeInt = connection.Query<typeIntervention>(sql.typeInter);

                foreach (interventionMedicale inter in intMedi)
                {
                    //récup du type d'intervention
                    foreach (typeIntervention typinter in typeInt)
                    {
                        if (inter.int_type == typinter.tin_id) { strtypeinter = typinter.tin_libelle.ToString(); break; }
                    }
                    //récup de la salle d'intervention
                    foreach (salleIntervention salinter in salle)
                    {
                        if (inter.int_salleId == salinter.sai_id) { salleinter = salinter.sai_libelle.ToString(); break; }
                    }
                    //récup du patient associé à l'intervention

                    foreach (patient pat in patient)
                    {
                        if (pat.pat_id == inter.int_patId) { nomComplet = pat.pat_nom + " " + pat.pat_prenom; break; }
                    }
                    string[] arrayInter = new string[] { inter.int_date.ToString(@"dd/MM/yy"), inter.int_heureEntree.ToString(@"hh\:mm"), strtypeinter, salleinter, nomComplet, inter.int_etat() };
                    ListViewItem itm;
                    itm = new ListViewItem(arrayInter);
                    itm.Tag = inter.int_id;
                    listViewInter.Items.Add(itm);
                }
            }
        }

        // Affiche les informations relatives a l'Intervention Médicale
        private void afficherInformations()
        {
            IEnumerable<interventionMedicale> interMedic;
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {

                string idInter = "";
                if (listViewInter.SelectedItems.Count == 1)
                {
                    idInter = listViewInter.SelectedItems[0].Tag.ToString();
                }
                interMedic = connection.Query<interventionMedicale>(("select * from  interventionMedicale where int_id = @idInter"), new { idInter });
            }
                afficherInfoInter(interMedic);
                afficherInfoPersonnel(interMedic);
                afficherInfoPatient(interMedic);
            
        }

        // Affiche les informations de l'interventions.
        private void afficherInfoInter(IEnumerable<interventionMedicale> intervention) 
        {
            string salleinter = "";
            string typeinter = "";
            if (listViewInter.SelectedItems.Count == 1)
            {
                

                using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
                {
                    IEnumerable<salleIntervention> salle = connection.Query<salleIntervention>(sql.salleInter);
                    IEnumerable<typeIntervention> typeInt = connection.Query<typeIntervention>(sql.typeInter);

                    foreach (interventionMedicale inter in intervention)
                    {
                        //récup du type d'intervention
                        foreach (typeIntervention typinter in typeInt)
                        {
                            if (inter.int_type == typinter.tin_id) { typeinter = typinter.tin_libelle.ToString(); break; }
                        }
                        //récup de la salle d'intervention
                        foreach (salleIntervention salinter in salle)
                        {
                            if (inter.int_salleId == salinter.sai_id) { salleinter = salinter.sai_libelle.ToString(); break; }
                        }
                        labelDateInter.Text = inter.int_date.ToString(@"dd/MM/yyyy");
                        labelHeureInter.Text = inter.int_heureEntree.ToString(@"hh\:mm");
                        labelHeureFin.Text = "None";
                        labelBlocSalle.Text = salleinter;
                        labelTypeInter.Text = typeinter;
                    }

                }
            }
        }

        // Affiche les informations du personnel participant à l'interventions.
        private void afficherInfoPersonnel(IEnumerable<interventionMedicale> intervention) 
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                listView5.Items.Clear();
                IEnumerable<personnelIntervention> Pers;
                foreach (interventionMedicale inter in intervention)
                {
                    
                    string querryAfficherPersMed = "SELECT pem_id, pem_nom, pem_prenom, pem_posteId FROM personnelMedical where 0=1 ";
                    //string querryAfficherPersMedOrder = "order by pem_posteId, pem_nom, pem_prenom";

                    Pers = connection.Query<personnelIntervention>(("select * from personnelIntervention where intervention_id = @interventionId"), new { interventionId = inter.int_id });
                    foreach (personnelIntervention pers in Pers)
                    {
                        querryAfficherPersMed += " or pem_id = " + pers.personnelMedical_id;
                    }
                    IEnumerable<personnelMedical> persMedi = connection.Query<personnelMedical>(querryAfficherPersMed + " order by pem_posteId, pem_nom, pem_prenom");
                        foreach (personnelMedical pem in persMedi)
                        {
                            string pemPosteId = pem.pem_posteId.ToString();
                            IEnumerable<poste> post = connection.Query<poste>(("SELECT * FROM poste WHERE pos_id = @pemPosteId"), new { pemPosteId });
                            foreach (poste pos in post)
                            {
                                string[] arrayPersMedParticipant = new string[] { pem.pem_nom +" "+ pem.pem_prenom, pos.pos_code };
                                ListViewItem itm;
                                itm = new ListViewItem(arrayPersMedParticipant);
                                itm.Tag = pem.pem_id;
                                listView5.Items.Add(itm);
                            }
                        }
                }
            }
        }

        // Affiche les informations relatives au patient participant à l'intervention.
        private void afficherInfoPatient(IEnumerable<interventionMedicale> intervention) 
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                int idPatient = 0;
                foreach (interventionMedicale intmed in intervention)
                {
                    idPatient = intmed.int_patId;
                }
                IEnumerable<patient> Pat = connection.Query<patient>(("select * from  patient where pat_id = @idPatient"), new { idPatient });

                int idMedecin = 0;
                foreach (patient pat in Pat)
                {
                    idMedecin = pat.pat_idmedecin;
                }

                afficherInfoMedicalesPatient(Pat);
                afficherInfoPersonnellesPatient(Pat);
                afficherInfoMedecinGeneralistePatient(idMedecin);
            }
        }

        // Affiche les informations médicales du patient.
        private void afficherInfoMedicalesPatient(IEnumerable<patient> patient)
        {
            string groupeSanguin = "";
            listView4.Items.Clear();
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                foreach (patient pat in patient)
                {
                    string idGrs = pat.pat_idgroupeSanguin.ToString();
                    IEnumerable<groupeSanguin> Grs = connection.Query<groupeSanguin>(("select * from groupeSanguin where grs_id = @idGrs"), new { idGrs });
                    foreach (groupeSanguin grs in Grs) { groupeSanguin = grs.grs_libelle; }
                    string idallergie ="None";
                    string idPatient = pat.pat_id.ToString();
                    IEnumerable<patientAllergie> PatAll = connection.Query<patientAllergie>(("select * from patientAllergie where pat_id = @idPatient"), new { idPatient });
                    foreach (patientAllergie patall in PatAll)
                    {
                        idallergie = patall.pat_id.ToString();
                        IEnumerable<allergie> All = connection.Query<allergie>(("select * from allergie where all_id = @idallergie"), new { idallergie });
                        foreach (allergie all in All) 
                        {
                            string[] arrayInter = new string[] { all.all_libelle };
                            ListViewItem itm;
                            itm = new ListViewItem(arrayInter);
                            listView4.Items.Add(itm);
                        }
                    }
                    labelNomPatient.Text = pat.pat_nom;
                    labelprenomPatient.Text = pat.pat_prenom;
                    labelAgePatient.Text = pat.pat_age().ToString();
                    labelPoidsPatient.Text = pat.pat_poids.ToString()+" kg";
                    labelTaillePatient.Text = pat.pat_taille.ToString() + " m";
                    labelGSPatient.Text = groupeSanguin;

                    labelDateEntree.Text = pat.pat_dateEntree.ToString(@"dd/MM/yyyy");
                }
            }
        }

        // Affiche les information personnelles du patient.
        private void afficherInfoPersonnellesPatient(IEnumerable<patient> patient) 
        {
            int idPatient = 0;
            foreach (patient pat in patient)
            {
                labelAdressePatient.Text = GetAdresse(pat.pat_id);
                labelTelPatient.Text = pat.pat_tel;
                labelProfessionPatient.Text = pat.pat_profession;
                idPatient = pat.pat_id;
            }
            afficherInfoPersConf(idPatient);
        }

        private void supprimerIntervention()
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                string idInter = "";
                if (listViewInter.SelectedItems.Count == 1)
                {
                    idInter = listViewInter.SelectedItems[0].Tag.ToString();
                }
                //suppression de l'intervention
                connection.Query((sql.supprimerPersonnelIntervention), new { idInter });
                connection.Query((sql.supprimerIntervention), new { idInter });

            }
        }

        // Affiche les information du medecin généraliste du patient.
        private void afficherInfoMedecinGeneralistePatient(int idMedecin) 
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<medecinGeneraliste> meds = connection.Query<medecinGeneraliste>(("select * from  medecinGeneraliste where meg_id = @idMedecin"), new { idMedecin });
                
                foreach (medecinGeneraliste med in meds)
                {
                    IEnumerable<adresse> adrs = connection.Query<adresse>(("select adr_ville from adresse where adr_id = @adrId"), new { adrId = med.meg_adrId });
                    labelNomMedGen.Text = "Dr "+med.meg_nom;
                    labelAdresseMailMedGen.Text = med.meg_mail;
                    labelTelMedGen.Text = med.meg_tel;
                    labelFaxMedGen.Text = med.meg_fax;
                    foreach (adresse adr in adrs)
                    {
                        labelMedGen.Text = adr.adr_ville;
                    }
                }
            }
        }

        // Affiche les infos des personnes de confiance
        private void afficherInfoPersConf(int idPatient)
        {
            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                int conteurPec = 0;
                int conteurEpc = 0;

                comboBox1.Items.Clear();

                IEnumerable<estPersonneConfiance> Epc = connection.Query<estPersonneConfiance>(("select * from estPersonneConfiance where patient_pat_id = @idPatient"), new { idPatient });

                foreach (estPersonneConfiance epc in Epc)
                {
                    conteurEpc++;
                    int pecId = epc.personneConfiance_pec_id;
                    IEnumerable<personneConfiance> Pecs = connection.Query<personneConfiance>(("select pec_nom, pec_prenom, pec_id from personneConfiance where pec_id = @pecId "), new { pecId });

                    foreach (personneConfiance pec in Pecs)
                    {
                        conteurPec++;
                        ComboboxItem item = new ComboboxItem();
                        item.Text = epc.epc_qualification;
                        item.Value = pec.pec_id.ToString();
                        comboBox1.Items.Add(item);
                    }
                    comboBox1.SelectedIndex = 0;

                    if (conteurPec > 0)
                    {
                        comboBox1.SelectedIndex = 0;

                        IEnumerable<personneConfiance> Pec = connection.Query<personneConfiance>(("select * from personneConfiance where pec_id = @pecId "), new { PecId = epc.personneConfiance_pec_id });

                        foreach (personneConfiance pec in Pec)
                        {
                            labelNomPersConf.Text = pec.pec_nom;
                            labelPrenomPersConf.Text = pec.pec_prenom;
                            labelTelPersConf.Text = pec.pec_tel;
                        }
                    }
                }

                if (conteurEpc == 0)
                {
                    labelNomPersConf.Text = "None";
                    labelPrenomPersConf.Text = "None";
                    labelTelPersConf.Text = "None";
                    comboBox1.Text = "";
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*int idpec = (int)comboBox1.SelectedValue;

            using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
            {
                IEnumerable<personneConfiance> Pec = connection.Query<personneConfiance>(("select * from personneConfiance where pec_id = @idpec "), new { idpec });

                foreach (personneConfiance pec in Pec)
                {
                    labelNomPersConf.Text = pec.pec_nom;
                    labelPrenomPersConf.Text = pec.pec_prenom;
                    labelTelPersConf.Text = pec.pec_tel;
                }
            }*/
        }

        // Quand le form1 se load
        private void Form1_Load(object sender, EventArgs e)
        {
            setComboBoxes();
            setDateTimePickers();
            afficherPatients();
            afficherInterMed();
        }
        
        // Quand le bouton "Créer l'intervention" est cliqué
        private void buttonCreerIntervention_Click(object sender, EventArgs e)
        {
            bool errLv3 = false;
            bool errLv2 = false;
            string erreur = "";

            if (listView3.SelectedItems.Count == 0 && listView3.Items.Count != 1) { errLv3 = true; }
            if (listView2.Items.Count == 0) { errLv2 = true; }

            if (errLv2 || errLv3) //Si il y a une erreur
            {
                if (errLv3)
                {
                    if (errLv2) 
                    {
                        erreur = "Vous n'avez sélectionné ni patient, ni personnel.";
                    }
                    else
                    {
                        erreur = "Vous n'avez pas sélectionné de patient.";
                    }
                }else if (errLv2)
                {
                    erreur = "Vous n'avez pas sélectionné de personnel.";
                }
                
                    MessageBox.Show(erreur, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            else
            {
                //Je récupère les données "date et heure"
                DateTime dateInter = dateTimePicker1.Value;
                string heureInter = dateTimePicker2.Text.ToString() + ":00";

                //Je récupère l'ID de chaque champs selectionné en fonction de son libelle et l'id du patient
                int typeId = Convert.ToInt32(ComboBoxTypeInterv.SelectedValue);
                int salleId = Convert.ToInt32(ComboBoxSalle.SelectedValue);
                int patId = Convert.ToInt32(listView3.SelectedItems[0].Tag);
                
                using (MySqlConnection connection = new MySqlConnection(ConnexionSQL.MySqlConnectionString()))
                {
                    var intId = connection.Query<int>(sql.CreationIntervention, new { dateInter, heureInter, typeId, salleId, patId }).Single();
                    for (int i = 0; i < listView2.Items.Count; i++)
                    {
                        int persId = Convert.ToInt32(listView2.Items[i].Tag);
                        connection.Execute((sql.CreationInterventionPatient), new { intId, persId });
                    }
                }
                MessageBox.Show("Intervention créée !", "Felicitation", MessageBoxButtons.OK);
            }
        }

        //Quand on change la profession du personnel :
        private void comboBoxPoste_SelectedIndexChanged(object sender, EventArgs e)
        {
            afficherPersMed();
        }

        //Quand on clique sur "Ajouter" un personnel a l'intervention
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


            }else
            {
                MessageBox.Show("Personne n'a été selectionné.", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        //Quand on clique sur "Retirer" un personnel a l'intervention
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
        
        //Appui sur entrer quand on est sur textbox1
        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                buttonTrouver_Click(this, new EventArgs());
            }
        }

        //Appui sur entrer quand on est sur textbox2
        private void textBox2_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                buttonTrouver_Click(this, new EventArgs());
            }
        }

        //Quand on clique sur "Trouver" un patient
        private void buttonTrouver_Click(object sender, EventArgs e)
        {
            string patientQuerry = "SELECT pat_id, pat_nom, pat_prenom, pat_adrId, pat_ddn FROM patient";
            
            if (textBox2.Text != "") //CP ?
            {

                patientQuerry += " INNER JOIN adresse ON patient.pat_adrId = adresse.adr_id";
                patientQuerry += " where adr_cp = " + textBox2.Text; 

                if (textBox1.Text != "") //CP et Nom
                {
                    patientQuerry += " and pat_nom = '" + textBox1.Text.ToUpper() + "'";
                }
            }

            else if (textBox2.Text =="" && textBox1.Text != "")
            {
                patientQuerry += "  WHERE pat_nom = '" + textBox1.Text.ToUpper() + "'";
            }
            else if (textBox1.Text == "" && textBox2.Text == "") //Nom
            {
                //Clear
            }
            afficherPatients(patientQuerry + sql.orderPatient);
        }

        //Quand on clique sur le bouton "Sélectioner un patient
        private void SelectionerButton_Click(object sender, EventArgs e)
        {
            if (listView3.Items.Count != 1)
            {
                string patId = listView3.SelectedItems[0].Tag.ToString();
                string requetteSelectionnerPatient = " SELECT pat_id, pat_nom, pat_prenom, pat_adrId, pat_ddn FROM patient WHERE pat_id = '" + patId + "'";
                afficherPatients(requetteSelectionnerPatient);
                listView3.Items[0].Selected = true;
            }
            else
            {
                MessageBox.Show("Personne n'a été selectionné.", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //Quand on clique sur le bouton Annuler
        private void AnnulerButton_Click(object sender, EventArgs e)
        {
            afficherPatients();
        }

        //Quand on double clique sur les items des listviews suivante
        private void listView1_DoubleClick(object sender, EventArgs e)
        {
            AjouterButton_Click(this, new EventArgs());
        }
        private void listView2_DoubleClick(object sender, EventArgs e)
        {
            RetirerButton_Click(this, new EventArgs());
        }
        private void listView3_DoubleClick(object sender, EventArgs e)
        {
            SelectionerButton_Click(this, new EventArgs());
        }

        //Affiche les interventions avec la date rentrée correspondante
        private void buttonTrouver2_Click(object sender, EventArgs e)
        {
            afficherInterMed(true);
        }

        //Affiche toutes les interventions médicales
        private void button2_Click(object sender, EventArgs e)
        {
            afficherInterMed();
        }

        private void listViewInter_SelectedIndexChanged(object sender, EventArgs e)
        {
            afficherInformations();
        }

        private void buttonModifier_Click(object sender, EventArgs e)
        {
            int idInter = 0;
            if (listViewInter.SelectedItems.Count == 1)
                {
                     idInter = Convert.ToInt32(listViewInter.SelectedItems[0].Tag);
                }
            Form2 form2 = new Form2(idInter);
            form2.Show();
            this.Hide();
        }

        private void buttonSupprimer_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Etes vous sûr de vouloir SUPPRIMER cette intervention ?", "Etes vous sûr ?", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                supprimerIntervention();
                MessageBox.Show("L'intervention a bien été supprimée", "Intervention supprimée", MessageBoxButtons.OK);
                afficherInterMed();
            }
            else
            {
                MessageBox.Show("L'intervention n'a pas été supprimée", "Intervention non supprimée", MessageBoxButtons.OK);
            }
        }

        
    }
}
