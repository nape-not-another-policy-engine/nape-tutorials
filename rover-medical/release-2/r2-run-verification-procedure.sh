#!/bin/bash

PROCEDURE_LINK="file://$HOME/Documents/source_code/nape-not-another-policy-engine/nape-catalog"
SUBJECT_ID=$(date +%s%3N)

echo "--- Release 1 - Execute Verification Procedure --- "

nape collect start \
    --subject "nrn:procedure:rover-medical/rover-medicine-system" \
    --subject-id "$SUBJECT_ID" \
    --procedure-link "$PROCEDURE_LINK" \
    --procedure-directory rover-medical/release-2 \
    --meta system-owner "Bill Bensing" \

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
--file-path "pet-medicine-host/stdout-app-user.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-app-user-no-login.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-app-user-not-root.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-db-user.txt"
nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-db-user-no-login.txt"
nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-db-user-not-root.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-admin-user-not-root.txt"

nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-command-audit-installed.txt"


nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-admin-user-commands-logged.txt"
nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-app-user-commands-logged.txt"
nape collect evidence \
--control-activity "pet-medicine-host" \
--file-path "pet-medicine-host/stdout-db-user-commands-logged.txt"



echo "--- Evidence Collection Complete - Generating Report --- "

nape collect report

echo "--- Done - Report Generated Successfully --- "