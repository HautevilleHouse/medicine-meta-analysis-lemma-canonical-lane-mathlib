import canonicalLaneMathlib.AdmissibleClass
import MedicineMetaAnalysisLemmaCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure PharmacokineticPackage where
  absorption : Prop
  distribution : Prop
  metabolism : Prop
  elimination : Prop
  halfLife : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionClosed : P.absorption
  distributionClosed : P.distribution
  metabolismClosed : P.metabolism
  eliminationClosed : P.elimination
  halfLifeClosed : P.halfLife

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorption ∧ P.distribution ∧ P.metabolism ∧ P.elimination ∧ P.halfLife

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionClosed (And.intro E.distributionClosed (And.intro E.metabolismClosed (And.intro E.eliminationClosed E.halfLifeClosed)))

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse