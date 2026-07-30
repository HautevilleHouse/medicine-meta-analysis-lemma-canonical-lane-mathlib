import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure SurvivalModelPackage where
  survivalCurve : Prop
  hazardFunction : Prop
  censoringMechanism : Prop
  proportionalHazardsAssumption : Prop
  logRankTestStatistic : Prop

structure SurvivalModelEvidence (S : SurvivalModelPackage) where
  survivalCurveClosed : S.survivalCurve
  hazardFunctionClosed : S.hazardFunction
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  logRankTestStatisticClosed : S.logRankTestStatistic

def SurvivalModelClosed (S : SurvivalModelPackage) : Prop :=
  S.survivalCurve ∧ S.hazardFunction ∧ S.censoringMechanism ∧
  S.proportionalHazardsAssumption ∧ S.logRankTestStatistic

theorem survival_model_closed_from_evidence (S : SurvivalModelPackage)
    (E : SurvivalModelEvidence S) : SurvivalModelClosed S := by
  exact And.intro E.survivalCurveClosed
    (And.intro E.hazardFunctionClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.proportionalHazardsAssumptionClosed
          E.logRankTestStatisticClosed)))

structure MetaAnalysisPoolingPackage (S : SurvivalModelPackage) where
  pooledHazardRatio : Prop
  heterogeneityStatistic : Prop
  fixedEffectsEstimate : Prop
  randomEffectsEstimate : Prop
  publicationBiasAssessment : Prop

structure MetaAnalysisPoolingEvidence {S : SurvivalModelPackage}
    (M : MetaAnalysisPoolingPackage S) where
  pooledHazardRatioClosed : M.pooledHazardRatio
  heterogeneityStatisticClosed : M.heterogeneityStatistic
  fixedEffectsEstimateClosed : M.fixedEffectsEstimate
  randomEffectsEstimateClosed : M.randomEffectsEstimate
  publicationBiasAssessmentClosed : M.publicationBiasAssessment

def MetaAnalysisPoolingClosed {S : SurvivalModelPackage}
    (M : MetaAnalysisPoolingPackage S) : Prop :=
  M.pooledHazardRatio ∧ M.heterogeneityStatistic ∧
  M.fixedEffectsEstimate ∧ M.randomEffectsEstimate ∧
  M.publicationBiasAssessment

theorem meta_analysis_pooling_closed_from_evidence {S : SurvivalModelPackage}
    (M : MetaAnalysisPoolingPackage S)
    (E : MetaAnalysisPoolingEvidence M) : MetaAnalysisPoolingClosed M := by
  exact And.intro E.pooledHazardRatioClosed
    (And.intro E.heterogeneityStatisticClosed
      (And.intro E.fixedEffectsEstimateClosed
        (And.intro E.randomEffectsEstimateClosed
          E.publicationBiasAssessmentClosed)))

end HautevilleHouse
end MedicineMetaAnalysisLemmaCanonicalLaneLean