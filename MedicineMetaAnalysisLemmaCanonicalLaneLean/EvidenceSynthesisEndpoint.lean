import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure EvidenceSynthesisEndpointPackage where
  evidenceSynthesisComplete : Prop
  evidenceGapIdentified : Prop
  evidenceQualityAssessed : Prop
  evidenceStrengthGraded : Prop
  recommendationDerived : Prop

structure EvidenceSynthesisEndpointEvidence (E : EvidenceSynthesisEndpointPackage) where
  evidenceSynthesisCompleteClosed : E.evidenceSynthesisComplete
  evidenceGapIdentifiedClosed : E.evidenceGapIdentified
  evidenceQualityAssessedClosed : E.evidenceQualityAssessed
  evidenceStrengthGradedClosed : E.evidenceStrengthGraded
  recommendationDerivedClosed : E.recommendationDerived

def EvidenceSynthesisEndpointClosed (E : EvidenceSynthesisEndpointPackage) : Prop :=
  E.evidenceSynthesisComplete ∧ E.evidenceGapIdentified ∧
  E.evidenceQualityAssessed ∧ E.evidenceStrengthGraded ∧ E.recommendationDerived

theorem evidence_synthesis_endpoint_closed_from_evidence
    (E : EvidenceSynthesisEndpointPackage) (Ev : EvidenceSynthesisEndpointEvidence E) :
    EvidenceSynthesisEndpointClosed E := by
  exact And.intro Ev.evidenceSynthesisCompleteClosed
    (And.intro Ev.evidenceGapIdentifiedClosed
      (And.intro Ev.evidenceQualityAssessedClosed
        (And.intro Ev.evidenceStrengthGradedClosed Ev.recommendationDerivedClosed)))

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse