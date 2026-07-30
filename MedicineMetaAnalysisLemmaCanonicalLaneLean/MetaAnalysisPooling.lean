import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure MetaAnalysisPoolingPackage where
  fixedEffectModel : Prop
  randomEffectsModel : Prop
  heterogeneityStatistic : Prop
  publicationBiasTest : Prop
  forestPlot : Prop

structure MetaAnalysisPoolingEvidence (M : MetaAnalysisPoolingPackage) where
  fixedEffectModelClosed : M.fixedEffectModel
  randomEffectsModelClosed : M.randomEffectsModel
  heterogeneityStatisticClosed : M.heterogeneityStatistic
  publicationBiasTestClosed : M.publicationBiasTest
  forestPlotClosed : M.forestPlot

def MetaAnalysisPoolingClosed (M : MetaAnalysisPoolingPackage) : Prop :=
  M.fixedEffectModel ∧ M.randomEffectsModel ∧ M.heterogeneityStatistic ∧ M.publicationBiasTest ∧ M.forestPlot

theorem meta_analysis_pooling_closed_from_evidence
    (M : MetaAnalysisPoolingPackage) (E : MetaAnalysisPoolingEvidence M) :
    MetaAnalysisPoolingClosed M := by
  exact And.intro E.fixedEffectModelClosed $
    And.intro E.randomEffectsModelClosed $
      And.intro E.heterogeneityStatisticClosed $
        And.intro E.publicationBiasTestClosed E.forestPlotClosed

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse