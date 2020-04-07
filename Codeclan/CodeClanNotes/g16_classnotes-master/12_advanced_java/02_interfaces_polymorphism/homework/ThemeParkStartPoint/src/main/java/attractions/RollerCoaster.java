package attractions;

import behaviours.ISecurity;
import people.Visitor;

public class RollerCoaster  extends Attraction implements ISecurity {

    public RollerCoaster(String name, int rating) {
        super(name, rating);
    }

    public boolean isAllowed(Visitor visitor) {
        return visitor.getHeight() > 145 && visitor.getAge() > 12 ;
    }
    public double regularPrice(){
        return 8.40;
    }
    public double getPrice(Visitor visitor){
       if(visitor.getHeight() > 145){
         return  regularPrice() * 2;
       }
       return regularPrice();
    }

}
