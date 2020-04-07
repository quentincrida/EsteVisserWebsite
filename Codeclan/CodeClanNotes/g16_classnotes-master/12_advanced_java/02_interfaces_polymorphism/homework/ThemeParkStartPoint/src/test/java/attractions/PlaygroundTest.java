package attractions;

import org.junit.Before;
import org.junit.Test;
import people.Visitor;

import static org.junit.Assert.*;

public class PlaygroundTest {
    Playground playground;

    @Before
    public void setUp() throws Exception {
        playground = new Playground("Fun Zone", 7);
    }

    @Test
    public void hasName() {
        assertEquals("Fun Zone", playground.getName());
    }

    @Test
    public void hasRating() {
        assertEquals(7, playground.getRating());
    }

    @Test
    public void hasVisitCount() {
        assertEquals(0, playground.getVisitCount());
    }

    @Test
    public void isAllowed(){
        Visitor juniorVisitor = new Visitor(7, 1.22, 25);
        assertTrue(playground.isAllowed(juniorVisitor));

        Visitor tooOld = new Visitor(23, 150, 25);
        assertFalse(playground.isAllowed(tooOld));
    }
}
