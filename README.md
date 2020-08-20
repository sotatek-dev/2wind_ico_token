# README

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for?

- Quick summary

* Create a new Two Winds Token ERC20
* Run test & verify token on the network
* Depend on open zeppelin 2.5.0
  https://github.com/OpenZeppelin/openzeppelin-contracts/tree/release-v2.5.0/contracts

- Version: `1.0.0`
- [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up?

- Summary of set up

```
rm -rf node_modules && rm -f package-lock.json
npm i
```

- Configuration
- Dependencies

* Ganache: https://www.trufflesuite.com/ganache

- Database configuration
- How to run tests

* Install ganache first, and run the below command then:
```
npm run ganache-test
```

- Deployment instructions

* For rinkeby network:

```
npm run deploy-rinkeby
```

* For mainnet:

```
npm run deploy-mainnet
```

- How to verify the Social Good smart contracts

* For rinkeby network:

```
npm run verify-rinkeby
```

* For mainnet:

```
npm run verify-mainnet
```

### Contribution guidelines

- Writing tests
- Code review
- Other guidelines

### Who do I talk to?

- Repo owner or admin
- Other community or team contact
