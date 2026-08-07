---
title: Why Reasoning Is Effective with LLMs -- Literature Report
updated: 2026-08-07
layout: about
---

# Why Reasoning Is Effective with LLMs: A Literature Report

> Collects and summarizes recent ACL-anthology research (2024–2026) that tries to answer a deceptively simple question: **why does explicit reasoning — chain-of-thought, graph-of-thought, self-correction — actually help large language models (LLMs) perform better?**
>
> Rather than catalog *that* reasoning helps, these papers dig into the *mechanisms*: causal structure, heuristic/rational strategy shifts, internal chain structure, verification, and representation. The evidence converges on a single picture — reasoning steps are effective because they turn latent, implicit knowledge into *organized, causally-aligned, self-monitored* computation.

---

## Methodology

Using the **gengomcp** MCP tool suite backed by the ACL Anthology index (44,921 papers):

1. **`search_papers`** — Ran semantic queries such as
   *"why reasoning is effective with LLMs"*, *"how likely do LLMs with CoT mimic human reasoning"*,
   *"why does chain of thought help"*, *"verification / self-correction / reflection reasoning"*, and
   *"large language model reasoning emergence"*, filtered to `year >= 2024`.
2. **`get_paper`** — Fetched full abstracts plus structured summaries
   (`overview` / `challenge` / `approach` / `outcome`) and method/task entities for the 12 most
   on-topic papers.
3. **`get_collection_info`** — Confirmed the schema and filterable fields (venue, year,
   `field_of_studies`, `collection_acronym`).

**Coverage:** Papers tagged with the `Reasoning` / `Language Models` fields, published at
**ACL, EMNLP, NAACL, EACL, COLING, Findings, and TACL** between **2024 and 2026**. Note that the
collection already indexes early 2026 materials (ACL 2026, EACL 2026, Findings ACL/EMNLP 2026),
so a few 2026 tutorial/survey papers are included alongside the 2024–2025 core. Two tutorial
abstracts (`"Cognitive Effects and Biases in LLMs"`, `"Current Advances in LLM Reasoning"`) are
used as framing references.

---

## The 8 Mechanism-Focused Papers

| # | Paper | Venue / Year | Why it speaks to "why reasoning works" |
|---|-------|---------------|----------------------------------------|
| 1 | Are Emergent Abilities in LLMs just In-Context Learning? *— Lu et al.* | ACL 2024 | Reframes CoT's "emergent" boost as amplified in-context learning + memory, not magic. |
| 2 | How Likely Do LLMs with CoT Mimic Human Reasoning? *— Bao et al.* | COLING 2025 | CoT works by aligning inference into a causal chain; ICL strengthens it, post-training can weaken it. |
| 3 | First Heuristic Then Rational *— Aoki et al.* | EMNLP 2024 | LMs start heuristic, grow rational — the step structure lets them converge. |
| 4 | What Makes a Good Reasoning Chain? *— Jiang et al.* | EMNLP 2025 | Good chains *structurally* (explore/backtrack/verify); structure predicts correctness. |
| 5 | GoT: Effective Graph-of-Thought Reasoning *— Yao et al.* | Findings NAACL 2024 | Human thought is non-linear; graph structure beats linear chains. |
| 6 | Bi-Chainer: Bidirectional Chaining *— Liu et al.* | Findings ACL 2024 | Reasoning in both directions reuses intermediates as guidance → more accurate + efficient. |
| 7 | Small LMs Need Strong Verifiers to Self-Correct *— Zhang et al.* | Findings ACL 2024 | Self-correction amplifies reasoning, but verification quality is the bottleneck. |
| 8 | Unlocking General Long CoT via Representation Engineering *— Tang et al.* | ACL 2025 | Long CoT is a generalizable *representation*, distinct from vanilla CoT. |

---

## Finding 1 — "Emergence" is Amplified In-Context Learning, Not Magic

**Paper:** Lu, Bigoulaeva, Sachdeva, Tayyar Madabushi, Gurevych — *"Are Emergent Abilities in Large Language Models just In-Context Learning?"* (ACL 2024)

