import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Tester {
    public static void main(String[] args) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insurance_renewal?useSSL=false&serverTimezone=Asia/Kolkata&allowPublicKeyRetrieval=true", "root", "root@123");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT CONSTRAINT_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = 'insurance_renewal' AND TABLE_NAME = 'policies'");
            while (rs.next()) {
                System.out.println(rs.getString(1) + " | " + rs.getString(2));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
