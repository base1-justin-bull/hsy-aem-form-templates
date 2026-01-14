#{
#  "role": "Api Key User",
#  "user_name": "444312c519654854a2021e37a6799364@api.onetrust.com",
#  "languageId": 1,
#  "sessionId": "a371e860-3e6a-4376-8307-ee592f4daa86",
#  "token_type": "Bearer",
#  "tenantGuid": "444312c5-1965-4854-a202-1e37a6799364",
#  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Imp3dCJ9.eyJyb2xlIjoiQXBpIEtleSBVc2VyIiwidXNlcl9uYW1lIjoiNDQ0MzEyYzUxOTY1NDg1NGEyMDIxZTM3YTY3OTkzNjRAYXBpLm9uZXRydXN0LmNvbSIsImxhbmd1YWdlSWQiOjEsInNlc3Npb25JZCI6ImEzNzFlODYwLTNlNmEtNDM3Ni04MzA3LWVlNTkyZjRkYWE4NiIsInRlbmFudEd1aWQiOiI0NDQzMTJjNS0xOTY1LTQ4NTQtYTIwMi0xZTM3YTY3OTkzNjQiLCJjbGllbnRfaWQiOiI2NjRmMTU3ZTgzN2M0ODYyOWFlZWExNzU3YTY0NWNkMSIsIm9yZ0dyb3VwSWQiOiI3MzIwMmE5My1hNDk5LTQ3OWYtYjM3My0yMGY5NGE4MzMxNDIiLCJvcmdHcm91cEd1aWQiOiI3MzIwMmE5My1hNDk5LTQ3OWYtYjM3My0yMGY5NGE4MzMxNDIiLCJvdC1zY29wZXMiOiJDT05TRU5ULENPTlNFTlRfUkVBRCxJTlRFR1JBVElPTlMiLCJzY29wZSI6W10sInRlbmFudElkIjo0MzY0LCJndWlkIjoiY2FmMTdmNWYtMDBkMS00MTY4LWIwZjItMGNmZWEyNWRhOWNlIiwiZXhwIjoxNzgxNjI1OTU1LCJleHBpcmVzX2luIjozMTUzNjAwMCwianRpIjoidkVIaWlFTXRoQ2xESVdqeDBKZFlFRF9UYTVjIiwiZW1haWwiOiI0NDQzMTJjNTE5NjU0ODU0YTIwMjFlMzdhNjc5OTM2NEBhcGkub25ldHJ1c3QuY29tIn0.G_oFEhcCW4__PZCdbapVMlwqfkdYD-KMcx1PlGlYbCepATLJEYb2FYuwA_d00Mbv1srzmPGJ6F-FMoBKUp7GbMTOSynzugOdSS8k_KTRg27eKau1JL-nZ059NCf393Ewu1O0vQLfOL4BbDUyyHt4_Q0av0HOcqr02LV5DHIBXzUhuW_a9ZHraHaanoGDETlvgYzy3XZSkp1yHW76N_-6phXiB6D0w_4MfrLfaUINsqVSGnVBRYLImSiw8dxHYDOL7pWNU6rQwjBBBBBay9J4YcgUNwcoBgU2rth6XipUSpsY9GPQW9MZlho7mdsrLVYeFfFyXLthZTB3odXgKtTGag",
#  "orgGroupId": "73202a93-a499-479f-b373-20f94a833142",
#  "orgGroupGuid": "73202a93-a499-479f-b373-20f94a833142",
#  "ot-scopes": "CONSENT,CONSENT_READ,INTEGRATIONS",
#  "tenantId": 4364,
#  "guid": "caf17f5f-00d1-4168-b0f2-0cfea25da9ce",
#  "expires_in": 31536000,
#  "email": "444312c519654854a2021e37a6799364@api.onetrust.com",
#  "jti": "vEHiiEMthClDIWjx0JdYED_Ta5c"
#}

ENV="uat"
API_HOST="https://$ENV.onetrust.com"
API_CLIENT_ID="664f157e837c48629aeea1757a645cd1"
API_CLIENT_SECRET="xctLg2k8ZV7XoB20HzLm7DUo31ez9q5N"
PURPOSE_ID1="ffef9e52-0fb6-482f-9d4d-0617954f609e" # Hershey Newsletter
PURPOSE_ID2="3831e2ba-8f5b-49e0-9971-50921d1d2aa5" # Monthly Marketing Emails
PURPOSE_ID3="2fd82b89-1d6e-4ac4-9886-a60015881b96" # ONE Brand Newsletter
PURPOSE_ID4="deb11aee-34d2-4338-b72f-d32fa20f85ad" # FULFIL Newsletter
PURPOSE_ID5="30435ad0-ca3d-4b9c-8cc3-e662a7ebac2c" # Hershey Insighter
DATA_SUBJECT_ID="test123@hersheys.com"
#PREFERENCE_CENTER_ID="2338bb11-efb6-4b07-b891-50f13a492a80" # Hersheys
#USER_ID="444312c5-1965-4854-a202-1e37a6799364" # JBull@hersheys.com
#COLLECTION_POINT_GUID="47da2562-8b2e-43e0-99cf-9f7997f72ead" # Emarsys Consent API Collection Point

# Generate Access Token
# https://developer.onetrust.com/onetrust/reference/getoauthtoken
API_ACCESS_TOKEN="$(
  curl --request POST \
       --url "$API_HOST/api/access/v1/oauth/token" \
       --header 'accept: application/json' \
       --header 'content-type: multipart/form-data' \
       --form "grant_type=client_credentials" \
       --form "client_secret=$API_CLIENT_SECRET" \
       --form "client_id=$API_CLIENT_ID" \
       --silent | jq -r '.access_token'
)"

## Get Purpose
## https://developer.onetrust.com/onetrust/reference/getpurposedetailusingget
#curl --request GET \
#     --url "$API_HOST/api/consentmanager/v2/purposes/$PURPOSE_ID" \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header 'accept: application/json'

## Get Data Subject
## https://developer.onetrust.com/onetrust/reference/getv3datasubjectsprofileusingget
#curl --request GET \
#     --url "$API_HOST/rest/api/preferences/v3/datasubjects/profile?includeInstantLinkToken=false&isDNCInclude=false" \
#     --header 'accept: application/json' \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header "identifier: $DATA_SUBJECT_ID"

## Get Data Subject's Preferences in a Preference Center
## https://developer.onetrust.com/onetrust/reference/getdatasubjectpurposesbyidentifierusingget_1
#curl --request GET \
#     --url "$API_HOST/api/consentmanager/v1/preferencecenters/$PREFERENCE_CENTER_ID/datasubjects/preferences" \
#     --header 'accept: application/json' \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header "identifier: $DATA_SUBJECT_ID"

## Get List of Purposes for a Data Subject
## https://developer.onetrust.com/onetrust/reference/getdatasubjectpurposesbyidentifierusingget
#curl --request GET \
#     --url "$API_HOST/api/consentmanager/v1/datasubjects/purposes?page=0" \
#     --header 'accept: application/json' \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header "identifier: $DATA_SUBJECT_ID"

## Withdraw Consent on Behalf of a Data Subject
## https://developer.onetrust.com/onetrust/reference/withdrawtransactionbehalfofdatasubjectusingput
#curl --request PUT \
#     --url "$API_HOST/api/consentmanager/v1/transactions/withdraw/fordatasubject?withdrawnBy=$USER_ID" \
#     --header 'accept: application/json' \
#     --header 'content-type: application/json' \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header "identifier: $DATA_SUBJECT_ID" \
#     --data '{
#  "PurposeId": "'$PURPOSE_ID'",
#  "Origin": "API",
#  "Notes": "Withdrawing consent as per data subject request"
#}'

## Withdraw Data Subject's Consent
## https://developer.onetrust.com/onetrust/reference/withdrawtransactionbypurposeandidentifierusingget
#curl --request GET \
#     --url "$API_HOST/api/consentmanager/v1/transactions/withdraw/purpose/$PURPOSE_ID" \
#     --header 'accept: application/json' \
#     --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#     --header "identifier: $DATA_SUBJECT_ID"

# Get Collection Point Token
# https://developer.onetrust.com/onetrust/reference/gettokenusingget
#COLLECTION_POINT_TOKEN="$(
#  curl --request GET \
#       --url "$API_HOST/api/consentmanager/v1/collectionpoints/$COLLECTION_POINT_GUID/token" \
#       --header 'accept: application/json' \
#       --header "Authorization: Bearer $API_ACCESS_TOKEN" \
#       --silent | jq -r '.token'
#)"

# https://uat.onetrust.com/consent/collection-points/47da2562-8b2e-43e0-99cf-9f7997f72ead/version/2/integrations
COLLECTION_POINT_TOKEN="eyJhbGciOiJSUzUxMiJ9.eyJvdEp3dFZlcnNpb24iOjEsInByb2Nlc3NJZCI6IjQ3ZGEyNTYyLThiMmUtNDNlMC05OWNmLTlmNzk5N2Y3MmVhZCIsInByb2Nlc3NWZXJzaW9uIjoyLCJpYXQiOiIyMDI1LTA1LTAxVDE0OjIzOjMyLjcyIiwibW9jIjoiQVBJIiwicG9saWN5X3VyaSI6bnVsbCwic3ViIjoiRW1haWwiLCJpc3MiOm51bGwsInRlbmFudElkIjoiNDQ0MzEyYzUtMTk2NS00ODU0LWEyMDItMWUzN2E2Nzk5MzY0IiwiZGVzY3JpcHRpb24iOiJDb2xsZWN0aW9uIHBvaW50IGZvciBzaWdudXBzIGNvbWluZyBpbiBmcm9tIEVtYXJzeXMiLCJjb25zZW50VHlwZSI6IkNPTkRJVElPTkFMVFJJR0dFUiIsImFsbG93Tm90R2l2ZW5Db25zZW50cyI6dHJ1ZSwiZG91YmxlT3B0SW4iOmZhbHNlLCJwdXJwb3NlcyI6W3siaWQiOiIzODMxZTJiYS04ZjViLTQ5ZTAtOTk3MS01MDkyMWQxZDJhYTUiLCJ2ZXJzaW9uIjoyLCJwYXJlbnRJZCI6bnVsbCwidG9waWNzIjpbXSwiY3VzdG9tUHJlZmVyZW5jZXMiOltdLCJlbmFibGVHZW9sb2NhdGlvbiI6ZmFsc2UsImltcGxpY2l0Q29uc2VudExpZmVTcGFuIjowfSx7ImlkIjoiZGViMTFhZWUtMzRkMi00MzM4LWI3MmYtZDMyZmEyMGY4NWFkIiwidmVyc2lvbiI6MiwicGFyZW50SWQiOm51bGwsInRvcGljcyI6W10sImN1c3RvbVByZWZlcmVuY2VzIjpbXSwiZW5hYmxlR2VvbG9jYXRpb24iOmZhbHNlLCJpbXBsaWNpdENvbnNlbnRMaWZlU3BhbiI6MH0seyJpZCI6IjJmZDgyYjg5LTFkNmUtNGFjNC05ODg2LWE2MDAxNTg4MWI5NiIsInZlcnNpb24iOjIsInBhcmVudElkIjpudWxsLCJ0b3BpY3MiOltdLCJjdXN0b21QcmVmZXJlbmNlcyI6W10sImVuYWJsZUdlb2xvY2F0aW9uIjpmYWxzZSwiaW1wbGljaXRDb25zZW50TGlmZVNwYW4iOjB9LHsiaWQiOiIzMDQzNWFkMC1jYTNkLTRiOWMtOGNjMy1lNjYyYTdlYmFjMmMiLCJ2ZXJzaW9uIjoxLCJwYXJlbnRJZCI6bnVsbCwidG9waWNzIjpbXSwiY3VzdG9tUHJlZmVyZW5jZXMiOltdLCJlbmFibGVHZW9sb2NhdGlvbiI6ZmFsc2UsImltcGxpY2l0Q29uc2VudExpZmVTcGFuIjowfSx7ImlkIjoiZmZlZjllNTItMGZiNi00ODJmLTlkNGQtMDYxNzk1NGY2MDllIiwidmVyc2lvbiI6MiwicGFyZW50SWQiOm51bGwsInRvcGljcyI6W10sImN1c3RvbVByZWZlcmVuY2VzIjpbXSwiZW5hYmxlR2VvbG9jYXRpb24iOmZhbHNlLCJpbXBsaWNpdENvbnNlbnRMaWZlU3BhbiI6MH1dLCJub3RpY2VzIjpbXSwiZHNEYXRhRWxlbWVudHMiOlsiWmlwIiwiTGFzdE5hbWUiLCJGaXJzdE5hbWUiLCJQb2xpY3lWZXJzaW9uIl0sImF1dGhlbnRpY2F0aW9uUmVxdWlyZWQiOmZhbHNlLCJyZWNvbmZpcm1BY3RpdmVQdXJwb3NlIjpmYWxzZSwib3ZlcnJpZGVBY3RpdmVQdXJwb3NlIjp0cnVlLCJkeW5hbWljQ29sbGVjdGlvblBvaW50IjpmYWxzZSwiYWRkaXRpb25hbElkZW50aWZpZXJzIjpbXSwibXVsdGlwbGVJZGVudGlmaWVyVHlwZXMiOmZhbHNlLCJlbmFibGVQYXJlbnRQcmltYXJ5SWRlbnRpZmllcnMiOmZhbHNlLCJwYXJlbnRQcmltYXJ5SWRlbnRpZmllcnNUeXBlIjpudWxsLCJhZGRpdGlvbmFsUGFyZW50SWRlbnRpZmllclR5cGVzIjpbXSwiZW5hYmxlR2VvbG9jYXRpb24iOmZhbHNlLCJkYXRhRWxlbWVudFR5cGVNYXAiOnsiUG9saWN5VmVyc2lvbiI6IlVTRVJfSU5QVVQiLCJaaXAiOiJOVU1CRVIiLCJGaXJzdE5hbWUiOiJVU0VSX0lOUFVUIiwiTGFzdE5hbWUiOiJVU0VSX0lOUFVUIn19.it893bSO7ANLbIqlVG-BoertwcpdW-mPsleSXR7R8VstXjLkHISMTroKUiltO1bBzMHDf2RUFraMdAgLSSmj08B7iORNhGGDl6mU1UL-1CA24aElh6_9slSCPAwRY52aosd64BSI8VnJ7wBhJT5Plj4sIBbQ9zI2JivSMwF0KKrtrHGiwyinCX2kc7aNM2LV6UWE8wIDBXpbXpTSE8Wr_QziYcZp3MOhHXQcLy76hTuFHmbcuWbWebHc5dJKcTtZICb3gUaka518i2vvEfsS_xYMwR8edF2G4svz_xVNPz8ypDZwk0O36AXHAudPVCaQRXQI-dSLAyoKPFOaDyw5lQAvgRqqZ1mdWNaVmsgD7KKguAbfEecNzgRcQuYN4QcXhtjNc3z8a98PvXbrlpxoBmQqLPOq5dOCuKEvLA8Sr53PqiSck5hhH7F4_xheOu7s3gqTJH2c9BX7Pv3FJJ8sRImGc4BJ9tzFQWkJYRU52NXsyTfSsac7tXX-6AMhWiCl2XXYCkipZdKvyfQurAZWwaI6CR5hEywCv8zUncQHXlFC2Cte2R0lHBbyVCHqICdHYckFt54dK6Kj-lGbJ34uubLaeBhfEChR3YBo0hsZhs5_U3zUza1Ko05UPZK5TrmTCJaPO3V8488_mIAn--fH88biPlUY7ZGSlODGmX032SU"

# Create Consent Receipts
# https://developer.onetrust.com/onetrust/reference/createconsentreceiptusingpost
# Allowed values are:
# - PENDING
# - CONFIRMED
# - WITHDRAWN
# - IMPLICIT
# - EXPIRED
# - NOTGIVEN
# - OPT_OUT
# - NO_CHOICE
# - HARD_OPT_OUT
# - EXTEND
# - CHANGE_PREFERENCES
# - OPT_IN
# - NO_OPT_OUT
#
curl --request POST \
     --url "https://privacyportal$ENV.onetrust.com/request/v1/consentreceipts" \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '{
  "requestInformation": "'$COLLECTION_POINT_TOKEN'",
  "identifier": "'$DATA_SUBJECT_ID'",
  "dsDataElements": {
    "Zip": "12345",
    "FirstName": "Justin",
    "LastName": "Bull",
    "PolicyVersion": "v1"
  },
  "purposes": [
    {
      "Id": "'$PURPOSE_ID1'",
      "TransactionType": "OPT_IN"
    },
    {
      "Id": "'$PURPOSE_ID2'",
      "TransactionType": "OPT_IN"
    },
    {
      "Id": "'$PURPOSE_ID3'",
      "TransactionType": "OPT_IN"
    },
    {
      "Id": "'$PURPOSE_ID4'",
      "TransactionType": "OPT_IN"
    },
    {
      "Id": "'$PURPOSE_ID5'",
      "TransactionType": "OPT_IN"
    }
  ]
}'

curl -i -X POST --location https://auth.emarsys.net/oauth2/token \
  -H 'Authorization:Basic base64(3babdaf5-5467-48c1-aa3f-8e7e89cd0cb4:ilm9LSjp74TuOzSWqWf2rzYs-t)' \
  -H 'Content-Type:application/x-www-form-urlencoded' \
  -H 'Accept:application/json' \
  -d 'grant_type=client_credentials' \


curl -i -X POST --location https://auth.emarsys.net/oauth2/token \
  -u '3babdaf5-5467-48c1-aa3f-8e7e89cd0cb4:ilm9LSjp74TuOzSWqWf2rzYs-t' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json' \
  -d 'grant_type=client_credentials'

curl --request GET \
  --url "$API_HOST/api/consentmanager/v1/linktokens" \
  --header 'accept: application/json' \
  --header "Authorization: Bearer $API_ACCESS_TOKEN" \
  --header "identifier: $DATA_SUBJECT_ID"
