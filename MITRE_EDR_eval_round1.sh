#!/bin/bash
# Requires jq, and an unbiased mind!

# 🎨
YELLOW="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Listing our contestants 🏎
declare -a Vendors=("CarbonBlack" "CounterTack" "CrowdStrike" "Endgame" "Microsoft" "RSA" "SentinelOne")

# Generating a CSV file, save as MITRE_EDR_eval1.csv
echo "Vendor,None,Telemetry,IOC,GeneralBehavior,SpecificBehavior,Delayed,Tainted,ConfigChange,Enrichment" >> MITRE_EDR_eval1.csv

echo
for Vendor in "${Vendors[@]}"
do
  echo -e "${YELLOW}$Vendor${NOCOLOR}"

  # Setting up variables for our metrics
  none=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "None" | wc -l | awk '{printf("%s",$1)}' | awk '{printf("%s",$1)}')
  tele=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Telemetry" | wc -l | awk '{printf("%s",$1)}')
  ioc=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Indicator of Compromise" | wc -l | awk '{printf("%s",$1)}')
  g_behav=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "General Behavior" | wc -l | awk '{printf("%s",$1)}')
  s_behav=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Specific Behavior" | wc -l | awk '{printf("%s",$1)}')
  delayed=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Delayed" | wc -l | awk '{printf("%s",$1)}')
  tainted=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Tainted" | wc -l | awk '{printf("%s",$1)}')
  conf_change=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Config Change" | wc -l | awk '{printf("%s",$1)}')
  enrichment=$(curl -s https://attackevals.mitre.org/$Vendor.1.APT3.1_Results.json | jq . | grep "Enrichment" | wc -l | awk '{printf("%s",$1)}')

  # Adding to the CSV file
  echo "$Vendor,`echo "$none"`,`echo "$tele"`,`echo "$ioc"`,`echo "$g_behav"`,`echo "$s_behav"`,`echo "$delayed"`,`echo "$tainted"`,`echo "$conf_change"`,`echo "$enrichment"`" >> MITRE_EDR_eval1.csv

  # Printing the main results, uncomment all lines for the additional ones
  # Review (https://attackevals.mitre.org/methodology/detection-categorization.html)
  echo -e "\t${RED}None${NOCOLOR} :\t\t\t `echo "$none"`"
  echo -e "\t${GREEN}Telemetry${NOCOLOR} :\t\t `echo "$tele"`"
  echo -e "\t${GREEN}IOC${NOCOLOR} :\t\t\t `echo "$ioc"`"
  echo -e "\t${GREEN}General Behavior${NOCOLOR} :\t `echo "$g_behav"`"
  echo -e "\t${GREEN}Specific Behavior${NOCOLOR} :\t `echo "$s_behav"`"
  # echo -e "\t${RED}Delayed${NOCOLOR} :\t\t `echo "$delayed"`"
  # echo -e "\t${RED}Tainted${NOCOLOR} :\t\t `echo "$tainted"`"
  # echo -e "\t${RED}Config Change${NOCOLOR} :\t\t `echo "$conf_change"`"
  echo -e "\t${GREEN}Enrichment${NOCOLOR} :\t\t `echo "$enrichment"`\n"
  echo "=========================================="
  echo

done