> **Claim:** What is popularly called "emergent abilities" (including the CoT reasoning jump) are **not truly emergent**. They are the product of three confounded, non-magical factors: **in-context learning**, **model memory**, and **linguistic knowledge**.

- The authors formalize a theory that separates a *genuinely emergent* capability from artifacts of prompting, and they **substantiate it with 1,000+ experiments** across model scales and tasks.
- Because chain-of-thought is nothing more than an in-context prompt with intermediate steps, its benefit is explained by the model following a structured **demonstration** it has seen during pretraining — not by a phase transition in the weights.
- **Implication for "why reasoning works":** CoT's value lies in *organizing* the model's existing in-context knowledge into a step-wise scaffold. The "reasoning" is largely the model doing structured pattern-matching over its memory of how problems are solved.

---

## Finding 2 — CoT Aligns Inference with a Causal Chain

**Paper:** Bao, Zhang, Wang, Yang, Zhang — *"How Likely Do LLMs with CoT Mimic Human Reasoning?"* (COLING 2025)

> **Claim:** CoT improves performance because it induces an **instruction → reasoning → answer** causal chain; deviation from that chain produces spurious correlations and consistency errors.

- The authors use **causal analysis** to map the relationships between problem instruction, intermediate reasoning, and the final answer in LLMs, benchmarking against human reasoning.
- **Drivers of a stronger causal structure:**
  - **In-context learning with examples** → *strengthens* the causal chain.
  - **Post-training** (supervised fine-tuning, RLHF) → *weakens* it.
  - **Larger model size alone** → does *not* strengthen it (a key surprise).
- **Implication for "why reasoning works":** The step-wise format works as a *causal regularization*: by forcing the answer to flow through explicit reasoning, the model's output becomes more dependent on the problem than on shortcuts. But the effect is fragile — it depends on how the model was trained and prompted, not on scale.

---

## Finding 3 — LMs Dynamically Combine Heuristics and Rationality

**Paper:** Aoki, Kudo, Kuribayashi, Sone, Taniguchi, Sakaguchi, Inui — *"First Heuristic Then Rational"* (EMNLP 2024)

> **Claim:** In multi-step reasoning, LMs **rely on heuristics (e.g., lexical overlap) early** and **shift toward rational strategies near the final answer**; they track only a *limited* number of future steps.

- Controlled experiments show a systematic **early-heuristic → late-rational** trajectory within a single CoT.
- The model does not plan the full chain; it "looks ahead" a bounded horizon and blends cheap heuristics with deliberate reasoning — dynamically.
- **Implication for "why reasoning works":** The step structure accommodates the model's *myopic* planning horizon. Rather than one grand logical derivation, CoT succeeds by letting the model alternate fast heuristics with slowing-down near the payoff, mirroring bounded-rational human problem solving. This also predicts *where* chains fail: at long-horizon, multi-step dependency points.

---

## Finding 4 — The *Structure* of a Reasoning Chain Predicts Correctness

**Paper:** Jiang, Liu, Li, Bi, Zhang, Song, Wei, Lian — *"What Makes a Good Reasoning Chain? Uncovering Structural Patterns in Long Chain-of-Thought Reasoning"* (EMNLP 2025)

> **Claim:** Good reasoning chains have a detectable **internal structure** — exploration, backtracking, and verification — and these patterns *predict* final-answer correctness better than the content alone.

- The authors introduce **LCoT2Tree**, an automated framework that converts sequential long-CoCs into **hierarchical tree structures** and analyzes them with **graph neural networks (GNNs)**.
- Patterns that correlate with correctness: explicit **exploration** (considering alternatives), **backtracking** (revisiting nodes), and **verification** (re-checking conclusions).
- Failures map to identifiable anti-patterns such as **over-branching** (excessive, unhelpful exploration) — surfaced via an explainability layer.
- Practical payoff: the structural signals improve **Best-of-N** decoding effectiveness.
- **Implication for "why reasoning works":** Reasoning is effective not just because steps are generated, but because *well-structured* steps — that explore, retreat, and double-check — are self-monitoring. The structure itself is a correctness prior.

