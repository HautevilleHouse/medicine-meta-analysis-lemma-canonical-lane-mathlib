import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure PharmacokineticCompartmentPackage where
  centralCompartmentVolume : Prop
  clearanceRate : Prop
  absorptionRate : Prop
  eliminationRate : Prop
  plasmaConcentration : Prop

structure PharmacokineticCompartmentEvidence (P : PharmacokineticCompartmentPackage) where
  centralCompartmentVolumeClosed : P.centralCompartmentVolume
  clearanceRateClosed : P.clearanceRate
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  plasmaConcentrationClosed : P.plasmaConcentration

def PharmacokineticCompartmentClosed (P : PharmacokineticCompartmentPackage) : Prop :=
  P.centralCompartmentVolume ∧ P.clearanceRate ∧ P.absorptionRate ∧ P.eliminationRate ∧ P.plasmaConcentration

theorem pharmacokinetic_compartment_closed_from_evidence
    (P : PharmacokineticCompartmentPackage) (E : PharmacokineticCompartmentEvidence P) :
    PharmacokineticCompartmentClosed P := by
  exact And.intro E.centralCompartmentVolumeClosed $
    And.intro E.clearanceRateClosed $
      And.intro E.absorptionRateClosed $
        And.intro E.eliminationRateClosed E.plasmaConcentrationClosed

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse