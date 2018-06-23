package com.jjemson.cards;

/**
 * A Card represents a playing card.
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public class Card implements Cloneable {

    private Suit suit;
    private Rank rank;

    /**
     * Create a new card with the specified Suit and Face Value.
     * 
     * @param suit The suit of the card.
     * @param rank The face value of the card.
     */
    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
    }

    /**
     * Clones the card passed in.
     * 
     * @param card The card to clone
     */
    public Card(Card card) {
        this.suit = card.suit;
        this.rank = card.rank;
    }

    /**
     * Constructs a card from an encoded card byte array.
     * 
     * @param bytes A length 1 array of bytes representing a card.
     */
    public Card(byte[] bytes) {
        if (bytes.length != 1) {
            throw new IllegalArgumentException("Invalid byte array for an encoded card.");
        }
        byte encodedCard = bytes[0];
        int decodedRank = (encodedCard & 0x0F);
        int decodedSuit = (encodedCard & 0x30) >> 4;
        this.rank = Rank.getRank(decodedRank);
        this.suit = Suit.getSuit(decodedSuit);
    }

    /**
     * @return the suit.
     */
    public Suit getSuit() {
        return this.suit;
    }

    /**
     * @return the face value
     */
    public Rank getRank() {
        return rank;
    }

    public byte[] encode() {
        byte[] b = new byte[1];
        b[0] = (byte)((this.suit.rawValue() << 4 ) | (this.rank.rawValue()));
        return b;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.rank);
        builder.append(" of ");
        builder.append(this.suit);
        return builder.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) { return false; }
        if (!(obj instanceof Card)) { return false; }
        Card other = (Card)obj;

        return (this.suit == other.suit && this.rank == other.rank);
    }
}