---

## Finding 5 — Reasoning as a Graph, Not a Chain

**Paper:** Yao, Li, Zhao — *"GoT: Effective Graph-of-Thought Reasoning in Language Models"* (Findings NAACL 2024)

> **Claim:** Human thought is **non-linear**; modeling thoughts as a **graph** (nodes = thought units, edges = relations) outperforms linear chains.

- **Graph-of-Thought (GoT)** replaces the chain with a two-stage framework: a **GoT encoder** builds a graph representation of thoughts, fused with the input via a **gated fusion mechanism**.
- Empirical gains over strong CoT baselines:
  - **AQUA-RAT** (text-only reasoning): significant improvement over CoT.
  - **ScienceQA** (multimodal): accuracy lifted **85.19% → 87.59%** vs. the prior best Multimodal-CoT using a T5-base model.
- **Implication for "why reasoning works":** The linear chain is a simplification. When a problem's natural decomposition is a graph, representing reasoning as a graph — with branching, merging, and re-use of intermediate conclusions — directly raises accuracy. Structure that matches the problem wins.

---

## Finding 6 — Reasoning in Both Directions

**Paper:** Liu, He, Song — *"Bi-Chainer: Automated LLM Reasoning with Bidirectional Chaining"* (Findings ACL 2024)

> **Claim:** **Bidirectional chaining** — switching reasoning direction at branching points — yields more accurate and efficient reasoning than unidirectional chains.

- Where a forward or backward chain hits multiple branches, Bi-Chainer **dynamically switches depth-first reasoning to the opposite direction**, using intermediate results as guidance to prune poor branches.
- Across **four challenging logical reasoning datasets**, Bi-Chainer delivers **sizable accuracy gains** over unidirectional frameworks, with **more accurate intermediate proof steps** and **fewer inference calls** (i.e., less wasted computation).
- **Implication for "why reasoning works":** A single reasoning direction wastes effort retracing dead ends. Bidirectional, guided search makes each generated step *count*, converting verbose generation into targeted computation.

---

## Finding 7 — Self-Correction Needs Strong Verifiers

**Paper:** Zhang, Khalifa, Logeswaran, Kim, Lee, Lee, Wang — *"Small Language Models Need Strong Verifiers to Self-Correct Reasoning"* (Findings ACL 2024)

> **Claim:** Self-correction boosts reasoning, but **verification quality is the bottleneck** — small LMs need a *strong verifier* (e.g., GPT-4) to know when and how to correct themselves.

- The paper's pipeline: (1) prompt smaller LMs to **critique their own incorrect responses** using correct solutions as guidance; (2) **filter** the generated critiques; (3) **supervised fine-tune** a self-correcting reasoner via solution refinement.
- Results: improved self-correction on **five datasets** spanning math and commonsense reasoning — **notable gains with a strong GPT-4 verifier**, but **limitations when relying on a weak self-verifier**.
- **Implication for "why reasoning works":** A reasoning chain is not a one-shot event. Self-correction lets the model *repair* its chain, but the repair signal (the verifier) must be strong enough to catch errors that the model itself cannot. Effectiveness of reasoning thus partly *delegates* to the quality of the check, not just the generation.

---

## Finding 8 — Long CoT as a Generalizable Representation

**Paper:** Tang, Wang, Lv, Min, Zhao, Hu, Liu, Zhang — *"Unlocking General Long Chain-of-Thought Reasoning Capabilities of Large Language Models via Representation Engineering"* (ACL 2025)

> **Claim:** Long chain-of-thought is a **general, transferable capability** encoded in the model's representations — distinct from vanilla CoT, and transferable across tasks.

- The authors study the question **from the perspective of representations**: is long CoT a general skill, or task-specific?
- They find long CoT reasoning **is encoded as a general capability**, clearly distinguishable from vanilla (short) CoT in the representations, and that **domain-specific representations** are required for effective *cross-task* transfer.
- They propose **GLORE**, a representation-engineering method that "unlocks" this capability, showing **effective and efficient gains in both in-domain and cross-domain** settings.
- **Implication for "why reasoning works":** Extended reasoning doesn't just produce text — it produces a **representational state** that generalizes. The reason long CoT helps is that it steers the model into a representation regime that is reusable, not merely a longer string of guesses.

