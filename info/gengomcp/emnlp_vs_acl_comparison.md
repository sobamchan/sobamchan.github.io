# ACL vs EMNLP: Comparative Research Topic Trend Analysis (2024–2026)

## Methodology

Using the **gengomcp** MCP tool suite:

1. **`get_collection_info`** — Confirmed the collection schema (44,921 papers, filterable by `collection_acronym: EMNLP|ACL` and `year`).
2. **`list_papers`** — Retrieved 150 paper records from each of four datasets via `collection_acronym` + `year` filters, using offset-based pagination (2×100 calls per year).
3. **`get_paper`** — Fetched full abstracts, field-of-study tags, and structured summaries (overview/challenge/approach/outcome) for 14 representative papers across all four years.

**Datasets analyzed:**

| Dataset | Papers | Years Covered |
|---|---|---|
| ACL 2026 | 149 | Proceedings of the 64th Annual Meeting of ACL (long papers, industry track, system demos) |
| ACL 2025 | 149 | Proceedings of the 63rd Annual Meeting of ACL |
| EMNLP 2025 | 150 | Proceedings of the 2025 Conference on Empirical Methods in NLP |
| EMNLP 2024 | 150 | Proceedings of the 2024 Conference on Empirical Methods in NLP |

---

## Quantitative Analysis

### Field-of-Study Tag Distribution (150 papers each)

| Field of Study | ACL 2026 | ACL 2025 | EMNLP 2025 | EMNLP 2024 |
|---|---:|---:|---:|---:|
| **Language Models** | 26 (17%) | 25 (17%) | 33 (22%) | 38 (25%) |
| **Semantic Text Processing** | 13 (9%) | 21 (14%) | 16 (11%) | 23 (15%) |
| **Multimodality** | 22 (15%) | 16 (11%) | 11 (7%) | 15 (10%) |
| **Reasoning** | 12 (8%) | 6 (4%) | 19 (13%) | 11 (7%) |
| **Responsible & Trustworthy NLP** | 17 (11%) | 19 (13%) | 18 (12%) | 11 (7%) |
| **Information Retrieval** | 7 (5%) | 7 (5%) | 1 (1%) | 3 (2%) |
| **Robustness in NLP** | 4 (3%) | 3 (2%) | 5 (3%) | 0 (0%) |
| **Explainability & Interpretability** | 3 (2%) | 0 (0%) | 1 (1%) | 2 (1%) |
| **Green & Sustainable NLP** | 4 (3%) | 1 (1%) | 4 (3%) | 3 (2%) |
| **Text Generation** | 6 (4%) | 4 (3%) | 5 (3%) | 6 (4%) |
| **Structured Data in NLP** | 2 (1%) | 0 (0%) | 0 (0%) | 2 (1%) |
| **Multilinguality** | 2 (1%) | 1 (1%) | 6 (4%) | 2 (1%) |
| *(no field tag)* | 16 (11%) | 21 (14%) | 17 (11%) | 11 (7%) |

### Keyword-Level Topic Analysis

