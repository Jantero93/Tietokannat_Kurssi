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

# - MySQL kanta käytössä

#

# Konfiguraatio:
# (tähän kuvausta miten konfiguroidaan käyttöön - jos tarpeen)

# - Tietokannan tiedot (db.js) - jos vaatii ulkoisen kannan

# - oletusportti: 9000 (server.js)
# - kannan luontilauseet: luo alustaessa pienen kannan ( src/fixtures/initDB.js )

# ===========================