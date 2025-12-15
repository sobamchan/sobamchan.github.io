---
title: encoder-decoder is the best
updated: 2025-10-31
---

this article is incomplete. currently, I am using this page to just collect papers which can enhance my claim.

# papers

## comparison

- [\[2510.26622\] Encoder-Decoder or Decoder-Only? Revisiting Encoder-Decoder Large Language Model](https://arxiv.org/abs/2510.26622)
  - enc-dec lags behind without instruction tuning, but after instruction tuning, it becomes comparable to dec-only
  - > significantly better inference efficiency
  - enc-dec benefits from bidirectional attention in encoders
  - i don't like that they 
    - > We further split each sequence in the middle, resulting in 1024 input and 1024 target tokens (i.e., k = 1024), for training RedLLM. 
    - because how to split the sequence seems like an important decision, e.g., number of losses computed for a sample, but it is not discussed in the paper
    - > Note the effective target token count for RedLLM is 0.8T, half the size used for DecLLM due to the architectural difference
  - enc-dec may be doing better at long contex after pre-training
  - cross-encoder's attention seem to behave different in long context which seems interesting
    - same size, same training data, but attends differently, how different, and how does it influence on dowmstream tasks?
  - efficiency comparison by flops and empirical analysis (examples per second during training and inference)
    - and shows that enc-dec has "clear advantage"
- [T5Gemma: A new collection of encoder-decoder Gemma models - Google Developers Blog](https://developers.googleblog.com/en/t5gemma/)
- [What Language Model Architecture and Pretraining Objective Works Best for Zero-Shot Generalization?](https://proceedings.mlr.press/v162/wang22u.html)
- [Examining Scaling and Transfer of Language Model Architectures for Machine Translation](https://proceedings.mlr.press/v162/zhang22h.html)
- [\[2304.04052\] Decoder-Only or Encoder-Decoder? Interpreting Language Model as a Regularized Encoder-Decoder](https://arxiv.org/abs/2304.04052)
- [Return of the Encoder: Maximizing Parameter Efficiency for SLMs](https://arxiv.org/abs/2501.16273)


## encoder-decoder design

- [Layer-Wise Coordination between Encoder and Decoder for Neural Machine Translation](https://papers.nips.cc/paper_files/paper/2018/hash/4fb8a7a22a82c80f2c26fe6c1e0dcbb3-Abstract.html)
- [\[2501.16273v2\] Return of the Encoder: Maximizing Parameter Efficiency for SLMs](https://arxiv.org/abs/2501.16273v2)
- [Bidirectional Language Models Are Also Few-shot Learners \| OpenReview](https://openreview.net/forum?id=wCFB37bzud4)
- [\[2205.05131\] UL2: Unifying Language Learning Paradigms](https://arxiv.org/abs/2205.05131)


## Others

- [GitHub - google-research/t5x](https://github.com/google-research/t5x)

