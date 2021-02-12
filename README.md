REST API. Docker. Database is simple, artists, artpieces and museums. Initializing database very small example database is made. 

Below script, which clones, installs repo and makes GET/PUT/POST/DELETE methods for example database.

# =============================================

## Perustiedot:

# - tuni-mail: jani.k.sillanpaa@tuni.fi

# - kuvaus: kanta sisältää tietoja taideteoksista

# - tekninen toteutus: Node.js, MySQL-kanta, Docker

# mysql: User ID: root , password: db_rootpass , custom server; server address : db

# API-kuvaus:

#- GET kaikki artistit /artists/
#- GET tietty artisti /artist/:id

#- GET kaikki museot /museums/
#- GET tietty museo /museum/:id

#-GET kaikki taideteokset /artpieces/
#-GET tietty taideteos /artpiece/:id

# - Museon lisäys : POST/museum
# - Taiteilijan lisäys: POST/artist
# - Taideteoksen lisäys: POST/artpiece

# - Museon muokkaus : PUT/museum/:id
# - Taiteilijat muokkaus : PUT/artist/:id
# - Taideteokset muokkaus : PUT/artpiece/:id

# - Taideteoksen poisto: DELETE /artpiece/:id
# - Museon poisto: DELETE /museum/:id
# - Taiteilijan poisto: DELETE /artist/:id

# - Koko datan haku GET /all/ (todellisessa elämässä vähän tyhmä)
# - Tietyn taideteoksen kaikki data GET /all/:id

# - Tietyn taiteilijan kaikkien teosten haku: GET /artist/:name
# - Taiteilijan haku GET /artist/:id

# Tekniset vaatimukset:

# - Docker

# - Node js v. 13.x tai uudempi

# - npm
# - yarn

# - MySQL kanta käytössä

#

# Konfiguraatio:
# (tähän kuvausta miten konfiguroidaan käyttöön - jos tarpeen)
# - oletusportti dockerilla 9000 && 9001 mysql
# - luo alustaessa pienen kannan ( src/fixtures/initDB.js )

# ===========================

echo "----------- Haetaan koodi versionhallinnasta"

git clone https://github.com/Jantero93/Tietokannat_Kurssi

cd Tietokannat_Kurssi/
pwd
echo; echo " ----------- Asennetaan sovellus"

cd backend/
yarn add --dev nodemon
cd ..
docker-compose build
echo; echo " ----------- Käynnistetään Docker"
docker-compose up -d
echo; echo " ----------- Toivottavasti Docker käynnisty....


# =============================================

## Perustiedot:

# - tuni-mail: jani.k.sillanpaa@tuni.fi

# - kuvaus: kanta sisältää tietoja taideteoksista

# - tekninen toteutus: Node.js, MySQL-kanta, Docker

# - Datan vienti ja tulostelu, esimerkit tiedostossa mitä pitäisi tulla



echo; echo " ----------- GET kaikki museo "
cle
echo; echo " ----------- GET kaikki taiteilijat "
curl http://localhost:9000/api/v1/artists # kaikki taiteilijat
echo; echo " ----------- GET kaikki taideteokset "
curl http://localhost:9000/api/v1/artpieces # kaikki taideteokset
echo; echo " ----------- GET kaikki koko data (turha)"
curl http://localhost:9000/api/v1/all # koko taiteilija data
echo; echo " ----------- GET kaikki data yhdestä taideteoksesta"
curl http://localhost:9000/api/v1/all/1 # tietyn taideteoksen koko data
echo; echo " ----------- GET nimellä kaikki taideteokset"
curl http://localhost:9000/api/v1/artists/name/Paul%20Gauguin # nimellä kyseisen henkilön kaikki taiteet

echo; echo "------------- POST museo & tulostus "

curl -i -X POST \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "museoNimi": "lisattyMuseo", "maa": "lisattyMaa", "kaupunki": "lisattyKaupunki" }' \
"http://localhost:9000/api/v1/museums"

curl http://localhost:9000/api/v1/museums/4

echo; echo "------------- POST taiteilija & tulostus "

curl -i -X POST \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "tekija": "lisattyTekija", "kansalaisuus": "lisattyKansalaisuus" }' \
"http://localhost:9000/api/v1/artists"

curl "http://localhost:9000/api/v1/artists/4"

echo; echo "------------- POST taideteos & tulostus "

