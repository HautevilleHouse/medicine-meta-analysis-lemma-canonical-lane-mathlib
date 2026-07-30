import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.CompartmentModel
import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.PharmacokineticBridge
import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure MedicineAdmissibleObject where
  compartmentModel : CompartmentModel
  pharmacokineticBridge : PharmacokineticBridge compartmentModel
  diagnosticTest : DiagnosticTest
  survivalModel : SurvivalModel

def medicineBridgeClosed (A : AdmissibleClass) : Prop :=
  let M : MedicineAdmissibleObject := A.object
  CompartmentModelClosed M.compartmentModel ∧ PharmacokineticBridgeClosed M.compartmentModel M.pharmacokineticBridge ∧ DiagnosticInferenceClosed M.diagnosticTest ∧ SurvivalAnalysisClosed M.survivalModel

theorem medicine_bridge_from_admissible_class (A : AdmissibleClass) : medicineBridgeClosed A := by
  let M : MedicineAdmissibleObject := A.object
  exact And.intro (compartment_model_closed_from_evidence M.compartmentModel)
    (And.intro (pharmacokinetic_bridge_closed_from_evidence M.compartmentModel M.pharmacokineticBridge)
      (And.intro (diagnostic_inference_closed_from_evidence M.diagnosticTest)
        (survival_analysis_closed_from_evidence M.survivalModel)))

def medicineGateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem medicine_gate_from_admissible_class (A : AdmissibleClass) : medicineGateClosed A := by
  exact A.gateWitness

def ConstrainedMetaAnalysisClosure (A : AdmissibleClass) : Prop :=
  medicineBridgeClosed A ∧ medicineGateClosed A

theorem constrained_meta_analysis_endgame (A : AdmissibleClass) : ConstrainedMetaAnalysisClosure A := by
  exact And.intro (medicine_bridge_from_admissible_class A) (medicine_gate_from_admissible_class A)

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse