using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterventionsMédicalesPPE
{
    class personnelMedical
    {
        public int pem_id { get; set; }

        public string pem_nom { get; set; }

        public string pem_prenom { get; set; }

        public DateTime pem_dateNaissance { get; set; }

        public string pem_infoSup { get; set; }

        public int pem_service { get; set; }

        public int pem_posteId { get; set; }
    }
}
