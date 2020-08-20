const { BN } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');;

const WindsCoinToken = artifacts.require('WindsCoinToken');

contract('WindsCoinToken - Detail', accounts => {
  const _name = 'WindsCoin';
  const _symbol = 'WDS';
  const _decimals = new BN(18);

  beforeEach(async function() {
    this.detailedERC20 = await WindsCoinToken.new(accounts[0]);
  });

  it('has a name', async function() {
    const name = await this.detailedERC20.name();
    expect(name).to.equal(_name);
  });

  it('has a symbol', async function() {
    const symbol = await this.detailedERC20.symbol();
    expect(symbol).to.equal(_symbol);
  });

  it('has an amount of decimals', async function() {
    const decimals = await this.detailedERC20.decimals();
    expect(decimals).to.be.bignumber.equal(_decimals);
  });
});
