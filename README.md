## MITRE EDR Evaluation Reporter

MITRE recently published the results of their EDR evaluation (the very first round), which is purely based on the Adversary Emulation Approach, and the [ATT&CK](https://attack.mitre.org/) matrix. 

> MITRE ATT&CK™ is a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations. The ATT&CK knowledge base is used as a foundation for the development of specific threat models and methodologies in the private sector, in government, and in the cybersecurity product and service community.

## Objectives

MITRE posted the results in great detail here, however, parsing the different JSON report files is no fun. This script pulls the detection rate of the attack techniques on each product, and genearte a text & csv outputs.

<p align="center">
  <img src="https://github.com/zshehri/MITRE_EDR_Eval/raw/master/output.png">
</p>

## MITRE Testing Methodology

MITRE Testing Methodology was described in [this document](https://attackevals.mitre.org/methodology/) with all the deatials necessary to understand how the test lab was setup.

### Detection Categorization

**None**: The vendor is unable to detect red activity due to capability limitations or other reasons. If data is available that is not directly relevant to the procedure tested, this will be categorized as “None.” In these cases, a vendor may receive a categorization of “None” with additional notes and screenshots about that data.

**Telemetry**: The capability produces some minimally processed data that is accessible to an end user and directly indicates that the red team activity occurred after the user performs human analysis. There is no evidence of complex logic or an advanced rule leading to the data output, and no labeling occurs other than simple field labeling. The detection needs to be demonstrably and logically related to the actual procedure performed. Proof of detection could include the view, query, or API search used to access the data and/or the detection output (e.g., table view or process tree).

**Indicator Of Compromise (IOC)**: The vendor identifies the red team activity based on known hashes, IP addresses, C2 domain, tool names, tool strings, or module names. Proof of detection could include the rule name, API/query used to access the data, and/or detection output

**Enrichment**: The capability captures data (usually data as described above in the “Telemetry Available” category) and then enriches it with additional information such as a rule name, labels, tags, or ATT&CK tactics or techniques that would assist in a user’s analysis of the data beyond what would have been originally presented.

**General Behavior**: The capability produces an alert detection for suspicious or potentially malicious behavior based on some type of reported complex logic or rule (beyond a simple “if X, display Y Rule Name,” which would be categorized as Enrichment).

**Specific Behavior**: The capability detects suspicious behavior based on some complex rule or logic and provides an ATT&CK “technique”-level description of the activity (beyond a simple “if X, display Y Rule Name,” which would be categorized as Enrichment).


### Modifier Detection Types

**Delayed**: The capability does not detect the activity in real-time or near-real-time when the red team executes the action, but subsequent alerts, data, enrichment, or additional processing produce a detection for the activity.

**Tainted**: The capability detects the activity based on previously identified suspicious/malicious behavior that is related to or “tainted by” the detection.

**Configuration Change**: A detection is made possible by a special configuration change or additional API access that allows data not normally accessible to the end user to become available.

## Prerequisites

[JQ](https://stedolan.github.io/jq/), and an unbiased mind!

## Running the code

```
bash MITRE_EDR_eval_round1.sh
```

## Important Notes

1- This is the first EDR evaluation against MITRE ATT&CK, specifically against [APT3](https://attack.mitre.org/groups/G0022/) threat group attack techniques. More tests will come later, and probably against more vendors as well. This repo will be updated once these reports become avaliable.

2- You have to read the entire page here [MITRE Evaluation](https://attackevals.mitre.org/evaluations.html), the high level analysis of the final metrics can significantly impact your analysis. The evaluation page has screenshots for all the products, and the exact findings to determine if that's something you'd be concerned about in your environment (YMMV).

3- I'm not affiliated with MITRE or any EDR vendor, and take no responsibility or liability of the results/reports.
