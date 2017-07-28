# meshblu-encryption
A library for common encryption functions in Meshblu.

[![Build Status](https://travis-ci.org/octoblu/meshblu-encryption.svg?branch=master)](https://travis-ci.org/octoblu/meshblu-encryption)
[![Code Climate](https://codeclimate.com/github/octoblu/meshblu-encryption/badges/gpa.svg)](https://codeclimate.com/github/octoblu/meshblu-encryption)
[![Test Coverage](https://codeclimate.com/github/octoblu/meshblu-encryption/badges/coverage.svg)](https://codeclimate.com/github/octoblu/meshblu-encryption)
[![npm version](https://badge.fury.io/js/meshblu-encryption.svg)](http://badge.fury.io/js/meshblu-encryption)
[![Gitter](https://badges.gitter.im/octoblu/help.svg)](https://gitter.im/octoblu/help)

# Usage
### Install:
```shell
npm install --save meshblu-encryption
```

### Use:
```javascript
var MeshbluEncryption = require('meshblu-encryption');

var meshbluEncryption = new MeshbluEncryption();

meshbluEncryption.register({}, function(error, response) {
  // code goes here
})
```

# Functions
### Constructor
| Parameter | Type    | Required | Description                          |
| ----------| --------| ---------| -------------------------------------|
| nodeRsa   | NodeRSA | yes      | NodeRSA instance |
------------------------------------------
```javascript
NodeRSA = require('node-rsa')
nodeRsa = new NodeRSA pem
var meshbluEncryption = new MeshbluEncryption({ nodeRsa })
```

### fromPem
| Parameter | Type    | Required | Description                          |
| ----------| --------| ---------| -------------------------------------|
| pem       | string  | yes      | text of a private key in pem format  |
------------------------------------------
```javascript
var meshbluEncryption = MeshbluEncryption.fromPem('--pem-data--')
```

### fromJustGuess
Will try to guess the format of the provided string and convert it to a nodeRSA object.

| Parameter | Type    | Required | Description                          |
| ----------| --------| ---------| -------------------------------------|
| thing     | string  | yes      | text of a private key in some format  |
------------------------------------------
```javascript
var meshbluEncryption = MeshbluEncryption.fromJustGuess('--pem-data--')
```

### decrypt
Will decrypt the given data and return the unencrypted value, expects stringified JSON in base64.

| Parameter | Type   | Required| Description                          |
| ----------| -------| --------| -------------------------------------|
| data      |string  | yes     | the string to decrypt |
------------------------------------------
```javascript
var decryptedData = meshbluEncryption.decrypt('encrypted-string')
```

### encrypt
Will convert the given data to a JSON string, encrypt, and return a base64 encoded encrypted string

| Parameter | Type   | Required| Description                          |
| ----------| -------| --------| -------------------------------------|
| data      |string  | yes     | the string to encrypt |
------------------------------------------
```javascript
var encryptedData = meshbluEncryption.encrypt('string')
```

### sign
Will convert the given data to a JSON string, and return a signature for that data

| Parameter | Type   | Required| Description                          |
| ----------| -------| --------| -------------------------------------|
| data      |string  | yes     | the string to sign |
------------------------------------------
```javascript
var signature = meshbluEncryption.sign('string')
```

### verify
Will verify a signature for the given data

| Parameter | Type   | Required| Description                          |
| ----------| -------| --------| -------------------------------------|
| data      |string  | yes     | the string to verify |
| signature |string  | yes     | the signature to verify |
------------------------------------------
```javascript
var isValid = meshbluEncryption.verify('encrypted-string', 'signature')
```
