# =============================================

## Perustiedot:

# - tuni-mail: jani.k.sillanpaa@tuni.fi

# - kuvaus: kanta sisältää tietoja taideteoksista

# - tekninen toteutus: Node.js, MySQL-kanta, Docker

#

# API-kuvaus:

#   - Taiteilijan lisäys: PUT/artist

#   - Taideteoksen lisäys: PUT /artpiece

#   - Taideteoksen poisto: DELETE /artpiece/:id

#   - Taiteilijan kaikkien teosten haku: GET /artist/artpieces

#   - Taiteilijan haku GET /artist/:id

#   - Taideteoksen muokkaus: POST /artpiece

#   - ...

#

# Tekniset vaatimukset:

# (-  Docker)

# - Node js v. 13.x tai uudempi

# - npm

# - MariaDb tai MySQL kanta käytössä

#

# Konfiguraatio:
# (tähän kuvausta miten konfiguroidaan käyttöön - jos tarpeen)

# - Tietokannan tiedot (db.js) - jos vaatii ulkoisen kannan

# - oletusportti: 9000 (server.js)
# - kannan luontilauseet: luo alustaessa pienen kannan ( src/fixtures/initDB.js )

# ===========================