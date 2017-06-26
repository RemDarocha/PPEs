using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterventionsMédicalesPPE
{
    public class sqlQuerry
    {
        public string Patient = "SELECT * FROM patient ";
        public string orderPatient = " ORDER BY pat_nom, pat_prenom";

        public string interMed = "SELECT * FROM interventionMedicale ";
        public string orderInterMed = "ORDER BY int_date, int_heureEntree";

        public string salleInter = "SELECT * FROM salleIntervention ORDER BY sai_libelle";

        public string typeInter = "SELECT * FROM typeIntervention ORDER BY tin_libelle";

        public string CreationIntervention = @"
                CREATE TEMPORARY TABLE IF NOT EXISTS insertedId(id INT);
                INSERT INTO interventionMedicale (int_date ,int_heureEntree ,int_type ,int_salleId, int_patId ) VALUES (  @dateInter , @heureInter , @typeId ,  @salleId , @patId );
                INSERT INTO insertedId(id) VALUES (LAST_INSERT_ID());
                SELECT id FROM insertedId LIMIT 1;";

        public string CreationInterventionPatient = "INSERT INTO personnelIntervention (intervention_id, personnelMedical_id) VALUES ( @intId, @persId )";

        public string supprimerIntervention = "DELETE FROM interventionMedicale WHERE int_id = @idInter";

        public string supprimerPersonnelIntervention = "DELETE FROM personnelIntervention WHERE intervention_id = @idInter";

    }
}
