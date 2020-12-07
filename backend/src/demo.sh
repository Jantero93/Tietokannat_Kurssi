# =============================================

## Perustiedot:

# - tuni-mail: jani.k.sillanpaa@tuni.fi

# - kuvaus: kanta sisältää tietoja taideteoksista

# - tekninen toteutus: Node.js, MySQL-kanta, Docker

#

# API-kuvaus:

#   - Museon lisäys : POST/museum
#   - Taiteilijan lisäys: POST/artist
#   - Taideteoksen lisäys: POST/artpiece

#   - Museon muokkaus : PUT/museum/:id
#   - Taiteilijat muokkaus : PUT/artist/:id
#   - Taideteokset muokkaus : PUT/artpiece/:id

  
#   - Taideteoksen poisto: DELETE /artpiece/:id
#   - Museon poisto: DELETE /museum/:id
#   - Taiteilijan poisto:  DELETE /artist/:id

#   - Koko datan haku GET /all/ (todellisessa elämässä vähän tyhmä)
#   - Tietyn taideteoksen kaikki data GET /all/:id

#   - Tietyn taiteilijan kaikkien teosten haku: GET /artist/:name
#   - Taiteilijan haku GET /artist/:id

# Tekniset vaatimukset:

# -  Docker

# - Node js v. 13.x tai uudempi

# - npm
# - yarn

# - MySQL kanta käytössä

#

# Konfiguraatio:
# (tähän kuvausta miten konfiguroidaan käyttöön - jos tarpeen)

# - Tietokannan tiedot (db.js) - jos vaatii ulkoisen kannan

# - oletusportti: 9000 (server.js)
# - kannan luontilauseet: luo alustaessa pienen kannan ( src/fixtures/initDB.js )

# ===========================

echo  "----------- Haetaan koodi versionhallinnasta"

git clone https://gitlab.tamk.cloud/Jani/tietokanta

cd tietokanta/
pwd
echo; echo " ----------- Asennetaan sovellus"

cd backend/
yarn add --dev nodemon
cd ..
docker-compose build
docker-compose up




npm -g install
docker-compose up


echo; echo " ----------- Käynnistetään palvelin"

# npm start
node index.js &


echo; echo " ----------- Viedään kantaan dataa:"

curl -X PUT -H "Content-Type: application/json;charset=UTF-8" -d '{ "email": "eric@hope.com", "name": "Eric" }' "http://localhost:3000/newuser"

echo; echo " ----------- Tehdään hakuja:"

curl -X GET -H "Content-Type: application/json;charset=UTF-8" "http://localhost:3000/user/2"

echo; echo " ----------- Muutetaan dataa"

curl -X POST -H "Content-Type: application/json;charset=UTF-8" -d '{ "address": "Street 7" }' "http://localhost:3000/user/2"

echo; echo " ----------- Poistetaan dataa"

curl -X DELETE -H "Content-Type: application/json;charset=UTF-8" "http://localhost:3000/user/2"

echo; echo " ----------- Todetaan, että muutokset menivät perille:"

curl -X GET -H "Content-Type: application/json;charset=UTF-8" "http://localhost:3000/user/2"

echo; echo " ----------- THE END ------------"

exit