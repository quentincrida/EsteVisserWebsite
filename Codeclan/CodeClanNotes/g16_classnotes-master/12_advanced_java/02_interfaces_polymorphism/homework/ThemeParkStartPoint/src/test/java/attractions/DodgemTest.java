package attractions;

import org.junit.Before;
import org.junit.Test;
import people.Visitor;

import static org.junit.Assert.assertEquals;

public class DodgemTest {

    Dodgems dodgems;

    @Before
    public void setUp() throws Exception {
        dodgems = new Dodgems("Bumper Cars", 5);
    }


    @Test
    public void hasName() {
        assertEquals("Bumper Cars", dodgems.getName());
    }

    @Test
    public void hasRating() {
        assertEquals(5, dodgems.getRating());
    }

    @Test
    public void hasVisitCount() {
        assertEquals(0, dodgems.getVisitCount());
    }

    @Test
    public void getPrice(){
        Visitor underTwelve = new Visitor(11, 145, 12);
        Visitor overTwelve = new Visitor(12, 120, 10);
        assertEquals(2.25, dodgems.priceFor(underTwelve), 0.01);
        assertEquals(4.50, dodgems.priceFor(overTwelve), 0.01);
    }
}
