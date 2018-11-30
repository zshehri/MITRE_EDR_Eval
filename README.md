## MITRE EDR Evaluation Reporter

MITRE recently published the results of their EDR evaluation (the very first round), which is purely based on the Adversary Emulation Approach, and the [ATT&CK](https://attack.mitre.org/) matrix. 

> MITRE ATT&CK™ is a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations. The ATT&CK knowledge base is used as a foundation for the development of specific threat models and methodologies in the private sector, in government, and in the cybersecurity product and service community.

## Objectives

MITRE posted the results in great detail here, however, parsing the different JSON report files is no fun. This script pulls the detection rate of the attack techniques on each product, and genearte a text & csv outputs.

<p align="center">
  <img src="https://github.com/zshehri/MITRE_EDR_Eval/raw/master/output.png">
</p>

## Prerequisites

[JQ](https://stedolan.github.io/jq/), and an unbiased mind!

## Running the code

```
bash MITRE_EDR_eval_round1.sh
```

## Important Notes

1- This is the first evaluation against MITRE EDR, specifically against [APT3](https://attack.mitre.org/groups/G0022/) threat group attack techniques. More tests will come, and probably more vendors as well. This repo will be updated once these reports are avaliable.

2- You have to read the entire page here [MITRE Evaluation](https://attackevals.mitre.org/evaluations.html), the high level analysis of the final metrics can significantly impact your analysis. The evaluation page has screenshots for all the products, and the exact finding to determine if that's something you'd be concerned about in your environment (YMMV).

3- I'm not affiliated with MITRE or any EDR vendor, and take no responsibility or liability of the results/reports.
