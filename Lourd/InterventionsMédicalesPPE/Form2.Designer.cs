namespace InterventionsMédicalesPPE
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form2));
            this.label1 = new System.Windows.Forms.Label();
            this.dateTimePickerHeure = new System.Windows.Forms.DateTimePicker();
            this.dateTimePickerDate = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.ComboBoxTypeInterv = new System.Windows.Forms.ComboBox();
            this.ComboBoxSalle = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dateTimePickerHeureFin = new System.Windows.Forms.DateTimePicker();
            this.label7 = new System.Windows.Forms.Label();
            this.labelPatient = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.AjouterButton = new System.Windows.Forms.Button();
            this.listView2 = new System.Windows.Forms.ListView();
            this.lv2Nom = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lv2Prénom = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lv2Profession = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.comboBoxPoste = new System.Windows.Forms.ComboBox();
            this.listView1 = new System.Windows.Forms.ListView();
            this.lv1Nom = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.lv1Prénom = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.RetirerButton = new System.Windows.Forms.Button();
            this.buttonValider = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(68, 48);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(42, 13);
            this.label1.TabIndex = 47;
            this.label1.Text = "Heure :";
            // 
            // dateTimePickerHeure
            // 
            this.dateTimePickerHeure.CustomFormat = "HH:mm";
            this.dateTimePickerHeure.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePickerHeure.Location = new System.Drawing.Point(116, 45);
            this.dateTimePickerHeure.MaxDate = new System.DateTime(2018, 12, 31, 0, 0, 0, 0);
            this.dateTimePickerHeure.MinDate = new System.DateTime(2016, 1, 1, 0, 0, 0, 0);
            this.dateTimePickerHeure.Name = "dateTimePickerHeure";
            this.dateTimePickerHeure.ShowUpDown = true;
            this.dateTimePickerHeure.Size = new System.Drawing.Size(131, 20);
            this.dateTimePickerHeure.TabIndex = 46;
            // 
            // dateTimePickerDate
            // 
            this.dateTimePickerDate.CustomFormat = "dd/MM/yyyy";
            this.dateTimePickerDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePickerDate.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.dateTimePickerDate.Location = new System.Drawing.Point(116, 19);
            this.dateTimePickerDate.MaxDate = new System.DateTime(2019, 1, 1, 0, 0, 0, 0);
            this.dateTimePickerDate.MinDate = new System.DateTime(2017, 3, 27, 0, 0, 0, 0);
            this.dateTimePickerDate.Name = "dateTimePickerDate";
            this.dateTimePickerDate.Size = new System.Drawing.Size(131, 20);
            this.dateTimePickerDate.TabIndex = 45;
            this.dateTimePickerDate.Value = new System.DateTime(2017, 3, 27, 0, 0, 0, 0);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(74, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 13);
            this.label2.TabIndex = 40;
            this.label2.Text = "Date :";
            // 
            // ComboBoxTypeInterv
            // 
            this.ComboBoxTypeInterv.FormattingEnabled = true;
            this.ComboBoxTypeInterv.Location = new System.Drawing.Point(116, 98);
            this.ComboBoxTypeInterv.Name = "ComboBoxTypeInterv";
            this.ComboBoxTypeInterv.Size = new System.Drawing.Size(131, 21);
            this.ComboBoxTypeInterv.TabIndex = 44;
            // 
            // ComboBoxSalle
            // 
            this.ComboBoxSalle.FormattingEnabled = true;
            this.ComboBoxSalle.Location = new System.Drawing.Point(410, 99);
            this.ComboBoxSalle.Name = "ComboBoxSalle";
            this.ComboBoxSalle.Size = new System.Drawing.Size(153, 21);
            this.ComboBoxSalle.TabIndex = 43;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(342, 103);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 13);
            this.label4.TabIndex = 41;
            this.label4.Text = "Bloc/Salle :";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 102);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(103, 13);
            this.label5.TabIndex = 42;
            this.label5.Text = "Type d\'intervention :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dateTimePickerHeureFin);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.labelPatient);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Controls.Add(this.dateTimePickerHeure);
            this.groupBox1.Controls.Add(this.ComboBoxTypeInterv);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.ComboBoxSalle);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.dateTimePickerDate);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(600, 551);
            this.groupBox1.TabIndex = 48;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Modifier l\'intervention";
            // 
            // dateTimePickerHeureFin
            // 
            this.dateTimePickerHeureFin.CustomFormat = "HH:mm";
            this.dateTimePickerHeureFin.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePickerHeureFin.Location = new System.Drawing.Point(116, 72);
            this.dateTimePickerHeureFin.MaxDate = new System.DateTime(2018, 12, 31, 0, 0, 0, 0);
            this.dateTimePickerHeureFin.MinDate = new System.DateTime(2016, 1, 1, 0, 0, 0, 0);
            this.dateTimePickerHeureFin.Name = "dateTimePickerHeureFin";
            this.dateTimePickerHeureFin.ShowUpDown = true;
            this.dateTimePickerHeureFin.Size = new System.Drawing.Size(131, 20);
            this.dateTimePickerHeureFin.TabIndex = 57;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(39, 75);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(71, 13);
            this.label7.TabIndex = 58;
            this.label7.Text = "Heure de fin :";
            // 
            // labelPatient
            // 
            this.labelPatient.AutoSize = true;
            this.labelPatient.Location = new System.Drawing.Point(406, 25);
            this.labelPatient.Name = "labelPatient";
            this.labelPatient.Size = new System.Drawing.Size(39, 13);
            this.labelPatient.TabIndex = 56;
            this.labelPatient.Text = "patient";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(343, 25);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(46, 13);
            this.label6.TabIndex = 55;
            this.label6.Text = "Patient :";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.AjouterButton);
            this.groupBox2.Controls.Add(this.listView2);
            this.groupBox2.Controls.Add(this.comboBoxPoste);
            this.groupBox2.Controls.Add(this.listView1);
            this.groupBox2.Controls.Add(this.RetirerButton);
            this.groupBox2.Location = new System.Drawing.Point(6, 125);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(585, 415);
            this.groupBox2.TabIndex = 54;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Personnel :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 20);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Profession :";
            // 
            // AjouterButton
            // 
            this.AjouterButton.Location = new System.Drawing.Point(110, 386);
            this.AjouterButton.Name = "AjouterButton";
            this.AjouterButton.Size = new System.Drawing.Size(75, 23);
            this.AjouterButton.TabIndex = 50;
            this.AjouterButton.Text = "Ajouter";
            this.AjouterButton.UseVisualStyleBackColor = true;
            this.AjouterButton.Click += new System.EventHandler(this.AjouterButton_Click);
            // 
            // listView2
            // 
            this.listView2.AllowColumnReorder = true;
            this.listView2.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.lv2Nom,
            this.lv2Prénom,
            this.lv2Profession});
            this.listView2.FullRowSelect = true;
            this.listView2.Location = new System.Drawing.Point(297, 43);
            this.listView2.Name = "listView2";
            this.listView2.Size = new System.Drawing.Size(281, 337);
            this.listView2.TabIndex = 49;
            this.listView2.UseCompatibleStateImageBehavior = false;
            this.listView2.View = System.Windows.Forms.View.Details;
            this.listView2.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.listView2_MouseDoubleClick);
            // 
            // lv2Nom
            // 
            this.lv2Nom.Text = "Nom";
            this.lv2Nom.Width = 140;
            // 
            // lv2Prénom
            // 
            this.lv2Prénom.Text = "Prénom";
            this.lv2Prénom.Width = 76;
            // 
            // lv2Profession
            // 
            this.lv2Profession.Text = "Profession";
            this.lv2Profession.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.lv2Profession.Width = 61;
            // 
            // comboBoxPoste
            // 
            this.comboBoxPoste.FormattingEnabled = true;
            this.comboBoxPoste.Location = new System.Drawing.Point(78, 16);
            this.comboBoxPoste.Name = "comboBoxPoste";
            this.comboBoxPoste.Size = new System.Drawing.Size(121, 21);
            this.comboBoxPoste.TabIndex = 48;
            this.comboBoxPoste.SelectedIndexChanged += new System.EventHandler(this.comboBoxPoste_SelectedIndexChanged);
            // 
            // listView1
            // 
            this.listView1.AllowColumnReorder = true;
            this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.lv1Nom,
            this.lv1Prénom});
            this.listView1.FullRowSelect = true;
            this.listView1.Location = new System.Drawing.Point(7, 43);
            this.listView1.MultiSelect = false;
            this.listView1.Name = "listView1";
            this.listView1.Size = new System.Drawing.Size(281, 337);
            this.listView1.TabIndex = 47;
            this.listView1.UseCompatibleStateImageBehavior = false;
            this.listView1.View = System.Windows.Forms.View.Details;
            this.listView1.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.listView1_MouseDoubleClick);
            // 
            // lv1Nom
            // 
            this.lv1Nom.Text = "Nom";
            this.lv1Nom.Width = 182;
            // 
            // lv1Prénom
            // 
            this.lv1Prénom.Text = "Prénom";
            this.lv1Prénom.Width = 77;
            // 
            // RetirerButton
            // 
            this.RetirerButton.Location = new System.Drawing.Point(400, 386);
            this.RetirerButton.Name = "RetirerButton";
            this.RetirerButton.Size = new System.Drawing.Size(75, 23);
            this.RetirerButton.TabIndex = 46;
            this.RetirerButton.Text = "Retirer";
            this.RetirerButton.UseVisualStyleBackColor = true;
            this.RetirerButton.Click += new System.EventHandler(this.RetirerButton_Click);
            // 
            // buttonValider
            // 
            this.buttonValider.Location = new System.Drawing.Point(534, 569);
            this.buttonValider.Name = "buttonValider";
            this.buttonValider.Size = new System.Drawing.Size(75, 23);
            this.buttonValider.TabIndex = 49;
            this.buttonValider.Text = "Valider";
            this.buttonValider.UseVisualStyleBackColor = true;
            this.buttonValider.Click += new System.EventHandler(this.buttonValider_Click);
            // 
            // button1
            // 
            this.button1.AutoSize = true;
            this.button1.Location = new System.Drawing.Point(12, 568);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 50;
            this.button1.Text = "Annuler";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(621, 599);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.buttonValider);
            this.Controls.Add(this.groupBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form2";
            this.Text = "Modifier l\'Intervention";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dateTimePickerHeure;
        private System.Windows.Forms.DateTimePicker dateTimePickerDate;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox ComboBoxTypeInterv;
        private System.Windows.Forms.ComboBox ComboBoxSalle;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button AjouterButton;
        private System.Windows.Forms.ListView listView2;
        private System.Windows.Forms.ColumnHeader lv2Nom;
        private System.Windows.Forms.ColumnHeader lv2Prénom;
        private System.Windows.Forms.ColumnHeader lv2Profession;
        private System.Windows.Forms.ComboBox comboBoxPoste;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.ColumnHeader lv1Nom;
        private System.Windows.Forms.ColumnHeader lv1Prénom;
        private System.Windows.Forms.Button RetirerButton;
        private System.Windows.Forms.Label labelPatient;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DateTimePicker dateTimePickerHeureFin;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button buttonValider;
        private System.Windows.Forms.Button button1;
    }
}