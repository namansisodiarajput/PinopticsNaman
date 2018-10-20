class TowerOfHanoi
{ 
   
    static void towerOfHanoi(int n, char fromrod, char torod, char auxrod) 
    { 
        if (n == 1) 
        { 
            System.out.println("Move disk 1 from rod " +  fromrod + " to rod " + torod); 
            return; 
        } 
        towerOfHanoi(n-1, fromrod, auxrod, torod); 
        System.out.println("Move disk " + n + " from rod " +  fromrod + " to rod " + torod); 
        towerOfHanoi(n-1, auxrod, torod, fromrod); 
    } 
      
    //  Driver method 
    public static void main(String args[]) 
    { 
        int n = 3; // Number of disks 
        towerOfHanoi(n, 'A', 'C', 'B');  // A, B and C are names of rods 
    } 
} 