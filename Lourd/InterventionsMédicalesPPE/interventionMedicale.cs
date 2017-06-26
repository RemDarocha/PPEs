using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterventionsMédicalesPPE
{
    class interventionMedicale
    {
        public int int_id { get; set; }

        public DateTime int_date { get; set; }

        public TimeSpan int_heureEntree { get; set; }

        public TimeSpan int_heureSortie { get; set; }

        public TimeSpan int_heureIncision { get; set; }

        public int int_type { get; set; }

        public int int_salleId { get; set; }

        public int int_patId { get; set; }

        public string int_etat()
        {
            string etat = "A venir";
            int result = DateTime.Compare(int_date, DateTime.Now.Date);

            if (result == 0) //Aujourd'hui
            {
                /*int minEntree = Convert.ToInt32(int_heureEntree.ToString("MM"));
                int heureEntree = Convert.ToInt32(int_heureEntree.ToString("hh"));
                DateTime now = DateTime.Now;
                int nowMinutes = Convert.ToInt32(now.ToString("MM"));
                int nowHeure = Convert.ToInt32(now.ToString("hh"));
                if (heureEntree < nowHeure-2)
                {
                    etat = "A venir";
                }
                if (nowHeure - 2 < heureEntree && heureEntree < nowHeure)
                {*/
                    etat = "En cours";/*
                }*/
            }
            if (result < 0)
            {
                etat = "Terminée";
            }

            return etat;
        }
        
    }
}
