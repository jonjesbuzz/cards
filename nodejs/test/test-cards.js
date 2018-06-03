"use strict";

const chai = require('chai');
const cards = require('../jjcards');
const should = chai.should();

describe('Cards', function() {
    it('should create a Deck', function(done) {
        let d = new cards.Deck();
        console.log(d.toString());
        d.deck[0].suit.should.equal(cards.Suit.Spade);
        d.deck[0].rank.should.equal(cards.Rank.Ace);
        done();
    });
    it('should shuffle a Deck', function(done) {
        let d = new cards.Deck();
        d.shuffle();
        console.log(d.toString());
        done();
    });
});