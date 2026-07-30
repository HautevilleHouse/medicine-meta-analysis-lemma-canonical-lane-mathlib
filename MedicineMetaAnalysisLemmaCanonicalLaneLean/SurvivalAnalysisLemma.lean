import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure SurvivalModel where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  hazardNonnegative : ∀ t, hazardFunction t ≥ 0
  survivalDecreasing : ∀ t, survivalFunction t ≤ 1
  relation : ∀ t, survivalFunction t = Real.exp (-∫ s in (0:ℝ)..t, hazardFunction s)

structure SurvivalAnalysisEvidence (M : SurvivalModel) where
  hazardNonnegativeClosed : ∀ t, M.hazardFunction t ≥ 0
  survivalDecreasingClosed : ∀ t, M.survivalFunction t ≤ 1
  relationClosed : ∀ t, M.survivalFunction t = Real.exp (-∫ s in (0:ℝ)..t, M.hazardFunction s)

def SurvivalAnalysisClosed (M : SurvivalModel) : Prop :=
  (∀ t, M.hazardFunction t ≥ 0) ∧ (∀ t, M.survivalFunction t ≤ 1) ∧ (∀ t, M.survivalFunction t = Real.exp (-∫ s in (0:ℝ)..t, M.hazardFunction s))

theorem survival_analysis_closed_from_evidence (M : SurvivalModel) (E : SurvivalAnalysisEvidence M) : SurvivalAnalysisClosed M := by
  exact And.intro E.hazardNonnegativeClosed (And.intro E.survivalDecreasingClosed E.relationClosed)

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse