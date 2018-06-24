"use strict";

const chai = require('chai');
const cards = require('../jjcards');
const expect = chai.expect;
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
    it('should encode and decode a Card', function(done) {
        let c = new cards.Card(cards.Suit.Heart, cards.Rank.Ace);
        let enc = c.encode();
        enc.should.equal(0x21);
        let dec = cards.Card.decode(enc);
        dec.suit.should.equal(cards.Suit.Heart);
        dec.rank.should.equal(cards.Rank.Ace);
        done();
    });

    it('should encode and decode a Deck', function(done) {
        let d = new cards.Deck();
        let enc = d.encode();
        enc[0].should.equal(0x01);
        let dec = cards.Deck.decode(enc);
        dec.deck.forEach(function(c2, i) {
            d.deck[i].suit.should.equal(c2.suit);
            d.deck[i].rank.should.equal(c2.rank);
        });
        done();
    });
});