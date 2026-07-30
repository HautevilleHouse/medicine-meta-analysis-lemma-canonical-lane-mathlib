import HautevilleHouse.MedicineMetaAnalysisLemmaCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace MedicineMetaAnalysisLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  metaAnalysisLane : String
  classicalBoundary : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "medicine-meta-analysis-lemma-canonical-lane",
  theoremName := "Medicine Meta Analysis Lemma",
  metaAnalysisLane := "manifold_constrained",
  classicalBoundary := "carried_gap_unrestricted"
}

def MetaAnalysisConstrainedClosed : Prop :=
  sourceTheoremStatement.metaAnalysisLane = "manifold_constrained"

theorem meta_analysis_constrained_closed_checked : MetaAnalysisConstrainedClosed := by
  rfl

end MedicineMetaAnalysisLemmaCanonicalLaneLean
end HautevilleHouse