import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure MetaAnalysisModelPackage where
  fixedEffectModel : Prop
  randomEffectsModel : Prop
  heterogeneityMeasure : Prop
  publicationBiasAssessment : Prop
  forestPlotConstruction : Prop
  summaryEffectEstimate : Prop

structure MetaAnalysisModelEvidence (M : MetaAnalysisModelPackage) where
  fixedEffectModelClosed : M.fixedEffectModel
  randomEffectsModelClosed : M.randomEffectsModel
  heterogeneityMeasureClosed : M.heterogeneityMeasure
  publicationBiasAssessmentClosed : M.publicationBiasAssessment
  forestPlotConstructionClosed : M.forestPlotConstruction
  summaryEffectEstimateClosed : M.summaryEffectEstimate

def MetaAnalysisModelClosed (M : MetaAnalysisModelPackage) : Prop :=
  M.fixedEffectModel ∧ M.randomEffectsModel ∧ M.heterogeneityMeasure ∧
  M.publicationBiasAssessment ∧ M.forestPlotConstruction ∧ M.summaryEffectEstimate

theorem meta_analysis_model_closed_from_evidence
    (M : MetaAnalysisModelPackage) (E : MetaAnalysisModelEvidence M) :
    MetaAnalysisModelClosed M := by
  exact And.intro E.fixedEffectModelClosed
    (And.intro E.randomEffectsModelClosed
      (And.intro E.heterogeneityMeasureClosed
        (And.intro E.publicationBiasAssessmentClosed
          (And.intro E.forestPlotConstructionClosed E.summaryEffectEstimateClosed))))

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse