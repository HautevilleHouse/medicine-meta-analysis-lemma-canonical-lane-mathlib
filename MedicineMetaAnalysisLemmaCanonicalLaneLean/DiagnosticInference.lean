import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  positiveLikelihoodRatio : Prop
  negativeLikelihoodRatio : Prop
  diagnosticOddsRatio : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positiveLikelihoodRatioClosed : D.positiveLikelihoodRatio
  negativeLikelihoodRatioClosed : D.negativeLikelihoodRatio
  diagnosticOddsRatioClosed : D.diagnosticOddsRatio

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positiveLikelihoodRatio ∧ D.negativeLikelihoodRatio ∧ D.diagnosticOddsRatio

theorem diagnostic_inference_closed_from_evidence
    (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed $
    And.intro E.specificityClosed $
      And.intro E.positiveLikelihoodRatioClosed $
        And.intro E.negativeLikelihoodRatioClosed E.diagnosticOddsRatioClosed

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse