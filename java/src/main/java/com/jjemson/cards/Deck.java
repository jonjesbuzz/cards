package com.jjemson.cards;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;


/**
 * A Deck is a set of 52 playing cards.
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public class Deck {
    private static final int NUM_CARDS = 52;
    private List<Card> deck;

    public Deck() {
        this.deck = new ArrayList<>(NUM_CARDS);
        Suit suit;
        Rank rank;
        for (int s = 0; s < 4; s++) {
            suit = Suit.getSuit(s);
            for (int v = 1; v <= 13; v++) {
                rank = Rank.getRank(v);
                deck.add(new Card(suit, rank));
            }
        }
    }

    public Deck(byte[] encoded) {
        if (encoded.length > NUM_CARDS) {
            throw new IllegalArgumentException("Encoded deck byte array is not valid.");
        }
        this.deck = new ArrayList<>(encoded.length);
        Card c = null;
        for (byte b : encoded) {
            c = new Card(new byte[]{b});
            this.deck.add(c);
        }
    }
    
    /**
     * Shuffles the deck of cards.
     * 
     * @param randomCount Number of shuffles to perform.
     */
    public void shuffle(int randomCount) {
        Random random = new Random();
        int a = 0;
        int b = 0;
        for (int i = 0; i < randomCount; i++) {
            a = i % NUM_CARDS;
            do {
                b = random.nextInt(NUM_CARDS);
            } while (a == b);
            Card aCard = deck.set(a, deck.get(b));
            deck.set(b, aCard);
        }
    }

    public byte[] encode() {
        byte[] encoded = new byte[deck.size()];
        int i = 0;
        for (Card c : deck) {
            encoded[i++] = c.encode()[0];
        }
        return encoded;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder(16 * NUM_CARDS);
        Iterator<Card> cardIterator = deck.iterator();
        for (int i = 0; i < deck.size(); i++) {
            builder.append(cardIterator.next());
            if (i % 4 == 3) {
                builder.append('\n');
            } else {
                builder.append('\t');
            }
        }
        return builder.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) { return false; };
        if (!(obj instanceof Deck)) { return false; };
        Deck other = (Deck)obj;
        return this.deck.equals(other.deck);
    }
}