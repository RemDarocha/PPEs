using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterventionsMédicalesPPE
{
    class patient
    {
        public int pat_id { get; set; }

        public string pat_nom { get; set; }

        public string pat_prenom { get; set; }

        public string pat_civilite { get; set; }

        public DateTime pat_ddn { get; set; }

        public float pat_poids { get; set; }

        public float pat_taille { get; set; }

        public DateTime pat_dateEntree { get; set; }

        public int pat_idallergie { get; set; }

        public int pat_idgroupeSanguin { get; set; }

        public string pat_profession { get; set; }

        public int pat_idmedecin { get; set; }

        public string pat_infoSup { get; set; }

        public int pat_adrId { get; set; }

        public string pat_tel  { get; set; }

        //Calcule l'age d'un patient
        public int pat_age()
        {
            int age = DateTime.Now.Year - this.pat_ddn.Year;
            if (this.pat_ddn > DateTime.Now.AddYears(-age)) { age--; }
            return age;
        }
    }
}
