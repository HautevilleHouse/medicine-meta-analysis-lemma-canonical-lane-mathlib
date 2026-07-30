import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure CompartmentPharmacokineticsPackage where
  compartments : Nat
  volumeOfDistribution : Prop
  eliminationRateConstant : Prop
  absorptionRateConstant : Prop
  initialCondition : Prop
  solutionFormula : Prop

structure CompartmentPharmacokineticsEvidence (P : CompartmentPharmacokineticsPackage) where
  volumeOfDistributionClosed : P.volumeOfDistribution
  eliminationRateConstantClosed : P.eliminationRateConstant
  absorptionRateConstantClosed : P.absorptionRateConstant
  initialConditionClosed : P.initialCondition
  solutionFormulaClosed : P.solutionFormula

def CompartmentPharmacokineticsClosed (P : CompartmentPharmacokineticsPackage) : Prop :=
  P.volumeOfDistribution ∧ P.eliminationRateConstant ∧ P.absorptionRateConstant ∧
  P.initialCondition ∧ P.solutionFormula

theorem compartment_pharmacokinetics_closed_from_evidence
    (P : CompartmentPharmacokineticsPackage) (E : CompartmentPharmacokineticsEvidence P) :
    CompartmentPharmacokineticsClosed P := by
  exact And.intro E.volumeOfDistributionClosed
    (And.intro E.eliminationRateConstantClosed
      (And.intro E.absorptionRateConstantClosed
        (And.intro E.initialConditionClosed E.solutionFormulaClosed)))

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse