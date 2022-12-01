#   Herausgeber: aconitas® GmbH - Bäumenheimer Str. 5 - 86690 Mertingen
#   Website: https://www.aconitas.com
#   Telefon: +49 (906) 126725-0
#   E-Mail: info@aconitas.com
#
#   Version 1.0



########################################################
#### Import WebServerPort in Variable
HTTP_PORT=$(cat /tmp/3cx.port)
#echo $HTTP_PORT

########################################################
#### Abruf Werte aus 3CX Web Console
RESULT=$(curl --request GET --cookie /tmp/3cxcookie --cookie-jar /tmp/3cxcookie -s localhost:${HTTP_PORT}/api/CallFlowApps)

########################################################
#### Auswertung
if [[ $RESULT =~ '{"list":[]}' ]]; then
  echo Es sind keine CallFlow Apps vorhanden
  exit 0
else
  echo Es sind CallFlow Apps VORHANDEN
  exit 2
fi