| Topic | ACL 2026 | ACL 2025 | EMNLP 2025 | EMNLP 2024 | ACL YoY | EMNLP YoY |
|---|---:|---:|---:|---:|---:|---:|
| **Reasoning & Math** | 22 (15%) | 17 (11%) | 28 (19%) | 8 (5%) | +3.3pp | **+13.3pp** |
| **Benchmarks & Evaluation** | 23 (15%) | 18 (12%) | 23 (15%) | 16 (11%) | +3.3pp | +4.7pp |
| **LLM & Language Models** (general) | 66 (44%) | 58 (39%) | 73 (49%) | 84 (56%) | +5.3pp | −7.3pp |
| **RL & Reinforcement Learning** | 14 (9%) | 5 (3%) | 4 (3%) | 0 (0%) | **+6.0pp** | +2.7pp |
| **Code Generation** | 15 (10%) | 4 (3%) | 6 (4%) | 7 (5%) | **+7.3pp** | −0.7pp |
| **Multi-Agent Systems** | 17 (11%) | 9 (6%) | 12 (8%) | 8 (5%) | **+5.3pp** | +2.7pp |
| **Multimodality** | 15 (10%) | 18 (12%) | 15 (10%) | 12 (8%) | −2.0pp | +2.0pp |
| **RAG & Retrieval** | 12 (8%) | 11 (7%) | 12 (8%) | 12 (8%) | +0.7pp | 0.0pp |
| **Safety & Security** | 11 (7%) | 11 (7%) | 6 (4%) | 10 (7%) | 0.0pp | −2.7pp |
| **Alignment & Fairness** | 9 (6%) | 13 (9%) | 10 (7%) | 8 (5%) | −2.7pp | +1.3pp |
| **Summarization & Text Gen** | 12 (8%) | 13 (9%) | 12 (8%) | 15 (10%) | −0.7pp | −2.0pp |
| **Interpretabilty** | 1 (1%) | 1 (1%) | 3 (2%) | 5 (3%) | 0.0pp | −1.3pp |
| **Low-Resource & Multilingual** | 3 (2%) | 5 (3%) | 4 (3%) | 8 (5%) | −1.3pp | −2.7pp |
| **Dialogue & Interaction** | 7 (5%) | 5 (3%) | 3 (2%) | 7 (5%) | +1.3pp | −2.7pp |
| **Knowledge & Graph** | 6 (4%) | 7 (5%) | 5 (3%) | 2 (1%) | −0.7pp | +2.0pp |

> **Note:** Papers can appear in multiple categories. Some papers appear in multiple categories due to intersecting themes (e.g., "Reinforcement Learning for Diffusion LLMs" counts under both RL and Multimodality).

---

## Year-over-Year Conference Comparisons

### ACL: 2025 → 2026 (most aggressive evolution)

| Trend | 2025 | 2026 | Change |
|---|---|---|---|
| **Code Generation** | 4 (3%) | 15 (10%) | ⬆️ +7.3pp — **largest increase** |
| **RL & Reinforcement Learning** | 5 (3%) | 14 (9%) | ⬆️ +6.0pp |
| **LLM & Language Models** | 58 (39%) | 66 (44%) | ⬆️ +5.3pp |
| **Multi-Agent Systems** | 9 (6%) | 17 (11%) | ⬆️ +5.3pp |
| **Reasoning & Math** | 17 (11%) | 22 (15%) | ⬆️ +3.3pp |
| **Benchmarks & Evaluation** | 18 (12%) | 23 (15%) | ⬆️ +3.3pp |
| **Alignment & Fairness** | 13 (9%) | 9 (6%) | ⬇️ −2.7pp |
| **Multimodality** | 18 (12%) | 15 (10%) | ⬇️ −2.0pp |

### EMNLP: 2024 → 2025

| Trend | 2024 | 2025 | Change |
|---|---|---|---|
| **Reasoning & Math** | 8 (5%) | 28 (19%) | ⬆️ **+13.3pp — single largest change across both conferences** |
| **Benchmarks & Evaluation** | 16 (11%) | 23 (15%) | ⬆️ +4.7pp |
| **RL & Reinforcement Learning** | 0 (0%) | 4 (3%) | ⬆️ +2.7pp |
| **Multi-Agent Systems** | 8 (5%) | 12 (8%) | ⬆️ +2.7pp |
| **Multimodality** | 12 (8%) | 15 (10%) | ⬆️ +2.0pp |
| **Knowledge & Graph** | 2 (1%) | 5 (3%) | ⬆️ +2.0pp |
| **Alignment & Fairness** | 8 (5%) | 10 (7%) | ⬆️ +1.3pp |
| **LLM & Language Models** | 84 (56%) | 73 (49%) | ⬇️ −7.3pp — **largest decrease** |
| **Summarization & Text Gen** | 15 (10%) | 12 (8%) | ⬇️ −2.0pp |
| **Interpretability** | 5 (3%) | 3 (2%) | ⬇️ −1.3pp |
| **Low-Resource & Multilingual** | 8 (5%) | 4 (3%) | ⬇️ −2.7pp |

