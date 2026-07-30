import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure PharmacokineticBridge (M : CompartmentModel) where
  absorptionRate : Float
  eliminationRate : Float
  distributionVolume : Float
  halfLife : Float
  auc : Float
  absorptionClosed : Prop
  eliminationClosed : Prop
  distributionClosed : Prop
  halfLifeClosed : Prop
  aucClosed : Prop
  absorptionClosedTerm : absorptionClosed
  eliminationClosedTerm : eliminationClosed
  distributionClosedTerm : distributionClosed
  halfLifeClosedTerm : halfLifeClosed
  aucClosedTerm : aucClosed

def PharmacokineticBridgeClosed (M : CompartmentModel) (B : PharmacokineticBridge M) : Prop :=
  B.absorptionClosed ∧ B.eliminationClosed ∧ B.distributionClosed ∧ B.halfLifeClosed ∧ B.aucClosed

theorem pharmacokinetic_bridge_closed_from_evidence (M : CompartmentModel) (B : PharmacokineticBridge M) : PharmacokineticBridgeClosed M B := by
  exact And.intro B.absorptionClosedTerm (And.intro B.eliminationClosedTerm (And.intro B.distributionClosedTerm (And.intro B.halfLifeClosedTerm B.aucClosedTerm)))

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse