import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Arrays2Test {
    Arrays2 arrays2;
    @Before
    public void before(){
        arrays2 = new Arrays2();
    }

//    @Test
//    public void sum28(){
//        int[] array1 = {2,3,2,2,4,2};
//        assertEquals(true, arrays2.sum28(array1));
//
//        int[] array2 = {2, 3, 2, 2, 4, 2, 2};
//        assertEquals(false, arrays2.sum28(array2));
//
//        int[] array3 = {1, 2, 3, 4};
//        assertEquals(false, arrays2.sum28(array3));
//    }

    @Test
    public void more14(){
        int[] array1 = {1,4,1};
        assertEquals(true, arrays2.more14(array1));
        int[] array2 = {1,4,1,4};
//        assertEquals(false, arrays2.more14(array2));
        int[] array3 = {1,1};
        assertEquals(true, arrays2.more14(array3));
    }

}
