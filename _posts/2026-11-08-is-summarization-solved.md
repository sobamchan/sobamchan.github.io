---
title: Is Summarization Solved?
updated: 2026-11-08
---

## Context

I have defended my PhD thesis last month.
The title is "Scholarly Document Summarization: from Foundation to Application".
It wasn't very easy to complete summarization thesis in this era of LLMs.
Right before finalizing the thesis, given a recommendation from one of my PhD defense commity members,
I wrote a small section named "Is Summarization Solved".
I do not believe my take here is absolutely correct or everyone should agree, this is just my personal
opinion.

I converted this little section into a markdown file from a LaTeX file. So that perhaps I can hear opinions from fellow NLP PhD students or someone with another take from the Internet.
So here it is...


---

## Is Summarization Solved?

The thesis author started the Ph.D. study in September 2021 when GPT-3 was already available (released in June 2020), and ChatGPT was released in November 2022. The emergence of LLMs has forced drastic changes on most NLP topics with summarization being one of the most affected, because of the LLMs' capability in producing high-quality summaries [1–3]. This pressure from LLMs on summarization provoked even discussions on whether the community should proceed or put an end to summarization research [1, 4]. These discussions are centered on the question of whether LLMs can produce summaries that are of higher quality than humans. This question itself will remain relevant and interesting. Addressing this question requires the community to develop better evaluation frameworks for both automatic and manual evaluation. However, even without having the final answer to this question, there is one observation one can make through these discussions that is: with either automatic or manual evaluation, due to the high capability of LLMs, we, researchers, can no longer differentiate between auto-generated and human-authored summaries. This fact (LLMs reaching or outperforming humans in summarization) makes some of the main research areas in summarization obsolete. The research areas where researchers develop summarization models or coarse-grained evaluation metrics are less impactful due to the saturated summarization capability. Because LLMs are trained at scale for many tasks, which enables them to perform various summarization tasks without any task-specific tuning, making the development of summarization datasets less valuable. The inference cost of LLMs is indeed a critical problem, however, as they are general-purposed models, efficiency methods should be designed for multiple tasks rather than just for summarization. Indeed, the impact of LLMs on summarization is reflected on the number of publications. From 2022 to 2025, the ratio of summarization papers in major NLP conference proceedings drop from 5% to 1% (we counted the number of papers in ACL, EMNLP and NAACL of which “summar” appears in the title).

With these major research areas becoming obsolete, we can say that “Summarization is Solved” in a traditional sense. However, it may be too early to drop all the research artifacts and knowledge accumulated in summarization research. The new technology, LLMs, also brings new questions to be addressed by the scientific community, for which the summarization field may offer perspectives.

For instance, hallucination is one of the critical problems with LLMs (inter alia [5–7]). Hallucination occurs when an LLM generates a natural-sounding text that is factually inaccurate. While this problem is studied actively in the NLP community, the vague definition of hallucination poses a challenge to perform holistic and robust exploration. However, in the context of summarization, we can offer a clearer definition (“a summary containing information that is not present in the source document”) and an extensive set of tools, produced by the community over the years, for studying hallucination at scale (inter alia [8–10]). These tools and knowledge allow researchers to study and measure hallucination in a more controlled way. ROUGE-K, introduced in this thesis, can also provide a quantitative view on keyword hallucination in LLM studies. Another promising place for summarization artifacts to shine in the new LLM era is interpretability, the rising research field that analyzes models' internal workings (inter alia [11, 12]). There are a number of ways to approach this problem and one can study LLMs' behaviour using the summarization task as a testbed [13, 14]. The rich history of summarization and its artifacts such as ACLSum provides a robust evaluation playground.

While the traditional working areas in summarization may have weakened their value, I believe that the knowledge acquired through summarization research can provide a foundation to address new research questions that emerged with LLMs, akin to the aforementioned instances. “Summarization is Solved” indeed; however, we now shift to “Summarization to Solve”.

### References

