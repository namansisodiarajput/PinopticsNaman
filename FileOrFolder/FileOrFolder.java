import java.io.File;

public class FileOrFolder {

    public static void main(String[] args) {
        File file = new File("E:/Students_Manual_Feb27.doc");
        File dir = new File("F:/3dprinter");
       
        
        System.out.println(file.isFile());
        System.out.println(dir.isDirectory());
        
       
    }

}