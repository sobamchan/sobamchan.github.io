---
title: GenGO MCP
updated: 2026-08-07
layout: about
---

### Context

[GenGO](https://gengo.sotaro.io/) is one of my projects where *ACL papers are indexed with some structured data, TLDR summaries, and semantic vectors, our aim is to help researchers to more efficiently navigate through fast increasing research papers.
Using [PoolsideAI coding agent](https://poolside.ai/), I have vibe-coded  a MCP server that grants coding agents an access to a backend paper database server to allow iterative and flexible exploration.

I have been generating quick literature search reports using PoolsideAI agent and this MCP server for myself.
To showcase this tool, I link some of the reports here.
Note that I did not validate the output report.

If you want to use this MCP yourself, you need an access to the paper database.
you have two options for this.

- Get an access to the online server
  - Contact me for the access credentials
- Host the paper database yourself by doing
  - Using docker, start Qdrant databaset server ([instruction](https://qdrant.tech/documentation/quickstart/#download-and-run))
  - Download the paper database snapshot from [here](https://www.dropbox.com/scl/fi/rgpsk59xrgg9dus4aw31r/papers_test-2953592397427611-2026-08-07-10-09-38.snapshot?rlkey=5quk3qmbcc65k2uzcwbqih9o7&st=mw5ac1ed&dl=0)
  - Upload the snapshot to your local Qdrant server. Visit your local Qdrant dashboard UI [here](http://localhost:6333/dashboard) where you can do that easily


### Sample reports

- [Why Reasoning Is Effective with LLMs — Literature Report](/info/gengomcp/llm_reasoning_effectiveness_report)
- [ACL 2025 → 2026 Research Topic Trend Analysis](/info/gengomcp/acl_2025_2026_trend_analysis)
- [Text Embedding Geometry & Input Length Effects Literature Report](/info/gengomcp/embedding_geometry_and_length_report)
- [ACL vs EMNLP: Comparative Research Topic Trend Analysis (2024–2026)](/info/gengomcp/emnlp_vs_acl_comparison)
  - the conclusion is interesting. ACL seems more "empirical" than EMNLP from the report
  - "ACL has evolved into a systems-focused conference"
  - "EMNLP has evolved into a reasoning-focused conference"


### Refs


- [GenGO MCP](https://github.com/sobamchan/gengomcp)
- [GenGO](https://gengo.sotaro.io/)
- [Poolside AI](https://poolside.ai/)