1. Tianyi Zhang, Faisal Ladhak, Esin Durmus, Percy Liang, Kathleen McKeown, and Tatsunori B. Hashimoto. “Benchmarking Large Language Models for News Summarization.” arXiv:2301.13848, 2023. https://arxiv.org/abs/2301.13848
2. Yixin Liu, Kejian Shi, Katherine He, Longtian Ye, Alexander Fabbri, Pengfei Liu, Dragomir Radev, and Arman Cohan. “On Learning to Summarize with Large Language Models as References.” Proceedings of NAACL-HLT 2024 (Long Papers). https://aclanthology.org/2024.naacl-long.478/
3. Yixin Liu, Alexander Fabbri, Jiawen Chen, Yilun Zhao, Simeng Han, Shafiq Joty, Pengfei Liu, Dragomir Radev, Chien-Sheng Wu, and Arman Cohan. “Benchmarking Generation and Evaluation Capabilities of Large Language Models for Instruction Controllable Summarization.” Findings of NAACL 2024. https://aclanthology.org/2024.findings-naacl.280/
4. Dongqi Liu, Chenxi Whitehouse, Zheng Zhao, Zhuchen Cao, Jian Li, and Yabiao Wang. “Summarization Is Not Dead Yet.” Proceedings of EMNLP 2026. https://aclanthology.org/2026.emnlp-main.402/
5. Yehonatan Peisakhovsky, Zorik Gekhman, Yosi Mass, Liat Ein-Dor, and Roi Reichart. “Fine-Grained Detection of Context-Grounded Hallucinations Using LLMs.” Findings of ACL 2026. https://aclanthology.org/2026.findings-acl.1907/
6. Zhihong Zhu, Yunyan Zhang, Xianwei Zhuang, Fan Zhang, Zhongwei Wan, Yuyan Chen, Qingqing Long, Yefeng Zheng, and Xian Wu. “Can We Trust AI Doctors? A Survey of Medical Hallucination in Large Language and Large Vision-Language Models.” Findings of ACL 2025. https://aclanthology.org/2025.findings-acl.350/
7. Denis Janiak, Jakub Binkowski, Albert Sawczyn, Bogdan Gabrys, Ravid Shwartz-Ziv, and Tomasz Jan Kajdanowicz. “The Illusion of Progress: Re-evaluating Hallucination Detection in LLMs.” Proceedings of EMNLP 2025. https://aclanthology.org/2025.emnlp-main.1761/
8. Joshua Maynez, Shashi Narayan, Bernd Bohnet, and Ryan McDonald. “On Faithfulness and Factuality in Abstractive Summarization.” Proceedings of ACL 2020. https://aclanthology.org/2020.acl-main.173/
9. Seonil (Simon) Son, Junsoo Park, Jeong-in Hwang, Junghwa Lee, Hyungjong Noh, and Yeonsoo Lee. “HaRiM+: Evaluating Summary Quality with Hallucination Risk.” Proceedings of AACL-IJCNLP 2022. https://aclanthology.org/2022.aacl-main.66/
10. Meng Cao, Yue Dong, and Jackie Cheung. “Hallucinated but Factual! Inspecting the Factuality of Hallucinations in Abstractive Summarization.” Proceedings of ACL 2022. https://aclanthology.org/2022.acl-long.236/
11. Mor Geva, Roei Schuster, Jonathan Berant, and Omer Levy. “Transformer Feed-Forward Layers Are Key-Value Memories.” Proceedings of EMNLP 2021. https://aclanthology.org/2021.emnlp-main.446/
12. Damai Dai, Li Dong, Yaru Hao, Zhifang Sui, Baobao Chang, and Furu Wei. “Knowledge Neurons in Pretrained Transformers.” Proceedings of ACL 2022. https://aclanthology.org/2022.acl-long.581/
13. Sanjana Ramprasad, Elisa Ferracane, and Zachary Lipton. “Analyzing LLM Behavior in Dialogue Summarization: Unveiling Circumstantial Hallucination Trends.” Proceedings of ACL 2024. https://aclanthology.org/2024.acl-long.677/
14. Yongxin Zhou, Changshun Wu, Philippe Mulhem, Didier Schwab, and Maxime Peyrard. “What Matters to an LLM? Behavioral and Computational Evidences from Summarization.” Findings of EACL 2026. https://aclanthology.org/2026.findings-eacl.302/
