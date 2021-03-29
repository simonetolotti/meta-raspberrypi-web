#!/bin/sh
echo "Script on /etc/emc-test"
echo ""
echo "TPM Random"
tpm2_getrandom 8 | xxd -p
tpm2_getrandom 16 | xxd -p
tpm2_getrandom 32 | xxd -p
tpm2_getrandom 48 | xxd -p
echo ""
echo "TPM Generate Key"
tpm2tss-genkey -a rsa /tmp/private.tss
cat /tmp/private.tss
echo ""
echo "TPM Tss-engine"
openssl engine -t -c tpm2tss
openssl rand -engine tpm2tss -hex 10
openssl rand -engine tpm2tss -hex 16
echo ""
echo "TPM RSA 2048"
tpm2tss-genkey -a rsa -s 2048 /tmp/mykey
openssl rsa -engine tpm2tss -inform engine -in /tmp/mykey -pubout -outform pem -out /tmp/mykey.pub
cat /tmp/mykey.pub
echo ""
echo "TPM ECDSA"
tpm2tss-genkey -a ecdsa /tmp/mykey
openssl ec -engine tpm2tss -inform engine -in /tmp/mykey -pubout -outform pem -out /tmp/mykey.pub
cat /tmp/mykey.pub