---

## Cross-Cutting Themes

1. **CoT = structured in-context learning.** The "reasoning" boost is mostly the model following an organized demonstration scaffold (Finding 1, 2). It is powerful but *mechanical*, not an emergent logic engine.
2. **Causality over correlation.** CoT's best effect comes when it forces the answer to *causally depend* on the problem through intermediate steps (Finding 2). This is why ICL strengthens it and blind scale-up does not.
3. **Bounded rationality.** LMs are myopic planners that mix heuristics and rationality across steps (Finding 3). Effective reasoning accommodates this rather than assuming perfect logical derivation.
4. **Structure is a correctness prior.** Chains that structurally *explore, backtrack, and verify* are more correct than content-rich but structurally flat chains (Finding 4). The *shape* of reasoning matters.
5. **Match structure to the problem.** Graphs beat chains on non-linear problems; bidirectional search beats one-directional chains (Findings 5, 6). Effectiveness scales with how well the reasoning format matches the problem's true structure.
6. **Verification closes the loop.** Self-correction amplifies reasoning, but only as far as the verifier can see — a strong external verifier is often needed (Finding 7).
7. **Reasoning forms a transferable representation.** Long CoT moves the model into a representation regime that generalizes across tasks (Finding 8), explaining cross-task transfer.

---

## Synthesis: Why Is Reasoning Effective with LLMs?

The convergence across these 2024–2026 papers is striking: **reasoning is effective not because it injects genuine logic, but because it gives the model a structured, causally-aligned, self-monitoring, and transferable way to deploy its existing knowledge.** Concretely:

- **It organizes latent knowledge** (Finding 1) by scaffolding in-context learning into explicit steps.
- **It regularizes inference** (Finding 2) so the answer is more causally tied to the problem and less to shortcuts.
- **It matches the model's bounded planning horizon** (Finding 3), letting heuristics and rationality alternate across steps.
- **It makes the chain self-diagnosable** (Finding 4) through structures like exploration/backtracking/verification.
- **It adapts format to problem structure** (Findings 5, 6) — graphs and bidirectional search where they fit.
- **It adds a repair mechanism** (Finding 7) via self-correction gated by verification.
- **It cultivates a reusable representation** (Finding 8) that transfers across tasks.

Put together: **reasoning works because it externalizes and organizes the model's latent computation into a form that is causal, structured, checkable, and generalizable** — less "logic" and more "organized recall + self-monitoring."

---

## Framing References (Surveys & Tutorials)

These do not directly test *why* reasoning works, but they define the vocabulary and agenda the mechanism papers above sit within:

- **Arora, Chaudhary, Kreutzer, Potamitis, Dziri, Tandon — *"Current Advances in LLM Reasoning"*** (ACL 2026 tutorial). Surveys evaluation strategies and two improvement families: (a) inference-time methods (structured + self-improvement) and (b) post-training methods (RLHF/DPO/GRPO) that push LLMs to "think more like humans."
- **Xia, Wang, Liu, Li, Yu, Chen, McAuley, Li — *"Beyond Chain-of-Thought: A Survey of Chain-of-X Paradigms for LLMs"*** (COLING 2025). Catalogs the CoX family (CoT, CoE, CoS, ...) as a broad research program beyond plain step generation.
- **Schedl, Hertwig, Tommasel, Masoudian — *"Cognitive Effects and Biases in Large Language Models"*** (EACL 2026 tutorial). Bridges psychology and NLP to frame reasoning in LLMs through the lens of cognitive biases and dual-process theory — directly echoing the "heuristic + rational" finding above.

---

## Limitations & Open Questions

- Most mechanism studies are **empirical and correlational** (e.g., causal-structure analysis, structural-pattern predictors); few establish *interventionist* causation.
- The **"heuristic early, rational late"** pattern (Finding 3) and **"strong verifier needed"** (Finding 7) suggest a unifying open problem: how to make the *cheap early stages* more reliable so self-correction has less to fix.
- **Scale alone does not explain it** (Findings 1, 2) — yet the role of **representation engineering** (Finding 8) hints that *where* the model ends up in activation space, not how big it is, may be the deeper lever.
- There is limited work on **non-autoregressive / parallel** reasoning structures; the field remains heavily biased toward sequential generation even when graphs/bidirectional search help.

---

## References

> Paper titles link to their ACL Anthology pages where a DOI/URL is available.

1. Sheng Lu, Irina Bigoulaeva, Rachneet Sachdeva, Harish Tayyar Madabushi, Iryna Gurevych. **Are Emergent Abilities in Large Language Models just In-Context Learning?** *ACL 2024*. https://aclanthology.org/2024.acl-long.279
2. Guangsheng Bao, Hongbo Zhang, Cunxiang Wang, Linyi Yang, Yue Zhang. **How Likely Do LLMs with CoT Mimic Human Reasoning?** *COLING 2025*. https://aclanthology.org/2025.coling-main.524
3. Yoichi Aoki, Keito Kudo, Tatsuki Kuribayashi, Shusaku Sone, Masaya Taniguchi, Keisuke Sakaguchi, Kentaro Inui. **First Heuristic Then Rational: Dynamic Use of Heuristics in Language Model Reasoning.** *EMNLP 2024*. https://aclanthology.org/2024.emnlp-main.789
4. Gangwei Jiang, Yahui Liu, Zhaoyi Li, Wei Bi, Fuzheng Zhang, Linqi Song, Ying Wei, Defu Lian. **What Makes a Good Reasoning Chain? Uncovering Structural Patterns in Long Chain-of-Thought Reasoning.** *EMNLP 2025*. https://aclanthology.org/2025.emnlp-main.329
5. Yao Yao, Zuchao Li, Hai Zhao. **GoT: Effective Graph-of-Thought Reasoning in Language Models.** *Findings of NAACL 2024*. https://aclanthology.org/2024.findings-naacl.183
6. Shuqi Liu, Bowei He, Linqi Song. **Bi-Chainer: Automated Large Language Models Reasoning with Bidirectional Chaining.** *Findings of ACL 2024*. https://aclanthology.org/2024.findings-acl.507
7. Yunxiang Zhang, Muhammad Khalifa, Lajanugen Logeswaran, Jaekyeom Kim, Moontae Lee, Honglak Lee, Lu Wang. **Small Language Models Need Strong Verifiers to Self-Correct Reasoning.** *Findings of ACL 2024*. https://aclanthology.org/2024.findings-acl.924
8. Xinyu Tang, Xiaolei Wang, Zhihao Lv, Yingqian Min, Xin Zhao, Binbin Hu, Ziqi Liu, Zhiqiang Zhang. **Unlocking General Long Chain-of-Thought Reasoning Capabilities of Large Language Models via Representation Engineering.** *ACL 2025*. https://aclanthology.org/2025.acl-long.339

### Framing surveys & tutorials

9. Akhil Arora, Vishrav Chaudhary, Julia Kreutzer, Nearchos Potamitis, Nouha Dziri, Niket Tandon. **Current Advances in LLM Reasoning.** *ACL 2026 (Tutorial)*. https://aclanthology.org/2026.acl-tutorials.4
10. Yu Xia, Rui Wang, Xu Liu, Mingyan Li, Tong Yu, Xiang Chen, Julian McAuley, Shuai Li. **Beyond Chain-of-Thought: A Survey of Chain-of-X Paradigms for LLMs.** *COLING 2025*. https://aclanthology.org/2025.coling-main.719
11. Markus Schedl, Ralph Hertwig, Antonela Tommasel, Shahed Masoudian. **Cognitive Effects and Biases in Large Language Models.** *EACL 2026 (Tutorial)*. https://doi.org/10.18653/v1/2026.eacl-tutorials.2

---

*This report was generated via the gengomcp MCP server over the ACL Anthology index. As with other reports in this folder, the findings are synthesized from the indexed abstracts and structured summaries and have not been independently validated against the full papers.*
