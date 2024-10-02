#!/bin/bash

echo "Cleaning up testing space"

rm -rf nrn*

echo "--- NAPE Collection Test 1 --- "

nape collect start \
    --subject "nrn:procedure:nape-tutorials/tutorial-1:new-employee/empid-10387493" \
    --subject-id 10387493 \
    --procedure-link https://github.com/nape-not-another-policy-engine/nape-catalog.git \
    --procedure-directory nape-tutorials/tutorial-1/simple-sdlc-process/continuous-integration \
    --meta code-owner "Bill Bensing" \
    --meta app-type "Java Spring Boot Application"

echo "--- Collect the Background Check Evidence --- "

nape collect evidence \
    --control-activity "vulnerabilty-and-weaknesses" \
    --file-path "raw-evidence/cve_scan_results.xml"

nape collect evidence \
    --control-activity "peer-review" \
    --file-path "raw-evidence/review_tool_report.json"

nape collect evidence \
    --control-activity "app-testing" \
    --file-path "raw-evidence/unit_test_results.txt"

echo "--- Execute the Assurance Reporting process based upon evidence collected --- "

nape collect report