curl -i -X POST \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "tekovuosi": "-900", "aihe": "lisattyAihe", "myyntihinta": "-99999", "taiteilijaFK": "1", "museoFK": "1", "teoksenNimi": "lisattyTeos" }' \
"http://localhost:9000/api/v1/artpieces"

curl http://localhost:9000/api/v1/artpieces/4

echo; echo "------------- PUT muokkaa lisatty museo"

curl -i -X PUT \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "museoNimi": "muutettuMuseo", "maa": "MUUTETTUMAA", "kaupunki": "MUUTETTUKAUPUNKI" }' \
"http://localhost:9000/api/v1/museums/4"

curl http://localhost:9000/api/v1/museums/4

echo; echo "------------- PUT muokkaa lisatty taiteilija"

curl -i -X PUT \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "tekija": "muutettuTekija", "kansalaisuus": "muutettuKansalaisuus" }' \
"http://localhost:9000/api/v1/artists/4"

curl http://localhost:9000/api/v1/artists/4

echo; echo "------------- PUT muokkaa lisatty taideteos"

curl -i -X PUT \
-H "Content-Type: application/json;charset=UTF-8" \
-d '{ "tekovuosi": "-900", "aihe": "muutettuAihe", "myyntihinta": "-99999", "taiteilijaFK": "2", "museoFK": "1", "teoksenNimi": "muutettuNimi" }' \
"http://localhost:9000/api/v1/artpieces/4"

curl http://localhost:9000/api/v1/artpieces/4

echo; echo "------------- DELETE edella lisatyt ja tulosta koko homma"

curl -i -X DELETE "http://localhost:9000/api/v1/artpieces/4"
curl http://localhost:9000/api/v1/artpieces/4

curl -i -X DELETE "http://localhost:9000/api/v1/museums/4"
curl -i -X DELETE "http://localhost:9000/api/v1/artists/4"

curl http://localhost:9000/api/v1/all 

exit

############# ESIMERKKI TULOSTE ################

KAIKKI MUSEOT
[{"museo_id":1,"museoNimi":"Yksityinen","maa":"","kaupunki":""},{"museo_id":2,"museoNimi":"Ateneum","maa":"Suomi","kaupunki":"Helsinki"},{"museo_id":3,"museoNimi":"Louvre","maa":"Ranska","kaupunki":"Pariisi"}]

KAIKKI TAITEILIJAT
[{"taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska"},{"taiteilija_id":2,"tekija":"Ferdinand von Wright","kansalaisuus":"Suomi"},{"taiteilija_id":3,"tekija":"Gustav Klimt","kansalaisuus":"Itävalta"}]

KAIKKI TAIDETEOKSET
[{"taideteos_id":1,"tekovuosi":1893,"aihe":"Henkilökuva","myyntihinta":12000000,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"Otahi"},{"taideteos_id":2,"tekovuosi":1892,"aihe":"Henkilökuva","myyntihinta":999999,"taiteilijaFK":1,"museoFK":2,"teoksenNimi":"When will you marry me"},{"taideteos_id":3,"tekovuosi":1886,"aihe":"eläin","myyntihinta":123123,"taiteilijaFK":2,"museoFK":2,"teoksenNimi":"taistelevat metsot"}]

KAIKKI TAIDEDATA
[{"taideteos_id":1,"tekovuosi":1893,"aihe":"Henkilökuva","myyntihinta":12000000,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"Otahi","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska","museo_id":1,"museoNimi":"Yksityinen","maa":"","kaupunki":""},{"taideteos_id":2,"tekovuosi":1892,"aihe":"Henkilökuva","myyntihinta":999999,"taiteilijaFK":1,"museoFK":2,"teoksenNimi":"When will you marry me","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska","museo_id":2,"museoNimi":"Ateneum","maa":"Suomi","kaupunki":"Helsinki"},{"taideteos_id":3,"tekovuosi":1886,"aihe":"eläin","myyntihinta":123123,"taiteilijaFK":2,"museoFK":2,"teoksenNimi":"taistelevat metsot","taiteilija_id":2,"tekija":"Ferdinand von Wright","kansalaisuus":"Suomi","museo_id":2,"museoNimi":"Ateneum","maa":"Suomi","kaupunki":"Helsinki"}]

TIETYN TAIDETEOKSEN KOKO DATA
{"taideteos_id":1,"tekovuosi":1893,"aihe":"Henkilökuva","myyntihinta":12000000,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"Otahi","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska","museo_id":1,"museoNimi":"Yksityinen","maa":"","kaupunki":""}

