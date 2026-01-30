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

echo "--- Evidence Collection Complete - Generating Report --- "

nape collect report

echo "--- Done - Report Generated Successfully --- "