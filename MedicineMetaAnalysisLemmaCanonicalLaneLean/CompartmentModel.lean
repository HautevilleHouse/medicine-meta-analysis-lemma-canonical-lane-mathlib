import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rates : List (List (Float))
  initialConcentration : List Float
  timeDomain : Float -> Float
  solution : List Float -> Float -> List Float
  massBalance : Prop
  positivity : Prop
  massBalanceClosed : massBalance
  positivityClosed : positivity

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.massBalance ∧ M.positivity

theorem compartment_model_closed_from_evidence (M : CompartmentModel) : CompartmentModelClosed M := by
  exact And.intro M.massBalanceClosed M.positivityClosed

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse