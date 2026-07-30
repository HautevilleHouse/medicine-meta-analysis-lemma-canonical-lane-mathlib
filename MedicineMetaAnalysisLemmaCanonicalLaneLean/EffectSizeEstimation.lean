import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure EffectSizeEstimationPackage where
  meanDifference : Prop
  standardizedMeanDifference : Prop
  oddsRatio : Prop
  riskRatio : Prop
  correlationCoefficient : Prop

structure EffectSizeEstimationEvidence (E : EffectSizeEstimationPackage) where
  meanDifferenceClosed : E.meanDifference
  standardizedMeanDifferenceClosed : E.standardizedMeanDifference
  oddsRatioClosed : E.oddsRatio
  riskRatioClosed : E.riskRatio
  correlationCoefficientClosed : E.correlationCoefficient

def EffectSizeEstimationClosed (E : EffectSizeEstimationPackage) : Prop :=
  E.meanDifference ∧ E.standardizedMeanDifference ∧ E.oddsRatio ∧ E.riskRatio ∧ E.correlationCoefficient

theorem effect_size_estimation_closed_from_evidence
    (E : EffectSizeEstimationPackage) (Ev : EffectSizeEstimationEvidence E) :
    EffectSizeEstimationClosed E := by
  exact And.intro Ev.meanDifferenceClosed $
    And.intro Ev.standardizedMeanDifferenceClosed $
      And.intro Ev.oddsRatioClosed $
        And.intro Ev.riskRatioClosed Ev.correlationCoefficientClosed

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse