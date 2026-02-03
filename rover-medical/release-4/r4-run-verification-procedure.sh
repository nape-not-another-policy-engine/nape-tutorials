#!/bin/bash

PROCEDURE_LINK="file://$HOME/Documents/source_code/nape-not-another-policy-engine/nape-catalog"
SUBJECT_ID=$(date +%s%3N)

echo "--- Release 1 - Execute Verification Procedure --- "

nape collect start \
    --subject "nrn:procedure:rover-medical/rover-medicine-system" \
    --subject-id "$SUBJECT_ID" \
    --procedure-link "$PROCEDURE_LINK" \
    --procedure-directory rover-medical/release-4 \
    --meta system-owner "Bill Bensing" \
    --meta release-number  4

echo "--- Starting Evidence Collection --- "

echo "--- Collecting Evidence of Pet Medicine Application Configuration --- "

nape collect evidence \
    --control-activity "pet-medicine-app" \
    --file-path "pet-medicine-app/app-config.toml"

echo "--- Collecting Evidence of Pet Medicine Database Configuration --- "

nape collect evidence \
    --control-activity "pet-medicine-db" \
    --file-path "pet-medicine-db/my-db.ini"

echo "--- Collecting Evidence of Pet Medicine Database Host Configuration --- "

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-auditctl-installed.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-auditctl-user-commands-logged.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-no-login-app-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-no-login-db-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-root-check-admin-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-root-check-app-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-root-check-db-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-user-exists-app-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-user-exists-db-user.txt"

echo "--- Collecting Evidence of Pet Medicine Rover Cloud Configuration & 3rd Party Data --- "

nape collect evidence \
--control-activity "rover-cloud" \
--file-path "rover-cloud/cloud-config.yaml"

nape collect evidence \
--control-activity "rover-cloud" \
--file-path "rover-cloud/soc1-report-analysis.json"

echo "--- Evidence Collection Complete - Generating Report --- "

nape collect report

echo "--- Done - Report Generated Successfully --- "