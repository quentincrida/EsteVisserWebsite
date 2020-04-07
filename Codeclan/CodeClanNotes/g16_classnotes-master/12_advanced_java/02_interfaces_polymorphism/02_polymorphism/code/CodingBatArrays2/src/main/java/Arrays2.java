public class Arrays2 {

//    public boolean sum28(int[] nums) {
//        int sum = 0;
//        for (int i = 0; i < nums.length; i++) {
//            if (nums[i] == 2) {
//                sum = sum + nums[i];
//
//                if (sum != 8) {
//                    return false;
//                }
//            }
//            return true;
//
//        }

    public boolean more14(int[] nums) {
        int countA = 0;
        int countB = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1){
                countA++;}
                 if (nums[i] == 2) {
                    countB++;
                     }
            if ((countA - countB) >= 0) {
                return true;

                } else {
                        return false;
                    }
                }
                 return true;
            }
        }