---

## Conference-Level Comparison: ACL 2026 vs EMNLP 2025

| Topic | ACL 2026 | EMNLP 2025 | Difference | Implication |
|---|---:|---:|---:|---|
| **RL & Reinforcement Learning** | 9% | 3% | 🔴 ACL +6.7pp | ACL invests heavily in RL as an engineering tool |
| **Code Generation** | 10% | 4% | 🔴 ACL +6.1pp | ACL leads in code-generation systems research |
| **Multi-Agent Systems** | 11% | 8% | 🔴 ACL +3.4pp | ACL more focused on multi-agent infrastructure |
| **Safety & Security** | 7% | 4% | 🔴 ACL +3.4pp | ACL has more dedicated safety work |
| **Dialogue & Interaction** | 5% | 2% | 🔴 ACL +2.7pp | ACL more focused on interactive agents |
| **Multimodality** | 10% | 10% | ↔️ Equal | Both conferences treat multimodal similarly in titles |
| **Reasoning & Math** | 15% | 19% | 🟢 EMNLP +3.9pp | **EMNLP leads in reasoning** |
| **LLM & Language Models** (general) | 44% | 49% | 🟢 EMNLP +4.4pp | EMNLP more model-centric |
| **Interpretability** | 1% | 2% | 🟢 EMNLP +1.3pp | EMNLP more interpretability |
| **Low-Resource & Multilingual** | 2% | 3% | 🟢 EMNLP +0.7pp | EMNLP retains more multilingual focus |

### Field-of-Study Comparison: ACL 2026 vs EMNLP 2025

| Field | ACL 2026 | EMNLP 2025 | Difference | Interpretation |
|---|---:|---:|---:|---|
| **Multimodality** | 22 (15%) | 11 (7%) | 🔴 ACL +11 | ACL more heavily invested in multimodal research |
| **Information Retrieval** | 7 (5%) | 1 (1%) | 🔴 ACL +6 | Unique ACL focus on IR/retrieval systems |
| **Language Models** | 26 (17%) | 33 (22%) | 🟢 EMNLP +7 | EMNLP more model-centric |
| **Reasoning** | 12 (8%) | 19 (13%) | 🟢 EMNLP +7 | **EMNLP leads in reasoning research** |
| **Semantic Text Processing** | 13 (9%) | 16 (11%) | 🟢 EMNLP +3 | EMNLP retains more traditional NLP tasks |
| **Responsible & Trustworthy NLP** | 17 (11%) | 18 (12%) | 🟢 EMNLP +1 | EMNLP slightly more safety-focused |
| **Responsible & Trustworthy NLP** | 17 (11%) | 18 (12%) | 🟢 EMNLP +1 | EMNLP slightly more responsible NLP |

---

## Qualitative Analysis: Conference Personality Differences

### ACL: Systems-First, Engineering-Oriented

ACL's research profile is dominated by **infrastructure building** and **systems integration**. The conference favors:
- **Mechanistic approaches** over behavioral studies
- **Engineering challenges** (scaling, efficiency, verification) over pure capability exploration
- **Multi-agent infrastructure** (NeuralFSM, MARS2, SILO-BENCH, EvoSpark)
- **Deployment-focused safety** (Backdoor Collapse via representation-space analysis, BlindGuard for unknown attacks)
- **Evaluation infrastructure** (Decentralized Arena for LLM-vs-LLM evaluation)

**Representative ACL 2026 papers:**

- **TRN-R1-Zero: Text-rich Network Reasoning via LLMs with Reinforcement Learning Only**
  > *Trains LLMs with RL only — no SFT, no CoT distillation. Uses Neighbour-aware Group Relative Policy Optimisation. Generalizes zero-shot from node-level to graph-level tasks.*
  > This exemplifies the ACL 2026 philosophy: RL as a self-contained training paradigm, not a supplement to human-generated data.

- **MARS2: Scaling Multi-Agent Tree Search via Reinforcement Learning for Code Generation**
  > *Multiple independently-optimized agents collaborate within a shared tree-structured search environment. Uses path-level group advantage formulation with tree-consistent reward shaping.*
  > Combines three ACL 2026 trends at once: RL + multi-agent + code generation.

- **Backdoor Collapse: Eliminating Unknown Threats via Known Backdoor Aggregation**
  > *Injects known backdoors into already-compromised models to aggregate representations, then recovers via fine-tuning. Reduces attack success rate to 4.41% with no clean accuracy loss.*
  > Safety is now a *mechanistic, representation-space problem* — not behavioral steering.

### EMNLP: Reasoning-Centric, Application-Oriented

EMNLP's profile is dominated by **deep reasoning research** and **task-specific innovation**. The conference favors:
- **Cognitive science integration** (mathematical games, metacognition, debate evaluation)
- **RL for reasoning** (GRPO-LEAD for math, DSG-MCTS for tree search)
- **Self-awareness and uncertainty** (Word Salad Chopper detects useless repetitions, Confidence-Aware Reasoning)
- **Application-specific agents** (web agents, scientific review agents)
- **Human-AI interaction** (debate evaluation, personality in LLM-generated text)

**Representative EMNLP 2025 papers:**

- **GRPO-LEAD: A Difficulty-Aware RL Approach for Concise Mathematical Reasoning**
  > *Enhances GRPO with length-regularized rewards, explicit penalties for incorrect solutions, and difficulty-aware advantage reweighting. Improves reasoning accuracy, conciseness, and efficiency.*
  > EMNLP's RL is about *making models better reasoners* — not about training infrastructure.

- **Word Salad Chopper: Reasoning Models Waste A Ton Of Decoding Budget On Useless Repetitions**
  > *LRMs are self-aware when trapped in repetition loops — hidden states of trailing tokens show detectable patterns. A single linear classifier detects word salad on-the-fly; a chop + regeneration prompt saves length with minimal quality loss.*
  > EMNLP's focus on *model self-awareness* and *intrinsic limitations* — very different from ACL's systems approach.

- **DSG-MCTS: Dynamic Strategy-Guided Monte Carlo Tree Search for Diversified Reasoning**
  > *Integrates multiple reasoning strategies (abductive, analogical) into MCTS with dynamic strategy selection. Outperforms fixed-strategy MCTS on challenging reasoning benchmarks.*
  > EMNLP treats reasoning as an *exploration problem* — very different from ACL's approach of using RL for code execution semantics.

- **WebInject: Prompt Injection Attack to Web Agents**
  > *Manipulates webpage pixels to induce web agents to perform attacker-specified actions. Uses a neural network to approximate the non-differentiable pixel-to-screenshot mapping, then applies projected gradient descent.*
  > EMNLP's security research is *attack-centric* and *multimodal* — finding vulnerabilities in deployed agent systems.

### EMNLP 2024 vs 2025: The Reasoning Revolution

The most dramatic intra-conference shift is EMNLP's **+13.3pp explosion in Reasoning & Math** (from 5% to 19%). In 2024, EMNLP papers on reasoning were sparse — mostly about long-context scaling (EAGLE-2), basic multilingual alignment, or simple alignment. By 2025, the conference was awash in:

- **Mathematical reasoning**: GRPO-LEAD, "Can LLMs Win the International Mathematical Games?"
- **Self-reflection on reasoning**: Word Salad Chopper, "Reasoning Traces Shape Outputs but Models Won't Say So"
- **Reasoning as search**: DSG-MCTS, "Confidence-Aware Reasoning"
- **Agentic reasoning**: "Teaching Small Models to Reason by Curriculum Distillation"

This suggests EMNLP 2025 was the conference where **reasoning became a mainstream research focus** — a full year before ACL 2026 fully embraced it.

**EMNLP 2024 foundational papers:**

- **MARCO: Multi-Agent Real-time Chat Orchestration**
  > *Production-focused multi-agent framework with robust guardrails for real-time chat. 94.48% accuracy on restaurant conversations, 44.91% latency improvement, 33.71% cost reduction.*
  > 2024 was about *making agents work in production* — 2025 is about *making agents reason deeply*.

- **Data Advisor: Dynamic Data Curation for Safety Alignment**
  > *LLM-based method that monitors generated data, identifies weaknesses, and advises next generation iteration. Improves safety of Mistral, Llama2, Falcon without sacrificing utility.*
  > 2024's approach: iterative data curation for alignment. 2025's approach: GRPO-LEAD for precise RL optimization.

---

## Year-by-Year Narrative

### EMNLP 2024: Foundations & Production
The 2024 EMNLP was characterized by:
- **Production deployment** (MARCO, EPO with Environment Preference Optimization)
- **Safety alignment via data curation** (Data Advisor, Course-Correction with synthetic preferences)
- **Efficiency optimization** (EAGLE-2: 5x speedup; SEGMENT+: short-context long-text processing; RevMUX for batch inference)
- **Foundational multilingual work** (spontaneous multilingual alignment, efficient unseen language adaptation)

### EMNLP 2025: The Reasoning Revolution
EMNLP 2025 saw:
- **Reasoning explosion** (+13.3pp, the single largest year-over-year change in the analysis) — mathematical games, MCTS, GRPO-LEAD, confidence-aware reasoning
- **Agent security emergence** — WebInject (prompt injection on web agents), ToolSafety (agent tool safety)
- **Self-awareness research** — Word Salad Chopper (models detect their own useless repetitions)
- **Code detection** — Droid (AI-generated code detection), CodeRAG (RAG for repo-level code)

### ACL 2025: Discovery & Behavioral Studies
ACL 2025 was characterized by:
- **Behavioral studies** (Conformity in LLMs, Agreeableness-driven sycophancy)
- **Large benchmark creation** (We-Math: 6.5K visual math problems, Chinese SafetyQA, MARS benchmark)
- **Agentic emergence** (Dolphin: closed-loop auto-research, OmniCharacter: speech-language personality)
- **Alignment as behavioral steering** (HAF-RM, MTSA multi-round red-teaming)

### ACL 2026: Systems Engineering
ACL 2026 shifted decisively toward:
- **Verifiable execution** (CODERL+ with execution semantics, ExecVerify with stepwise rewards)
- **Agent society engineering** (NeuralFSM with finite-state policies, MARS2 with tree-search, EvoSpark with agent societies)
- **Automated evaluation** (Decentralized Arena: LLM-vs-LLM democratic evaluation)
- **Mechanistic safety** (Backdoor Collapse via representation aggregation, BlindGuard)
- **Efficient inference** (CAT: confidence-adaptive reasoning, ConfSpec: speculative verification)

---

## Key Insights

### 1. EMNLP leads in reasoning; ACL leads in systems

The most striking finding is the **divergence in conference focus**:
- **EMNLP 2025**: 19% reasoning/math (vs ACL 2026's 15%) — EMNLP treats reasoning as its core mission
- **ACL 2026**: 10% code generation (vs EMNLP 2025's 4%), 9% RL (vs 3%), 11% multi-agent (vs 8%) — ACL treats systems integration as its core mission
- **Field tags confirm**: ACL 2026 has 22 multimodal papers (15%) vs EMNLP 2025's 11 (7%); ACL has 7 IR papers (5%) vs EMNLP's 1 (1%)

### 2. Both conferences are converging on RL, but for different purposes

| Conference | RL Motivation | Representative Papers |
|---|---|---|
| **ACL** | RL as a *training infrastructure* — replace SFT, enable self-improvement | TRN-R1-Zero (RL-only training), MARS2 (multi-agent tree search RL), KnowRL (knowledgeable RL for factuality) |
| **EMNLP** | RL as a *reasoning optimizer* — improve math, search, efficiency | GRPO-LEAD (math reasoning), DSG-MCTS (tree search for reasoning), Word Salad Chopper (self-awareness) |

### 3. The EMNLP Reasoning Explosion preceded ACL's systems response

EMNLP 2025's reasoning boom (+13.3pp) can be seen as the "research catalyst," while ACL 2026's response (+3.3pp reasoning, +7.3pp code, +6.0pp RL) represents the "engineering follow-through" — building systems to make reasoning models work reliably at scale.

### 4. Safety research follows a different trajectory per conference

- **ACL**: Safety → *mechanistic defense* (representation-space backdoor analysis, unknown attack protection for multi-agent systems). The safety papers are about *hardening infrastructure*.
- **EMNLP**: Safety → *attack discovery* (WebInject for web agents, prompt injection). The security papers are about *finding vulnerabilities* in deployed agents.

### 5. Traditional NLP tasks are aging differently

| Traditional task | ACL 2026 trend | EMNLP 2025 trend |
|---|---|---|
| **Syntactic Text Processing** | ↓ 3→1 (field) | ↔️ stable |
| **Low-Resource NLP** | ↓ 1→1 (field) | ↓ 5→3 (keyword) |
| **Machine Translation** | 0 (absent) | ↓ 1→1 (stable but low) |
| **Information Extraction** | ↔️ 1→1 | ↔️ 2→2 |

Both conferences are **retreating from traditional NLP pipelines** in favor of LLM-centric approaches, though EMNLP retains slightly more tradition (linguistic theories, commonsense reasoning, psycholinguistics).

### 6. EMNLP 2024 → 2025 showed the sharpest single-year shift: −7.3pp in generic LM mentions

The fact that "LLM & Language Models" as a keyword category **decreased** at EMNLP (56% → 49%) while **Reasoning & Math** exploded (5% → 19%) is telling: EMNLP moved from generic "LLM can do everything" papers toward *specific, targeted reasoning contributions*. ACL went the opposite direction — LLM mentions *increased* (39% → 44%) as the conference embraced LLM-as-infrastructure.

---

## Conclusion: Two Conferences, Two Cultures

| Dimension | ACL | EMNLP |
|---|---|---|
| **Primary focus** | Systems engineering | Deep reasoning research |
| **RL use case** | Training infrastructure | Reasoning optimization |
| **Code work** | Generation + verification systems | Detection + repository-level |
| **Safety approach** | Mechanistic defense | Attack discovery |
| **Evaluation focus** | Automated, scalable frameworks | Task-specific benchmarks |
| **Multimodal focus** | Benchmarks + efficiency | Reasoning + VQA |
| **Agent focus** | Multi-agent societies | Single-agent task execution |
| **2024→2025 / 2025→2026 shift** | Behavioral → Engineering | Foundational → Reasoning |

**ACL** has evolved into a **systems-focused conference** where the goal is to make language models work reliably at scale — building multi-agent societies, verifiable code execution, automated evaluation, and mechanistic safety. The question ACL asks is: *"How do we make LLMs robust enough for deployment?"*

**EMNLP** has evolved into a **reasoning-focused conference** where the goal is to make language models think better — mathematical games, Monte Carlo tree search, confidence-aware reasoning, and self-awareness of limitations. The question EMNLP asks is: *"How do we make LLMs smarter?"*

Both trajectories point toward the same destination — more capable, more reliable language model systems — but they take fundamentally different paths to get there.

