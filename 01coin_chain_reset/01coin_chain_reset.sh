#!/bin/bash
COIN_FOLDER="/root/.zeroonecore"
BLOCKCHAIN_ARCHIVE_GZ="chain_01coin.tar.gz"
BLOCKCHAIN_ARCHIVE="chain_01coin.tar"
service zerooned stop
rm -rf ${COIN_FOLDER}/zerooned.pid
rm -rf ${COIN_FOLDER}/backups
rm -rf ${COIN_FOLDER}/banlist.dat
rm -rf ${COIN_FOLDER}/blocks
rm -rf ${COIN_FOLDER}/chainstate
rm -rf ${COIN_FOLDER}/database
rm -rf ${COIN_FOLDER}/db.log
rm -rf ${COIN_FOLDER}/debug.log
rm -rf ${COIN_FOLDER}/mempool.dat
rm -rf ${COIN_FOLDER}/mncache.dat
rm -rf ${COIN_FOLDER}/mnpayments.dat
rm -rf ${COIN_FOLDER}/peers.dat
gzip -d ${COIN_FOLDER}/${BLOCKCHAIN_ARCHIVE_GZ}
tar -xvf ${COIN_FOLDER}/${BLOCKCHAIN_ARCHIVE} -C ${COIN_FOLDER}
rm ${COIN_FOLDER}/{BLOCKCHAIN_ARCHIVE}
service zerooned start
