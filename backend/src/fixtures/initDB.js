import mysql from 'mysql2/promise';

import { connectionSettings } from '../settings';

export default async () => {
  const conn = await mysql.createConnection(connectionSettings);
  try {
    await conn.execute(`
        SELECT *
        FROM test_table
      `);
  } catch (error) {
    // If table does not exist, create it
    if (error.errno === 1146) {
      console.log('Initializing table: test_table');
      await conn.execute(`
        CREATE TABLE test_table (
          id int UNSIGNED NOT NULL AUTO_INCREMENT,
          field_1 varchar(255) NOT NULL,
          field_2 int,
          PRIMARY KEY (id)
        )
      `);
      console.log('...success!');
    }
  }
  try {
    await conn.execute(`
        SELECT *
        FROM todos
      `);
  } catch (error) {
    // If table does not exist, create it
    if (error.errno === 1146) {
      console.log('Initializing table: todos');
      await conn.execute(`
        CREATE TABLE todos (
          id int UNSIGNED AUTO_INCREMENT,
          text varchar(256) NOT NULL,
          done bool DEFAULT false,
          PRIMARY KEY (id)
        )
      `);
      console.log('...success!');
    }
  }
  try {
    await conn.execute(`
        SELECT *
        FROM museot
      `);
  } catch (error) {
    // If table does not exist, create it
    if (error.errno === 1146) {
      console.log('Initializing table: museot');
      await conn.execute(`
      CREATE TABLE museot (
        museo_id int UNSIGNED AUTO_INCREMENT,
        museoNimi varchar(100) NOT NULL,
        maa varchar(100),
        kaupunki varchar(100),
        PRIMARY KEY (museo_id)
        )
      `);
      await conn.execute(`
      INSERT INTO museot (museo_id, museoNimi, maa, kaupunki)
        VALUES ("1", "Yksityinen", "", ""),
        ("2", "Ateneum", "Suomi", "Helsinki"),
        ("3", "Louvre", "Ranska", "Pariisi")
      `);
      console.log('...success!');
    }
  }
  try {
    await conn.execute(`
        SELECT *
        FROM taiteilijat
      `);
  } catch (error) {
    // If table does not exist, create it
    if (error.errno === 1146) {
      console.log('Initializing table: taiteilijat');
      await conn.execute(`
      CREATE TABLE taiteilijat (
        taiteilija_id int UNSIGNED AUTO_INCREMENT,
        tekija varchar(100) NOT NULL,
        kansalaisuus varchar(100),
        PRIMARY KEY (taiteilija_id)
        )
      `);
      await conn.execute(`
      INSERT INTO taiteilijat (taiteilija_id, tekija, kansalaisuus)
        VALUES ("1", "Paul Gauguin", "Ranska"),
        ("2", "Ferdinand von Wright", "Suomi"),
        ("3", "Gustav Klimt", "Itävalta")
      `);
      console.log('...success!');
    }
  }
  try {
    await conn.execute(`
        SELECT *
        FROM taideteokset
      `);
  } catch (error) {
    // If table does not exist, create it
    if (error.errno === 1146) {
      console.log('Initializing table: taideteokset');
      await conn.execute(`
      CREATE TABLE taideteokset (
        taideteos_id int UNSIGNED AUTO_INCREMENT,
        tekovuosi int,
        aihe varchar(100),
        myyntihinta double,
        taiteilijaFK int UNSIGNED,
        museoFK int UNSIGNED,
        teoksenNimi varchar(200),
        PRIMARY KEY (taideteos_id),
        FOREIGN KEY (taiteilijaFK) REFERENCES taiteilijat(taiteilija_id),
        FOREIGN KEY (museoFK) REFERENCES museot(museo_id)
        )
      `);
      await conn.execute(`
      INSERT INTO taideteokset (taideteos_id, tekovuosi, aihe, myyntihinta, taiteilijaFK, museoFK, teoksenNimi)
        VALUES 
        ("1", "1893", "Henkilökuva", "12000000", "1", "1", "Otahi"),
        ("2", "1892", "Henkilökuva", "999999", "1","2", "When will you marry me"),
        ("3", "1886", "eläin", "123123", "2","2","taistelevat metsot")
      `);
      console.log('...success!');
    }
  }
};
