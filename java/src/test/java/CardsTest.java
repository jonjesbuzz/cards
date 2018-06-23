import org.junit.Test;
import static org.junit.Assert.*;

import com.jjemson.cards.Card;
import com.jjemson.cards.Deck;
import com.jjemson.cards.Rank;
import com.jjemson.cards.Suit;

public class CardsTest {
    @Test 
    public void testCardConstructor() {
        Card c = new Card(Suit.HEART, Rank.NINE);
        assertEquals(Suit.HEART, c.getSuit());
        assertEquals(Rank.NINE, c.getRank());
    }

    @Test
    public void printingTest() {
        Deck d = new Deck();
        System.out.println(d);
        Deck d2 = new Deck();
        assertEquals(d, d2);
    }

    @Test
    public void testCardEncode() {
        Card c = new Card(Suit.HEART, Rank.NINE);
        byte[] encoded = c.encode();
        assertEquals(encoded[0], 0x29);
        Card c2 = new Card(encoded);
        assertEquals(c, c2);
    }

    @Test
    public void testDeckEncode() {
        Deck d = new Deck();
        byte[] encoded = d.encode();
        Deck d2 = new Deck(encoded);
        assertEquals(d, d2);
    }
}