NIMELLÄ HAETTU TAITEILIJA JA SEN KOKO TAIDEDATA
[{"taideteos_id":1,"tekovuosi":1893,"aihe":"Henkilökuva","myyntihinta":12000000,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"Otahi","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska"},{"taideteos_id":2,"tekovuosi":1892,"aihe":"Henkilökuva","myyntihinta":999999,"taiteilijaFK":1,"museoFK":2,"teoksenNimi":"When will you marry me","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska"}]

LISÄTTY MUSEO JA HAETTU MUSEO
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
Location: localhost:9000/api/v1/todos/4
Content-Length: 89
Date: Mon, 07 Dec 2020 13:41:15 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"museo_id":4,"museoNimi":"lisattyMuseo","maa":"lisattyMaa","kaupunki":"lisattyKaupunki"}

LISÄTTY TAITEILIJA JA HAETTU TAITEILIJA
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
Location: localhost:9000/api/v1/todos/4
Content-Length: 81
Date: Mon, 07 Dec 2020 13:44:27 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"taiteilija_id":4,"tekija":"lisattyTekija","kansalaisuus":"lisattyKansalaisuus"}

LISÄTTY TAIDETEOS JA HAETTU
> -H "Content-Type: application/json;charset=UTF-8" \
> -d '{ "tekovuosi": "-900", "aihe": "lisattyAihe", "myyntihinta": "-99999", "taiteilijaFK": "1", "museoFK": "1", "teoksenNimi": "lisattyTeos" }' \
> "http://localhost:9000/api/v1/artpieces"
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
Location: localhost:9000/api/v1/todos/4
Content-Length: 134
Date: Mon, 07 Dec 2020 14:10:25 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"taideteos_id":4,"tekovuosi":-900,"aihe":"lisattyAihe","myyntihinta":-99999,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"lisattyTeos"}

MUUTETTU MUSEO (PUT)
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Content-Length: 92
Date: Mon, 07 Dec 2020 14:16:02 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"museo_id":4,"museoNimi":"muutettuMuseo","maa":"MUUTETTUMAA","kaupunki":"MUUTETTUKAUPUNKI"}

MUUTETTU TAITEILIJA (PUT)
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Content-Length: 83
Date: Mon, 07 Dec 2020 14:24:05 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"taiteilija_id":4,"tekija":"muutettuTekija","kansalaisuus":"muutettuKansalaisuus"}

MUUTETTU TAIDETEOS

HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Content-Length: 136
Date: Mon, 07 Dec 2020 14:29:14 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"taideteos_id":4,"tekovuosi":-900,"aihe":"muutettuAihe","myyntihinta":-99999,"taiteilijaFK":2,"museoFK":1,"teoksenNimi":"muutettuNimi"}

POISTA TAIDETEOS
HTTP/1.1 204 No Content
Date: Mon, 07 Dec 2020 14:30:43 GMT
Connection: keep-alive
Keep-Alive: timeout=5

POISTA MUSEO
HTTP/1.1 204 No Content
Date: Mon, 07 Dec 2020 14:32:12 GMT
Connection: keep-alive
Keep-Alive: timeout=5

POISTA TAITEILIJA
HTTP/1.1 204 No Content
Date: Mon, 07 Dec 2020 14:32:59 GMT
Connection: keep-alive
Keep-Alive: timeout=5

EI LÖYDY LISÄTTYJÄ ENÄÄ
[{"taideteos_id":1,"tekovuosi":1893,"aihe":"Henkilökuva","myyntihinta":12000000,"taiteilijaFK":1,"museoFK":1,"teoksenNimi":"Otahi","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska","museo_id":1,"museoNimi":"Yksityinen","maa":"","kaupunki":""},{"taideteos_id":2,"tekovuosi":1892,"aihe":"Henkilökuva","myyntihinta":999999,"taiteilijaFK":1,"museoFK":2,"teoksenNimi":"When will you marry me","taiteilija_id":1,"tekija":"Paul Gauguin","kansalaisuus":"Ranska","museo_id":2,"museoNimi":"Ateneum","maa":"Suomi","kaupunki":"Helsinki"},{"taideteos_id":3,"tekovuosi":1886,"aihe":"eläin","myyntihinta":123123,"taiteilijaFK":2,"museoFK":2,"teoksenNimi":"taistelevat metsot","taiteilija_id":2,"tekija":"Ferdinand von Wright","kansalaisuus":"Suomi","museo_id":2,"museoNimi":"Ateneum","maa":"Suomi","kaupunki":"Helsinki"}]



