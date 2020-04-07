package attractions;

import org.junit.Before;
import org.junit.Test;
import people.Visitor;

import static org.junit.Assert.*;

public class RollercoasterTest {

    RollerCoaster rollerCoaster;

    @Before
    public void setUp() {
        rollerCoaster = new RollerCoaster("Blue Ridge", 10);
    }

    @Test
    public void hasName() {
        assertEquals("Blue Ridge", rollerCoaster.getName());
    }

    @Test
    public void hasRating() {
        assertEquals(10, rollerCoaster.getRating());
    }

    @Test
    public void hasVisitCount() {
        assertEquals(0, rollerCoaster.getVisitCount());
    }

    @Test
    public void isAllowed(){
        Visitor youngShort = new Visitor(11, 100, 12);
        assertFalse(rollerCoaster.isAllowed(youngShort));
        Visitor youngTall = new Visitor(11, 150, 12);
        assertFalse(rollerCoaster.isAllowed(youngTall));

        Visitor oldTall = new Visitor(19, 146, 12);
        assertTrue(rollerCoaster.isAllowed(oldTall));
    }

    @Test
    public void getPrice(){
        Visitor youngShort = new Visitor(11, 100, 12);
            assertEquals(8.40, rollerCoaster.getPrice(youngShort), 0.01);
        Visitor  youngTall = new Visitor(11, 150, 12);
        assertEquals(16.8, rollerCoaster.getPrice(youngTall), 0.01);
    }
}
